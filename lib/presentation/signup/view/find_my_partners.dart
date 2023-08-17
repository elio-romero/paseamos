import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:flutter/material.dart';

class WifiAP extends StatefulWidget {
  static const name = 'wifiap';

  const WifiAP({Key? key}) : super(key: key);

  @override
  State<WifiAP> createState() => _MyAppState();
}

class _MyAppState extends State<WifiAP> {
  final String _platformVersion = 'Unknown';

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        connectToNetworkWithSSID();
      }),
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Text('Running on: $_platformVersion\n'),
      ),
    );
  }

  void init() async {
    await AndroidFlutterWifi.init();
    var isConnected = await AndroidFlutterWifi.isConnected();
    await getDhcpInfo();
    await getWifiList();
    await getConfiguredNetworks();
    //await forgetWifi();
    debugPrint('Is connected: ${isConnected.toString()}');
  }

  getWifiList() async {
    List<WifiNetwork> wifiList = await AndroidFlutterWifi.getWifiScanResult();
    if (wifiList.isNotEmpty) {
      WifiNetwork wifiNetwork = wifiList[0];
      print('Name: ${wifiNetwork.ssid}');
    }
  }

  isConnectionFast() {
    print(AndroidFlutterWifi.isConnectionFast());
  }

  getConnectionType() {
    print(AndroidFlutterWifi.getConnectionType());
  }

  getActiveWifiNetwork() async {
    ActiveWifiNetwork activeWifiNetwork =
        await AndroidFlutterWifi.getActiveWifiInfo();
  }

  getDhcpInfo() async {
    DhcpInfo dhcpInfo = await AndroidFlutterWifi.getDhcpInfo();
    String ipString = AndroidFlutterWifi.toIp(dhcpInfo.gateway!);
    String formedIp = AndroidFlutterWifi.getFormedIp(ipString);
    print('Gateway: $ipString');
    print('Formed ip: $formedIp');
  }

  void connectionTest() async {
    String ssid = 'Twifi-721';
    String password = ''; //Add you password
    if (ssid.isEmpty) {
      throw ("SSID can't be empty");
    }
    if (password.isEmpty) {
      throw ("Password can't be empty");
    }
    debugPrint('Ssid: $ssid, Password: $password');
    var result = await AndroidFlutterWifi.connectToNetwork(ssid, password);

    debugPrint('---------Connection result-----------: ${result.toString()}');
  }

  ///Returns list of saved wifi networks on your device
  getConfiguredNetworks() async {
    List<ConfiguredNetwork> list =
        await AndroidFlutterWifi.getConfiguredNetworks();
    for (var element in list) {
      debugPrint('Network id: ${element.networkId}');
    }
  }

  ///Forget current connection
  forgetWifi() async {
    ActiveWifiNetwork activeWifiNetwork =
        await AndroidFlutterWifi.getActiveWifiInfo();
    var result =
        await AndroidFlutterWifi.forgetWifiWithSSID(activeWifiNetwork.ssid!);
    debugPrint('Forget wifi result: ${result.toString()}');
  }

  void connectToNetworkWithSSID() async {
    var result = await AndroidFlutterWifi.connectToNetworkWithSSID('Twifi-721');
    debugPrint('Connection result: ${result.toString()}');
  }
}
