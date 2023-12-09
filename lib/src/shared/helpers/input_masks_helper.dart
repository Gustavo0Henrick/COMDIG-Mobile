
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class InputMasksHelper {
  static final MaskTextInputFormatter cellPhoneBR = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter cellPhoneUS = MaskTextInputFormatter(
      mask: '### ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter cellPhoneAR = MaskTextInputFormatter(
      mask: '# ### ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter cpf = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter cnpj = MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter cep = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter date = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final MaskTextInputFormatter uf = MaskTextInputFormatter(
      mask: '##',
         filter: {"#": RegExp(r'[a-zA-Z]')},
      type: MaskAutoCompletionType.lazy);
}
