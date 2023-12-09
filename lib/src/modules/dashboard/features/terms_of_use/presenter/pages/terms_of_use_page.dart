import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({Key? key}) : super(key: key);

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
          text: "Termos de Uso",
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                ResponsiveTextWidget(
                  maxLines: 100,
                  textAlign: TextAlign.justify,
                  text: """Termos de Uso e Privacidade - Aplicativo de COMDIG
                  
                  1. Aceitação dos Termos de Uso e Privacidade
                  
                  Ao utilizar o aplicativo de COMDIG da região, você concorda expressamente com estes Termos de Uso e Privacidade. Se você não concordar com algum destes termos, por favor, não utilize o Aplicativo.
                  
                  2. Coleta de Informações
                  
                  O Aplicativo coleta informações cadastrais fornecidas voluntariamente pelos usuários, incluindo nome, sobrenome, e-mail, celular, cidade e estado. Ressaltamos que nenhuma informação ou recurso do dispositivo do usuário é acessado ou utilizado pelo Aplicativo.
                  
                  3. Uso das Informações
                  
                  As informações coletadas têm o objetivo exclusivo de proporcionar uma experiência personalizada aos usuários, permitindo o acesso a funcionalidades específicas do Aplicativo, como a navegação na COMDIG da região.
                  
                  4. Privacidade e Segurança
                  
                  Garantimos o tratamento confidencial das informações fornecidas, utilizando medidas de segurança adequadas para proteger contra acesso não autorizado, alteração, divulgação ou destruição não autorizada de dados.
                  
                  5. Compartilhamento de Informações
                  
                  As informações dos usuários não serão compartilhadas, vendidas ou alugadas a terceiros, exceto quando necessário para cumprir com obrigações legais ou regulatórias.
                  
                  6. Consentimento
                  
                  Ao fornecer suas informações cadastrais, você consente com a coleta, uso e divulgação destas informações de acordo com estes Termos de Uso e Privacidade.
                  
                  7. Atualização de Informações
                  
                  Os usuários têm o direito de acessar, corrigir ou excluir suas informações cadastrais a qualquer momento. Para realizar alterações, basta acessar as configurações de conta no Aplicativo.
                  
                  8. Ausência de Processamento de Dados
                  
                  Ressaltamos que o Aplicativo não realiza nenhum processamento de dados além do necessário para oferecer suas funcionalidades, mantendo-se em conformidade com as leis aplicáveis de proteção de dados.
                  
                  9. Alterações nos Termos de Uso e Privacidade
                  
                  Reservamo-nos o direito de atualizar estes Termos de Uso e Privacidade a qualquer momento. Recomendamos que os usuários revejam periodicamente este documento para estar cientes de quaisquer mudanças.
                  
                  Ao utilizar o Aplicativo, você concorda com estes Termos de Uso e Privacidade. Se tiver dúvidas ou preocupações, entre em contato conosco por meio dos canais disponíveis no Aplicativo.
                  
                  Atualizado em 25/11/2023.""",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
