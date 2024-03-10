import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityClient {
  static final ConnectivityClient _singleton = ConnectivityClient._internal();

  factory ConnectivityClient() {
    return _singleton;
  }

  ConnectivityClient._internal();

  final Connectivity _connectivity = Connectivity();

  Future<bool> checkInternet() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    print(
      'connectivity : $connectivityResult',
    );
    return (connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.vpn ||
        connectivityResult == ConnectivityResult.other);
  }
}
