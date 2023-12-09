import 'package:comdig/src/modules/auth/register/presenter/components/register_buttons_component.dart';
import 'package:comdig/src/modules/auth/register/presenter/components/register_fields_component.dart';
import 'package:comdig/src/modules/auth/register/presenter/components/register_terms_label_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value = false;

  _validateForm() {
    if (_formKey.currentState!.validate()) {
      AppRoute().pushNamed(
        context,
        AppRoutesKey.registerData,
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 70),
                    child: ResponsiveTextWidget(
                      text: "COMDIG",
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: SizerHelper.calculateHorizontal(context, 520),
                    width: SizerHelper.calculateHorizontal(context, 340),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegisterFieldsComponent(
                            confirmPasswordController:
                                confirmPasswordController,
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                          const RegisterTermsLabelComponent(),
                          RegisterButtonsComponent(
                            onTap: () => _validateForm(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                    width: 270,
                    height: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
