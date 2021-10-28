import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/managers/validator_controller.dart';
import 'package:flutter_app/view_models/user.dart';
import 'package:flutter_app/views/screens/tabs/auth_and_profile/profile/user_profile_screen.dart';
import 'package:flutter_app/views/screens/tabs/auth_and_profile/sign_up_screen.dart';
import 'package:flutter_app/views/screens/tabs/auth_and_profile/verify_email_screen.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
import 'package:flutter_app/views/widgets/buttons/app_text_button.dart';
import 'package:flutter_app/views/widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/widgets/text_field/app_text_form_field.dart';

class SignInPage extends StatefulWidget {
  static final String id = "/sign-in";
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late Size _size;
  bool _hidePassword = true;
  bool _isLoading = false;
  User _user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: LoadingManager(
          isLoading: _isLoading,

          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 16 ,
              horizontal: 32 ,
            ),
            child: Column(
              children: [
                SizedBox(height: _size.height/10,),
                ATextFormField(
                  label: "Email",
                  initialValue: _user.email,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator.isEmail(value)
                      ? null : "Invalid email",
                  onSaved: (value){
                    _user.email = value;
                  },
                ),
                SizedBox(height: 16 ,),
                ATextFormField(
                  label: "password",
                  initialValue: _user.password,
                  obscureText: _hidePassword,
                  suffixIcon: MaterialButton(
                    padding: EdgeInsets.zero,
                    minWidth: 26,
                    child: Icon(
                      _hidePassword
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      //color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: (){
                      _hidePassword = !_hidePassword;
                      setState(() {});
                    },
                  ),
                  validator: (value) => Validator.isValidPassword(value)
                      ? null : "Password too short",
                  onSaved: (value){
                    _user.password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTextButton(
                      text: "Forget Password?",
                      onPressed: (){
                        Navigator.of(context).pushNamed(VerifyEmailPage.id);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 32 ,),
                SizedBox(
                  width: _size.width / 1.5,
                  child: AppButton(
                    text: "Sign In",
                    onPressed: () async {
                      if(!_formKey.currentState!.validate())
                        return;
                      _formKey.currentState?.save();

                      _isLoading = true;
                      setState(() {});
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => UserProfile()
                        )
                      );
                      _isLoading = false;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: _size.height/3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?"),
                    AppTextButton(
                      text: "Sign Up!",
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: (){
                        Navigator.of(context).pushNamed(SignUpScreen.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
