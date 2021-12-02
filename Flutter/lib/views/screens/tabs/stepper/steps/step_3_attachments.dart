import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_helpers/app_logger.dart';
import 'package:flutter_app/controllers/managers/validator_controller.dart';
import 'package:flutter_app/providers/stepper_provider.dart';
import 'package:flutter_app/views/style/app_dimensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

enum ImageType { personal, nationalIdFront, nationalIdBack, passport }

class StepThreeAttachments extends StatefulWidget {
  StepThreeAttachments({Key? key}) : super(key: key);

  @override
  State<StepThreeAttachments> createState() => _StepThreeAttachmentsState();
}

class _StepThreeAttachmentsState extends State<StepThreeAttachments> {
  late StepperProvider _stepperProvider;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _stepperProvider = Provider.of<StepperProvider>(context, listen: false);
    _stepperProvider.setCurrentFormKey(_formKey);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StepperProvider, String?>(
        selector: (_, provider) => provider.stepperForm.nationality,
        builder: (_, selectedNationality, __) {
          bool showNationalCard = _stepperProvider.stepperForm.nationality == 'Egyptian';
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.convertToW(30)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Selector<StepperProvider, File?>(
                        selector: (_, provider) => provider.stepperForm.personalImage,
                        builder: (_, personalImageFile, __) {
                          String title = "Personal Picture";
                          return _buildImagePickAndPreviewWidget(
                              ImageType.personal, personalImageFile, title, true);
                        }),
                    Selector<StepperProvider, File?>(
                        selector: (_, provider) => provider.stepperForm.nationaIdFrontImage,
                        builder: (_, nationaIdFrontImageFile, __) {
                          String title = 'Copy of the national ID card (front)';
                          return _buildImagePickAndPreviewWidget(ImageType.nationalIdFront,
                              nationaIdFrontImageFile, title, showNationalCard);
                        }),
                    Selector<StepperProvider, File?>(
                        selector: (_, provider) => provider.stepperForm.nationaIdBackImage,
                        builder: (_, nationaIdBackImageFile, __) {
                          String title = 'Copy of the national ID card (back)';

                          return _buildImagePickAndPreviewWidget(ImageType.nationalIdBack,
                              nationaIdBackImageFile, title, showNationalCard);
                        }),
                    Selector<StepperProvider, File?>(
                        selector: (_, provider) => provider.stepperForm.passportImage,
                        builder: (_, passportImageFile, __) {
                          String title = 'Passport copy';
                          return _buildImagePickAndPreviewWidget(
                              ImageType.passport, passportImageFile, title, !showNationalCard);
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildImagePickAndPreviewWidget(ImageType type, File? file, title, showNationalCard) {
    if (!showNationalCard) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDimensions.convertToH(20)),
        Text(title),
        SizedBox(height: AppDimensions.convertToH(10)),
        if (file != null)
          Container(
            height: 200,
            child: Image.file(file, fit: BoxFit.cover),
          ),
        Stack(
          alignment: Alignment.center,
          children: [
            TextFormField(
              readOnly: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(text: file?.path),
              cursorColor: Colors.transparent,
              decoration: InputDecoration(
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
              ),
              style: TextStyle(color: Colors.transparent),
              textAlign: TextAlign.center,
              validator: (value) => Validator.hasValue(value) ? null : "This Field is Required",
              onTap: () => _onImageButtonPressed(context, type),
              onSaved: (v) {},
            ),
            Positioned(
              child: Text(
                'Take A Picture',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ],
    );
  }

  void _onImageButtonPressed(context, type) async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((image) async {
      if (image != null && await File(image.path).exists()) {
        File imageFile = File(image.path);
        _stepperProvider.setAttachments(type, imageFile);
      } else {
        AppLogger.logToConsole("image not selected");
      }
    }).catchError((error, stackTrace) {
      AppLogger.logErrorToConsole('_onImageButtonPressed', error, stackTrace);
    });
  }
}
