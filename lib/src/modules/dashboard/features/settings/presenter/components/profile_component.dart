import 'package:comdig/src/shared/helpers/image_decoder_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class ProfileComponent extends StatefulWidget {
  final double width;
  final double height;
  const ProfileComponent(
      {Key? key,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  String name = "";
  String lastname = "";
  String email = "";
    String? imageBase64;

  _getInfo() async {
    Future.wait(
      [
        StorageManager().readData(StorageKeys.email),
        StorageManager().readData(StorageKeys.name),
        StorageManager().readData(StorageKeys.lastname),
      ],
    ).then((list) {
      setState(() {
        email = list[0] ?? "";
        name = list[1] ?? "";
        lastname = list[2] ?? "";
      });
    });
  }

  @override
  void initState() {
    _getInfo();
       _getProfileImage();
    super.initState();
  }

    _getProfileImage() async {
    imageBase64 = await StorageManager().readData(StorageKeys.profileImage);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute().pushNamed(context, AppRoutesKey.myProfile),
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Theme.of(context).colorScheme.onTertiary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: SizerHelper.calculateVertical(context, 90),
                    height: SizerHelper.calculateVertical(context, 90),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.gray,
                    ),
                    child: imageBase64 != null
                        ? ImageDecoderHelper.encodeBase64image(
                            context,
                           imageBase64!,
                            width: 180,
                            height: 180,
                          )
                        : null,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ResponsiveTextWidget(
                        text: "$name ",
                        maxFontSize: 27,
                        minFontSize: 24,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                      ResponsiveTextWidget(
                        text: lastname,
                        maxFontSize: 27,
                        minFontSize: 24,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ResponsiveTextWidget(
                      text: "Ver Perfil",
                      maxFontSize: 20,
                      minFontSize: 16,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
