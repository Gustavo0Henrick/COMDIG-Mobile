import 'package:comdig/src/shared/helpers/input_masks_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/dropwdown_button_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class RegisterDataFieldsComponent extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController birthdateController;
  final TextEditingController cityController;
  final TextEditingController ufController;
  final TextEditingController cellphoneController;
  const RegisterDataFieldsComponent({
    Key? key,
    required this.nameController,
    required this.lastnameController,
    required this.birthdateController,
    required this.cityController,
    required this.ufController,
    required this.cellphoneController,
  }) : super(key: key);

  @override
  State<RegisterDataFieldsComponent> createState() =>
      _RegisterDataFieldsComponentState();
}

class _RegisterDataFieldsComponentState
    extends State<RegisterDataFieldsComponent> {
  String? ufValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: ResponsiveTextWidget(
              text: "Cadastrar",
              maxFontSize: 22,
              minFontSize: 18,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 330),
              child: TextFormField(
                inputFormatters: [InputMasksHelper.date],
                controller: widget.birthdateController,
                decoration: const InputDecoration(
                    filled: true, hintText: "Data de Nascimento"),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 330),
              child: TextFormField(
                controller: widget.nameController,
                decoration:
                    const InputDecoration(filled: true, hintText: "Nome"),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 330),
              child: TextFormField(
                controller: widget.lastnameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Sobrenome",
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: DropwDownButtonWidget(
              hint: "Selecione UF",
              items: const ["SP"],
              function: (newValue) => widget.ufController.text = newValue ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: DropwDownButtonWidget(
              hint: "Selecione Cidade",
              items: const ["Presidente Prudente"],
              function: (newValue) =>
                  widget.cityController.text = newValue ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 330),
              child: TextFormField(
                inputFormatters: [InputMasksHelper.cellPhoneBR],
                controller: widget.cellphoneController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Celular",
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
