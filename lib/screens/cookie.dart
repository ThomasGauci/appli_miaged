class Cookie {
  static final Cookie _cookie = new Cookie._internal();

  String userLogin;
  String userPassword;
  String userId;
  num prixTotal = 0;

  factory Cookie() {
    return _cookie;
  }
  Cookie._internal();
}

final cookie = Cookie();