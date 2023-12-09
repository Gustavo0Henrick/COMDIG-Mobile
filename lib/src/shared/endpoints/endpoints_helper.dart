import 'package:comdig/src/utils/enviroments/environment_config.dart';

abstract class EndpointsHelper {
  static String baseURL = EnvironmentFactory().getEnvironment().baseURL;

  static String authUser = "$baseURL/auth";
  static String authCompany = "$baseURL/auth";
  static String loginUser = "$baseURL/auth/login";
  static String loginCompany = "$baseURL/auth/company/login";
  static String registerUser = "$baseURL/auth/register";
  static String registerCompany = "$baseURL/auth/company/register";
  static String refreshTokenUser = "$baseURL/auth/refresh";
  static String refreshTokenCompany = "$baseURL/auth/company/refresh";
  static String categories = "$baseURL/category/";
  static String favorites = "$baseURL/favorite/";
  static String editProfileUserById(String userId) => "$baseURL/user/$userId";
  static String getAllFavoritesById(String userId) =>
      "$baseURL/favorite/$userId";
  static String addFavoriteById(String companyId) =>
      "$baseURL/favorite/$companyId";
  static String removeFavoriteById(String companyId) =>
      "$baseURL/favorite/$companyId";
  static String getUserById(String userId) => "$baseURL/user/$userId";
  static String getMyProfile(String userId) => "$baseURL/user/$userId";
  static String searchCompanies(String input) =>
      "$baseURL/search/companies/$input";
  static String getCompanyById(String companyId) =>
      "$baseURL/company/$companyId";
  static String getRecommendedCompanies = "$baseURL/recommend/companies";
  static String getFeaturedCompaniesCompanies = "$baseURL/featured/companies";
  static String getHomeAds = "$baseURL/recommend/companies";
  static String generateQRCode = "$baseURL/recommend/companies";
  static String getNearbyCompaniesById(String id) =>
      "$baseURL/recommend/companies";
  static String getCompaniesByCategory(String category) =>
      "$baseURL/search/companies/category/$category";
  static String getReviewsCompanyById(String companyId) =>
      "$baseURL/review/review/$companyId";
  static String addReviewToCompany = "$baseURL/review/review/add";
}
