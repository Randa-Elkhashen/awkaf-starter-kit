import 'package:flutter/material.dart';
import 'package:flutter_app/providers/stepper_provider.dart';
import 'package:flutter_app/view_models/stepper_form_view_model.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';

import 'package:provider/provider.dart';

// FOR TEST DATA SUBMITION
class FormSubmittedWidget extends StatelessWidget {
  const FormSubmittedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Form Submitted Successfully"),
          Selector<StepperProvider, StepperFormViewModel>(
              selector: (_, provider) => provider.stepperForm,
              builder: (_, stepperForm, __) {
                return Text(stepperForm.toString());
              }),
          AppButton(
            text: 'Reset',
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => Provider.of<StepperProvider>(context, listen: false).reset(),
          )
        ],
      ),
    );
  }
}
