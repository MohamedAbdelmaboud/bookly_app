import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({Key? key, required this.bookModel}) : super(key: key);
  static String id = '/WebView';
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..loadRequest(Uri.parse(bookModel.volumeInfo.previewLink!));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
          backgroundColor: const Color(0xff000000),
          onPressed: () async {
            await _launchUrl(url: 'https://pub.dev/packages/url_launcher');
          },
          child: const Icon(
            Icons.download,
            color: Colors.white,
          )),
      appBar: AppBar(
        title: const Text(
          'The preview of the book ♥',
          style: Styles.textStyle16,
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

Future<void> _launchUrl({required String url}) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
