import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../provider/UserInfoProvider.dart';
import '../provider/TokenProvider.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage({super.key,required this.url, required this.title});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

  void _initWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            //页面加载完成后才能执行js
            // _handleBackForbid();
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebViewWidget(
              controller: controller,
              key: GlobalKey(),
              // javascriptMode: JavascriptMode.unrestricted,
              // initialUrl: widget.url,
              // javascriptChannels: <JavascriptChannel>[
              //   _jsCallNativeGetUserData(context),
              //   _jsCallNativeGetToken(context)
              // ].toSet()
            )));
  }

  _jsCallNativeGetUserData(BuildContext context) {
    // return JavascriptChannel(
    //     name: "plus.getUserData",
    //     onMessageReceived: (JavascriptMessage message) {
    //       return convert.jsonEncode(Provider.of<UserInfoProvider>(context).userInfo.toMap());
    //     });
  }

  _jsCallNativeGetToken(BuildContext context) {
    // return JavascriptChannel(
    //     name: "plus.getToken",
    //     onMessageReceived: (JavascriptMessage message) {
    //       return convert.jsonEncode(Provider.of<TokenProvider>(context).token);
    //     });
  }
}
