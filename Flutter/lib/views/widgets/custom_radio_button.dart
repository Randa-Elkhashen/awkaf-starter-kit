import 'package:flutter/material.dart';
import 'package:flutter_app/views/view_helpers/app_colors.dart';
import 'package:flutter_app/views/view_helpers/app_dimensions.dart';

class CustomRadioButtonProps {
  bool isSelected;
  CustomRadioButtonProps({required this.isSelected});
}

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({Key? key, required this.props}) : super(key: key);
  final CustomRadioButtonProps props;
  @override
  Widget build(BuildContext context) {

    return Container(
        height: AppDimensions.convertToH(20),
        width: AppDimensions.convertToH(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.convertToH(10)),
          ),
          border: Border.all(
              width: 1, color: props.isSelected ? AppColors.orange : AppColors.lightGrey),
        ),
        child: Center(
          child: props.isSelected
              ? Container(
                  height: AppDimensions.convertToH(12),
                  width: AppDimensions.convertToH(12),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.convertToH(6)),
                    ),
                  ),
                )
              : Container(),
        ));
  }
}
