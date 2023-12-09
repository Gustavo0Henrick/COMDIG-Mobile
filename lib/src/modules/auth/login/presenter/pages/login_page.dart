import 'dart:developer';

import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/login_user_cubit.dart';
import 'package:comdig/src/modules/auth/login/presenter/components/login_bottom_label_component.dart';
import 'package:comdig/src/modules/auth/login/presenter/components/login_fields_component.dart';
import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/auth_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/shared/widgets/error_popup_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginUserCubit cubit;

  bool value = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _loadUser() async {
    String rememberUser =
        await SecureStorageManager().readData(StorageKeys.rememberUser) ??
            "false";

    if (rememberUser == "true") {
      value = true;
      passwordController.text =
          await SecureStorageManager().readData(StorageKeys.password) ?? "";
      emailController.text =
          await StorageManager().readData(StorageKeys.email) ?? "";
    }
    setState(() {});
  }
  _loginUser() async {
    if (value) {
      Future.wait(
        [
          SecureStorageManager()
              .saveData(StorageKeys.rememberUser, value.toString()),
          StorageManager().saveData(StorageKeys.email, emailController.text),
          SecureStorageManager()
              .saveData(StorageKeys.password, passwordController.text),
        ],
      );
    } else {
      await SecureStorageManager()
          .saveData(StorageKeys.rememberUser, value.toString());
    }
    LoginUserEntity login = LoginUserEntity(
      email: emailController.text,
      password: passwordController.text,
    );

    await cubit.loginUser(login);
  }

  _validateForm() {
    if (_formKey.currentState!.validate()) {
      _loginUser();
    }
  }

  @override
  void initState() {
    _loadUser();
    cubit = BlocProvider.of<LoginUserCubit>(context);
    super.initState();
  }

  _getUserData(LoginResponseEntity data) {
    UserEntity userData = UserEntity(
      id: data.id,
      name: data.name,
      lastname: data.lastname,
      city: data.city,
      uf: data.uf,
      email: data.email,
      cellphone: data.cellphone,
      birthDate: data.birthdate.toString(),
      createdAt: data.createdAt.toString(),
      updatedAt: data.updatedAt.toString(),
    );
    AuthHelper.login(
      context,
      userData,
      data.token.accessToken,
      data.token.refreshToken,
    );
  }

  _login(context, state) async {
    if (state is LoginUserErrorState) {
      log(state.failure.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first);
    } else if (state is LoginUserSuccessState) {
      _getUserData(state.data);

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => AppRoute().pushNamedReplaced(
          context,
          AppRoutesKey.dashboard,
          data: {"index": 0},
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<LoginUserCubit, LoginUserStates>(
          listener: _login,
          bloc: cubit,
          builder: (context, state) {
            if (state is LoginUserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: SizedBox(
                width: size.width,
                height: size.height,
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
                            padding: const EdgeInsets.only(top: 80, bottom: 10),
                            child: ResponsiveTextWidget(
                              text: "COMDIG",
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        LoginFieldsComponent(
                          value: value,
                          checkBoxFunction: () {
                            setState(() => value = !value);
                            log(value.toString());
                          },
                          onTap: () => _validateForm(),
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: LoginBottomLabelComponent(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
