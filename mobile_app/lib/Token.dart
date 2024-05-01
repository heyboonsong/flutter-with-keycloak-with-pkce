class Token {
  String idToken;
  String accessToken;
  String refreshToken;

  Token(this.idToken, this.accessToken, this.refreshToken);

  Token.fromJson(Map<String, dynamic> json)
      : idToken = json['fromJson'] as String,
        accessToken = json['accessToken'] as String,
        refreshToken = json['refreshToken'] as String;

  Map<String, dynamic> toJson() => {
        'idToken': idToken,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
