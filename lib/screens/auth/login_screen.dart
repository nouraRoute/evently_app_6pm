import 'package:evently_app_6pm/common/network/auth_service.dart';
import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_main_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_outlined_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_text_field.dart';
import 'package:evently_app_6pm/common/widgets/snackbar_helper.dart';
import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:evently_app_6pm/models/user_model.dart';
import 'package:evently_app_6pm/screens/auth/sign_up_screen.dart';
import 'package:evently_app_6pm/screens/home/main_layer_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                    hintText: 'Email', //TODO:localization
                    prefixIcon: Assets.icons.emailIconSvg.svg(
                      color: Theme.of(context).hoverColor,
                    ),
                    controller: emailController,
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
                    hintText: 'Password', //TODO:localization
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?', //TODO:localization
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: AppColors.mainColor,
                            decorationColor: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isLoading)
                    CircularProgressIndicator()
                  else
                    CustomMainButton(
                      text: 'Login', //TODO:localization
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              isLoading = true;
                            }); //TODO:with provider
                            UserModel? user = await AuthService.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (user == null) {
                              throw 'invalid user';
                            }
                            Navigator.of(
                              context,
                            ).pushNamed(MainLayerScreen.routeName);
                            SnackbarHelper.showSuccessSnackBar(
                              context: context,
                              message: 'Success',
                            );
                            setState(() {
                              isLoading = false;
                            });
                          } catch (e) {
                            SnackbarHelper.showErrorSnackBar(
                              context: context,
                              message: e.toString(),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                    ),

                  SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t Have Account ? ',
                        ), //TODO:localization
                        TextSpan(
                          text: 'Create Account', //TODO:localization
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mainColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(
                                context,
                              ).pushNamed(SignUpScreen.routeName);
                            },
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 24),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(child: Divider(indent: 16)),
                      Text(
                        'Or', //TODO:localization
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: Divider(endIndent: 16)),
                    ],
                  ),
                  SizedBox(height: 24),
                  CustomOutlinedButton(
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.googleIcon.image(height: 26, width: 26),
                        Text(
                          'Login With Google', //TODO:localization
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
