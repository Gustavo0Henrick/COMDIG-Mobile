<h1>Aplicativo COMDIG-Mobile - Flutter</h1>

Bem-vindo ao projeto COMDIG, um aplicativo Flutter que utiliza Clean Architecture seguindo o padrão FDD (Feature-Driven Development). Este aplicativo conecta-se a um servidor HTTP na nuvem para fornecer dados sobre empresas locais e usuários cadastrados.

<h4>Funcionalidades</h4>

  Cadastro e Autenticação de Usuários: Os usuários podem se cadastrar e autenticar para acessar funcionalidades exclusivas.

  Busca de Empresas: Encontre empresas locais com base em categorias, localização ou palavras-chave.

  Detalhes da Empresa: Visualize informações detalhadas sobre uma empresa, incluindo produtos, serviços e avaliações.

  Favoritos: Os usuários podem favoritar empresas para fácil acesso posterior.

  Avaliação de Empresas: Avalie e compartilhe sua experiência com empresas locais.

<h4>Estrutura do Projeto</h4>

O projeto segue a Clean Architecture, com a separação de camadas em:

  Presenter: UI, páginas, widgets e gerenciamento de estado usando BLoC/Cubit.
  Domain: Regras de negócios e entidades do domínio.
  Infra: Implementação de repositórios e fontes de dados remotos.

<h4>Requisitos</h4>

  Flutter (v3.13.9+)
  Dart (v3.1.5+)
  Dependências listadas no arquivo pubspec.yaml

<h4>Instalação</h4>

  Clone o repositório: `git clone https://github.com/Gustavo0Henrick/COMDIG-Mobile`
  Instale as dependências: `flutter pub get`

<h4>Execução</h4>

  Inicie o aplicativo: `flutter run`

<h4>Recursos</h4>

  Android APK: `.assets/apks`


Este projeto é licenciado sob a MIT License.