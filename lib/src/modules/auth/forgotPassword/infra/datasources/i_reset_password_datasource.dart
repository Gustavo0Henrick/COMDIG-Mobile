abstract interface class IResetPasswordDatasource {
  Future resetPassword(
      ({String code, String email, String password}) resetData);
}
