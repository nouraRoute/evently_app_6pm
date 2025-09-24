import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_main_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_outlined_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_text_field.dart';
import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:evently_app_6pm/screens/auth/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Email', //TODO:localization
                  prefixIcon: Assets.icons.emailIconSvg.svg(
                    color: Theme.of(context).hoverColor,
                  ),
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
                CustomMainButton(
                  text: 'Login', //TODO:localization
                  onPressed: () {},
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
    );
  }
}
