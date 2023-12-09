import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/blocs/cubits/get_my_profile_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/components/my_image_component.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/components/my_profile_label_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/shared/widgets/error_popup_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late GetMyProfileCubit _cubit;
  String? imageBase64;
  MyProfileEntity userData = const MyProfileEntity(
    id: "id",
    name: "name",
    lastname: "lastname",
    email: "email",
    birthDate: "00/00/0000",
    cellphone: "cellphone",
    city: "city",
    uf: "uf",
    createdAt: "00/00/0000",
    updatedAt: "00/00/0000",
  );
  DateTime date = DateTime.now();
  String birthDate = "";

  @override
  void initState() {
    _cubit = BlocProvider.of<GetMyProfileCubit>(context);
    Future.wait([
      SecureStorageManager().readData(StorageKeys.userId),
    ]).then(
      (userId) => _cubit.getMyProfile(userId.first as String),
    );

    super.initState();
  }

  _getProfileImage() async {
    imageBase64 = await StorageManager().readData(StorageKeys.profileImage);
    setState(() {});
  }

  _getMyProfileListener(context, state) {
    if (state is GetMyProfileErrorState) {
      log(state.failure.props.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first.toString());
    }

    if (state is GetMyProfileSuccessState) {
      _getProfileImage();
      userData = state.myProfile;
      date = DateTime.parse(userData.birthDate);

      birthDate = userData.birthDate != ""
          ? "${date.day.toString().padLeft(2, "0")}/${date.month.toString().padLeft(2, "0")}/${date.year.toString().padLeft(4, "0")}"
          : "00/00/0000";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: SizerHelper.calculateVertical(context, 140),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 45,
          ),
          onPressed: () => AppRoute().pop(context),
        ),
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        title: const ResponsiveTextWidget(
          text: "Perfil",
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.shadow,
      body: BlocConsumer<GetMyProfileCubit, GetMyProfileStates>(
          listener: _getMyProfileListener,
          bloc: _cubit,
          builder: (context, state) {
            if (state is GetMyProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetMyProfileSuccessState) {
              return SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    MyImageComponent(
                      heigth: SizerHelper.calculateVertical(context, 220),
                      width: size.width,
                      imageBase64: imageBase64,
                    ),
                    MyProfileLabelComponent(
                      width: size.width,
                      label: "Email",
                      value: userData.email,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: MyProfileLabelComponent(
                        width: size.width,
                        label: "Nome",
                        value: userData.name,
                      ),
                    ),
                    MyProfileLabelComponent(
                      width: size.width,
                      label: "Sobrenome",
                      value: userData.lastname,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: MyProfileLabelComponent(
                        width: size.width,
                        label: "Celular",
                        value: userData.cellphone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: MyProfileLabelComponent(
                        width: size.width,
                        label: "Cidade",
                        value: userData.city,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: MyProfileLabelComponent(
                        width: size.width,
                        label: "UF",
                        value: userData.uf,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: MyProfileLabelComponent(
                        width: size.width,
                        label: "Data de Nascimento",
                        value: birthDate,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: size.width,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
