abstract interface class ISendForgotPasswordCodeDatasource {
  Future sendForgotPasswordCode(String email);
}
