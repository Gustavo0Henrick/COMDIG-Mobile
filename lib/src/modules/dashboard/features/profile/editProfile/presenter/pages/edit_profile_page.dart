import 'dart:convert';
import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/presenter/blocs/cubits/edit_user_profile_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/presenter/components/edit_user_field_component.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/blocs/cubits/get_my_profile_cubit.dart';
import 'package:comdig/src/shared/helpers/image_decoder_helper.dart';
import 'package:comdig/src/shared/helpers/input_masks_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/shared/widgets/dropwdown_button_widget.dart';
import 'package:comdig/src/shared/widgets/error_popup_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/shared/widgets/success_popup_widget.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart' as mime;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _cityController = TextEditingController();
  final _ufController = TextEditingController();

  String? imageBase64 ;

  final _formKey = GlobalKey<FormState>();
  String _id = "";
  late GetMyProfileCubit _getMyProfileCubit;
  late EditUserProfileCubit _editProfileCubit;

  @override
  void initState() {
    _getMyProfileCubit = BlocProvider.of<GetMyProfileCubit>(context);
    _editProfileCubit = BlocProvider.of<EditUserProfileCubit>(context);
    Future.wait([
      SecureStorageManager().readData(StorageKeys.userId),
    ]).then(
      (userId) {
        _id = userId.first as String;
        _getMyProfileCubit.getMyProfile(userId.first as String);
      },
    );
    _getProfileImage();
    super.initState();
  }

  _getProfileImage() async {
    imageBase64 = await StorageManager().readData(StorageKeys.profileImage);
    setState(() {});
  }

  _goBack() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => AppRoute().pop(context),
    );
  }

  _editProfileListener(context, state) {
    if (state is EditUserProfileErrorState) {
      log(state.failure.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first.toString());
    }
    if (state is EditUserProfileSuccessState) {
      SuccessPopUpWidget.show(context, "Sucesso", _goBack);
    }
  }

  _getMyProfileListener(context, state) {
    if (state is GetMyProfileErrorState) {
      log(state.failure.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first.toString());
    }
    if (state is GetMyProfileSuccessState) {
      MyProfileEntity userData = state.myProfile;
      var date = DateTime.parse(userData.birthDate);

      String birthDate = userData.birthDate != ""
          ? "${date.day.toString().padLeft(2, "0")}/${date.month.toString().padLeft(2, "0")}/${date.year.toString().padLeft(4, "0")}"
          : "00/00/0000";

      _nameController.text = userData.name;
      _lastnameController.text = userData.lastname;
      _birthDateController.text = birthDate;
      _cityController.text = userData.city;
      _ufController.text = userData.uf;
    }
  }

  _getImageFromGalery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var mimeType = mime.lookupMimeType(image.path);

      if (mimeType == "image/png" || mimeType == "image/jpeg") {
        Uint8List bytes = await image.readAsBytes();

        final base64image = base64Encode(bytes);
        setState(() {
          imageBase64 = base64image;
        });
      } else {
        ErrorPopUpWidget.show(context,
            "Arquivo inválido! Selecione um arquivo PNG ou JPEG válido para seu perfil.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: SizerHelper.calculateVertical(context, 140),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 45,
          ),
          onPressed: () =>
              AppRoute().pushNamedReplaced(context, AppRoutesKey.settings),
        ),
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        title: const ResponsiveTextWidget(
          text: "Editar Perfil",
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.shadow,
      body: BlocConsumer<GetMyProfileCubit, GetMyProfileStates>(
          listener: _getMyProfileListener,
          bloc: _getMyProfileCubit,
          builder: (context, state) {
            if (state is GetMyProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetMyProfileSuccessState) {
              return BlocConsumer(
                  listener: _editProfileListener,
                  bloc: _editProfileCubit,
                  builder: (context, state) {
                    return SizedBox(
                      height: size.height,
                      width: size.width,
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            Container(
                              height:
                                  SizerHelper.calculateVertical(context, 220),
                              width: size.width,
                              color: Theme.of(context).colorScheme.onTertiary,
                              child: Center(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => _getImageFromGalery(),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: SizerHelper.calculateVertical(
                                            context, 180),
                                        width: SizerHelper.calculateVertical(
                                            context, 180),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.gray,
                                        ),
                                        child: imageBase64 != null
                                            ? ImageDecoderHelper
                                                .encodeBase64image(
                                                context,
                                                imageBase64!,
                                                width: 180,
                                                height: 180,
                                              )
                                            : null,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: SizerHelper.calculateVertical(
                                              context, 40),
                                          width: SizerHelper.calculateVertical(
                                              context, 40),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.lightGray,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Iconsax.edit_2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: EditProfileFieldComponent(
                                width: size.width,
                                controller: _nameController,
                                label: "Nome",
                                type: TextInputType.name,
                              ),
                            ),
                            EditProfileFieldComponent(
                              width: size.width,
                              controller: _lastnameController,
                              label: "Sobrenome",
                              type: TextInputType.name,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: EditProfileFieldComponent(
                                width: size.width,
                                controller: _birthDateController,
                                label: "Data de Nascimento",
                                inpuFormatters: [InputMasksHelper.date],
                                type: TextInputType.number,
                              ),
                            ),
                            Container(
                              color: Theme.of(context).colorScheme.onTertiary,
                              width: size.width,
                              height:
                                  SizerHelper.calculateVertical(context, 85),
                              child: Center(
                                child: SizedBox(
                                  height: SizerHelper.calculateVertical(
                                      context, 65),
                                  width: SizerHelper.calculateHorizontal(
                                      context, 320),
                                  child: DropwDownButtonWidget(
                                    initialValue: _ufController.text.isNotEmpty
                                        ? _ufController.text
                                        : null,
                                    function: (newValue) =>
                                        _ufController.text = newValue ?? "",
                                    hint: "Selecione UF",
                                    items: const ["SP"],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Container(
                                color: Theme.of(context).colorScheme.onTertiary,
                                width: size.width,
                                height:
                                    SizerHelper.calculateVertical(context, 85),
                                child: Center(
                                  child: SizedBox(
                                    height: SizerHelper.calculateVertical(
                                        context, 65),
                                    width: SizerHelper.calculateHorizontal(
                                        context, 320),
                                    child: DropwDownButtonWidget(
                                      initialValue:
                                          _cityController.text.isNotEmpty
                                              ? _cityController.text
                                              : null,
                                      function: (newValue) =>
                                          _cityController.text = newValue ?? "",
                                      hint: "Selecione Cidade",
                                      items: const ["Presidente Prudente"],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height:
                                  SizerHelper.calculateVertical(context, 180),
                              width: size.width,
                              color: Theme.of(context).colorScheme.onTertiary,
                              child: Center(
                                child: SizedBox(
                                  height: SizerHelper.calculateVertical(
                                      context, 65),
                                  width: SizerHelper.calculateHorizontal(
                                      context, 330),
                                  child: FilledButton(
                                    onPressed: () async {
                                      List<String> date =
                                          _birthDateController.text.split("/");
                                      DateTime birthdateDT = DateTime(
                                          int.parse(date[2]),
                                          int.parse(date[1]),
                                          int.parse(date[0]));
                                      if (_formKey.currentState!.validate()) {
                                        String cellphone =
                                            await SecureStorageManager()
                                                    .readData(StorageKeys
                                                        .cellphone) ??
                                                "";

                                        EditUserProfileEntity
                                            editProfileEntity =
                                            EditUserProfileEntity(
                                          id: _id,
                                          name: _nameController.text,
                                          lastname: _lastnameController.text,
                                          city: _cityController.text,
                                          uf: _ufController.text,
                                          birthDate: birthdateDT
                                              .toUtc()
                                              .toIso8601String(),
                                          cellphone: cellphone,
                                        );
                                        await StorageManager().saveData(
                                            StorageKeys.profileImage,
                                            imageBase64);
                                        _editProfileCubit
                                            .editUserProfile(editProfileEntity);
                                      }
                                    },
                                    child: const ResponsiveTextWidget(
                                        text: "Salvar"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
