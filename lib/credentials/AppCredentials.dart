class AppCredentials{
  final String clientId;
  final String clientSecret;
  final String apiKey;

  const AppCredentials({this.clientId,this.clientSecret,this.apiKey});
}

class BlankCredentials{
  static const AppCredentials instance = AppCredentials(clientId:"",clientSecret:"",apiKey:"");
}