import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_main_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_text_field.dart';
import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signupScreen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')), //TODO:localization
      body: SingleChildScrollView(
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
                hintText: 'Name', //TODO:localization
                prefixIcon: Assets.icons.personIcon.svg(
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
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'PAssword', //TODO:localization
                prefixIcon: Assets.icons.passwordIcon.svg(
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(height: 16),

              CustomTextField(
                hintText: 'PAssword', //TODO:localization
                prefixIcon: Assets.icons.passwordIcon.svg(
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(height: 16),

              CustomMainButton(
                text: 'Sign up', //TODO:localization
                onPressed: () {},
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
    );
  }
}
