enum TokenType {
  accessToken,
  refreshToken,
  apiToken,
}

enum MyAppLocalizations {
  vietnam("vietnam"),
  english("english");

  final String filename;

  const MyAppLocalizations(this.filename);
}
