import 'package:evently_app_6pm/common/network/auth_service.dart';
import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_main_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_text_field.dart';
import 'package:evently_app_6pm/common/widgets/snackbar_helper.dart';
import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:evently_app_6pm/models/user_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signupScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context).actionIconTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Register')), //TODO:localization
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.icons.appIcon.image(height: 140, width: 140),
                Text(
                  'Evently', //TODO:localization
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(height: 24),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Name', //TODO:localization
                  prefixIcon: Assets.icons.personIcon.svg(
                    color: Theme.of(context).hoverColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Email', //TODO:localization
                  prefixIcon: Assets.icons.emailIconSvg.svg(
                    color: Theme.of(context).hoverColor,
                  ),
                  validator: (value) {
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value ?? "");
                    if (value == null || value.isEmpty) {
                      return 'email is required';
                    } else if (!emailValid) {
                      return 'invlid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  isPassword: true,
                  hintText: 'PAssword', //TODO:localization
                  prefixIcon: Assets.icons.passwordIcon.svg(
                    color: Theme.of(context).hoverColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password is required';
                    } else if (value.length < 8) {
                      return 'password must be at lias 8characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                CustomTextField(
                  controller: confirmPasswordController,
                  isPassword: true,
                  hintText: 'confirm PAssword', //TODO:localization
                  prefixIcon: Assets.icons.passwordIcon.svg(
                    color: Theme.of(context).hoverColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'confirm password is required';
                    } else if (value != passwordController.text) {
                      return 'password doesn\'t match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                if (isLoading)
                  CircularProgressIndicator()
                else
                  CustomMainButton(
                    text: 'Sign up', //TODO:localization
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          setState(() {
                            isLoading = true;
                          });
                          await AuthService.register(
                            passwordController.text,
                            UserModel(
                              email: emailController.text,
                              name: nameController.text,
                            ),
                          );
                          SnackbarHelper.showSuccessSnackBar(
                            context: context,
                            message: 'Success',
                          );
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.of(context).pop();
                        } catch (e) {
                          SnackbarHelper.showErrorSnackBar(
                            context: context,
                            message: e.toString(),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }

                        print('-----Done------');
                      }
                    },
                  ),
                SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already Have Account ? ',
                      ), //TODO:localization
                      TextSpan(
                        text: 'Login', //TODO:localization
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.mainColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                      ),
                    ],
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 24),
                Switch(
                  value: false,
                  onChanged: (value) {},
                  activeThumbImage: AssetImage(Assets.icons.enIcon.path),
                  inactiveThumbImage: AssetImage(Assets.icons.arIcon.path),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  shoeDatePicker(context) {}
}
