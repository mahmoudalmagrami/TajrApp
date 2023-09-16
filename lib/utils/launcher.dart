import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static phoneCall(String phone) async {
    String url = Platform.isIOS ? 'tel://$phone' : 'tel:$phone';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl( Uri.parse( url));
    } else {
      throw 'Could not launch $url';
    }
  }



  static openEmail(String email,
      {String subject = '', String body = ''}) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );

    try {
      await launchUrl( Uri.parse( emailLaunchUri.toString()),mode: LaunchMode.externalNonBrowserApplication);
    } catch (e) {
      await launchUrl( Uri.parse( emailLaunchUri.toString(),));
    }
  }

  static Future<void> launchInBrowser(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl( Uri.parse(
      url,
      )
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static openWhatsApp(String phone) async {
    var url = '';
    if (Platform.isAndroid) {
      // add the [https]
      url = "https://wa.me/$phone/?text="; // new line


    } else {
      // add the [https]
      url = "https://wa.me/$phone"; // new line
    }

    if (await canLaunchUrl(Uri.parse(url),)) {
      await launchUrl( Uri.parse( (url),),mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }



}
