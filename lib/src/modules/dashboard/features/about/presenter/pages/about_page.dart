import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? value;

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
          onPressed: () => AppRoute().pop(context),
        ),
        title: const ResponsiveTextWidget(
          text: "Sobre",
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ResponsiveTextWidget(
                textAlign: TextAlign.justify,
                minFontSize: 18,
                text:
                    """Bem-vindo ao COMDIG, o lugar onde você encrontrará informações sobre o comércio na sua região. Nossa equipe é apaixonada por desenvolver soluções criativas para conectar clientes as empresas locais, e estamos empenhados em fornecer a melhor experiência possível para nossos usuários.""",
              ),
              Container(
                height: SizerHelper.calculateVertical(context, 65),
                width: SizerHelper.calculateHorizontal(context, 330),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.gray.withOpacity(0.2),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  underline: Container(),
                  value: value,
                  items: const [
                    DropdownMenuItem(
                      value: "SP",
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ResponsiveTextWidget(text: "SP"),
                      ),
                    ),
                  ],
                  icon: Container(),
                  onChanged: (newValue) => setState(() => value = newValue),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveTextWidget(
                    text: "Versão: ",
                    minFontSize: 20,
                  ),
                  ResponsiveTextWidget(
                    text: "1.0.0",
                    minFontSize: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
