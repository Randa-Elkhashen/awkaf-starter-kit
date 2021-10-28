import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/view_models/stepper_form_view_model.dart';
import 'package:flutter_app/views/screens/tabs/stepper/stepper_screen.dart';
import 'package:flutter_app/views/screens/tabs/stepper/steps/step_1_basic_info.dart';
import 'package:flutter_app/views/screens/tabs/stepper/steps/step_2_details.dart';
import 'package:flutter_app/views/screens/tabs/stepper/steps/step_3_attachments.dart';

class StepperProvider extends ChangeNotifier {
  int currentStepIndex = 1;
  StepperFormViewModel stepperForm = StepperFormViewModel();
  bool isLastStep = false;
  bool isSubmittedForm = false;
  List<String> nationalityStringList = [];
  GlobalKey<FormState> formKeyStep = GlobalKey<FormState>();

  // DATA
  List<FormStep> _steps = <FormStep>[
    FormStep(
      id: 1,
      title: 'Basic Information',
      stepWidget: StepOneBasicInfo(),
    ),
    FormStep(
      id: 2,
      title: 'Details of the idea',
      stepWidget: StepTwoDetails(),
    ),
    FormStep(
      id: 3,
      title: 'Attachments',
      stepWidget: StepThreeAttachments(),
    ),
  ];
  List<FormStep> get steps => _steps;

  moveNext(index) {
    if (saveStepData()) {
      if (index <= _steps.length) {
        currentStepIndex = index;
        if (index == _steps.length) isLastStep = true;
      } else
        _submitForm();
      notifyListeners();
    }
  }

  _submitForm() {
    isSubmittedForm = true;
    notifyListeners();
  }

  moveBack(index) {
    isLastStep = false;
    if (index >= 1) currentStepIndex = index;
    notifyListeners();
  }

  // start the form from step 1
  reset() {
    isSubmittedForm = false;
    isLastStep = false;
    currentStepIndex = 1;
    stepperForm = StepperFormViewModel();
    notifyListeners();
  }

  // ** STEP 1
  readnationalityListFromJson() async {
    nationalityStringList = [];
    final String response = await rootBundle.loadString('./assets/nationality.json');
    final data = await json.decode(response);
    for (var item in data) nationalityStringList.add(item['nationality']);
    notifyListeners();
  }

  setCurrentFormKey(formKey) {
    formKeyStep = formKey;
  }

  setSelectedNationality(String nationality) {
    stepperForm.nationality = nationality;
    notifyListeners();
  }

  bool saveStepData() {
    if (!formKeyStep.currentState!.validate()) return false;
    formKeyStep.currentState!.save();
    return true;
  }

  // ** STEP 3
  setAttachments(ImageType type, fileImage) {
    switch (type) {
      case ImageType.personal:
        stepperForm.personalImage = fileImage;
        break;
      case ImageType.nationalIdFront:
        stepperForm.nationaIdFrontImage = fileImage;
        break;
      case ImageType.nationalIdBack:
        stepperForm.nationaIdBackImage = fileImage;
        break;
      case ImageType.passport:
        stepperForm.passportImage = fileImage;
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
