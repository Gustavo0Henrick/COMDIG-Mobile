import 'dart:developer';

import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/presenter/blocs/cubits/register_user_cubit.dart';
import 'package:comdig/src/modules/auth/register/presenter/components/register_data_buttons_component.dart';
import 'package:comdig/src/modules/auth/register/presenter/components/register_data_fields_component.dart';
import 'package:comdig/src/modules/auth/register/presenter/components/register_terms_label_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/error_popup_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDataPage extends StatefulWidget {
  final String email;
  final String password;
  const RegisterDataPage(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController cellphoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value = false;

  late RegisterUserCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<RegisterUserCubit>(context);
    super.initState();
  }

  _registerUser() async {
    UserDataEntity user = UserDataEntity(
      name: nameController.text,
      lastname: lastnameController.text,
      city: cityController.text,
      uf: ufController.text,
      email: widget.email,
      cellphone: cellphoneController.text,
      birthDate: DateTime(
        int.parse(birthDateController.text.split("/")[2]),
        int.parse(birthDateController.text.split("/")[1]),
        int.parse(birthDateController.text.split("/")[0]),
      ).toUtc().toIso8601String(),
      password: widget.password,
    );

    await cubit.registerUser(user);
  }

  _validateForm() {
    if (_formKey.currentState!.validate()) {
      _registerUser();
    }
  }

  _register(context, state) {
    if (state is RegisterUserErrorState) {
      log(state.failure.props.first.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first.toString());
    } else if (state is RegisterUserSuccessState) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => AppRoute().pushNamed(context, AppRoutesKey.login),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<RegisterUserCubit, RegisterUserStates>(
          bloc: cubit,
          listener: _register,
          builder: (context, state) {
            if (state is RegisterUserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: SizerHelper.calculateHorizontal(context, 340),
                    height: size.height * 1.3,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 80, bottom: 70),
                                child: ResponsiveTextWidget(
                                  text: "COMDIG",
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                            RegisterDataFieldsComponent(
                              nameController: nameController,
                              lastnameController: lastnameController,
                              birthdateController: birthDateController,
                              cellphoneController: cellphoneController,
                              cityController: cityController,
                              ufController: ufController,
                            ),
                            const RegisterTermsLabelComponent(),
                            RegisterDataButtonsComponent(
                              onTap: () => _validateForm(),
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
                ),
              ),
            );
          }),
    );
  }
}
