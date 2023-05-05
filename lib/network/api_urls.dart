class ApiUrls {
  static final instance = ApiUrls();

  ///Base Url
  static String baseUrl = "https://secure-falls-43052.herokuapp.com";

  ///End Points
  static String loginUrl = "/api/authenticate";
  static String productList = "/api/products";
  static String createProduct = "/api/create-products";
  static String deleteProduct = "/api/products/";
  static String profileDetails = "/api/account";


}