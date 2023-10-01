class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String completeProfile = '$_baseUrl/CreateProfile';
  static String productSlider = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
}