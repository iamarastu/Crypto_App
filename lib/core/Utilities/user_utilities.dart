import 'package:crypto_app/core/Repository/secureStorageRepository.dart';



class UserUtilities {
  bool checkUserLoggedIn() {
    SecureStorageRepository().getData('token').then((token) {
      if (token!.length > 0) {
        return true;
      }
    });
    return false;
  }
}