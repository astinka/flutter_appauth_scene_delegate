import 'package:flutter_appauth/flutter_appauth.dart';


class AuthUtilsKeycloak {
  static AuthUtilsKeycloak? _instance;
  static FlutterAppAuth appAuth = const FlutterAppAuth();
  static String? _idToken;

  AuthUtilsKeycloak._();
  static AuthUtilsKeycloak get instance => _instance ??= AuthUtilsKeycloak._();

  Future<AuthorizationTokenResponse?> authorizeAndExchangeCode() async {
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        '[client-id]',
        '[redirect-url]',
        allowInsecureConnections: true,
        preferEphemeralSession: true,
        discoveryUrl:
            '[discovery-url',
        scopes: ['openid', 'profile', 'email', 'offline_access'],
      ),
    );
    _idToken = result?.idToken;
    return result;
  }

  Future<void> logOut() async {
    try {
      await appAuth.endSession(EndSessionRequest(
          idTokenHint: _idToken,
          postLogoutRedirectUrl: '[redirect-url]',
          serviceConfiguration: const AuthorizationServiceConfiguration(
              authorizationEndpoint:
                  '[auth-endpoint]',
              tokenEndpoint:
                  '[token-endpoint]',
              endSessionEndpoint:
                  '[end-session-endpoint]'
          )));
    } catch (_) {
      print("error");
    }
  }

}
