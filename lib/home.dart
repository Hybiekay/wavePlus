import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription subscription;
  late StreamSubscription internetSubscition;
  bool isOnline = true;
  Timer? connectivityTimer;
  @override
  void initState() {
    checkConnectivity();

    super.initState();
  }

  void checkConnectivity() {
    // InternetConnectionChecker().onStatusChange.listen((status) {
    //   if (status == InternetConnectionStatus.disconnected) {
    //     print("Device is offline");
    //     updateConnectivityStatus(false);
    //   } else {
    //     print("Device is online");
    //     updateConnectivityStatus(true);
    //   }
    // });

    connectivityTimer?.cancel(); // Cancel previous timer if it exists

    connectivityTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      final ConnectivityResult result =
          await Connectivity().checkConnectivity();
      // final bool result = await InternetConnectionChecker().hasConnection;
      if (result == ConnectivityResult.none) {
        print("Device is offline");
        updateConnectivityStatus(false);
      } else {
        print("Device is online");
        updateConnectivityStatus(true);
      }
    });
  }

  void updateConnectivityStatus(bool isOnlineStatus) {
    if (isOnline != isOnlineStatus) {
      setState(() {
        isOnline = isOnlineStatus;
      });
    }
  }

  @override
  void dispose() {
    connectivityTimer
        ?.cancel(); // Dispose of the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isOnline
            ? SafeArea(
                child: InAppWebView(
                onReceivedHttpError: (
                  controller,
                  url,
                  code,
                ) {
                  print("error $code");
                  print("error $code, $url");
                  if (url.toString().contains("whatsapp")) {
                    _launchUrl(url);
                  } else if (url.toString().contains("mailto")) {
                    _launchUrl(url);
                  } else if (url.toString().contains("tel")) {
                    _launchUrl(url);
                  } else if (url
                      .toString()
                      .contains("https://waveplus.com.ng/home")) {
                    print("true");
                    updateConnectivityStatus(false);
                  }

                  controller.loadUrl(
                      urlRequest: URLRequest(
                          url: WebUri("https://waveplus.com.ng/home")));
                },
                initialUrlRequest:
                    URLRequest(url: WebUri("https://waveplus.com.ng/home")),
              ))
            : NoConnectionErrorPage());
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class NoConnectionErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_off, // Icon representing no connection
              size: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'No Internet Connection', // Error message
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add logic here to retry connecting
                // For example, you might call a function to retry connectivity check
              },
              child: Text(
                'Retry',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
