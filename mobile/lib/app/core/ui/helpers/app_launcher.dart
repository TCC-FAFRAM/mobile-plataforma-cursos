import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

mixin AppLauncher<T extends StatefulWidget> on State<T> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void launchUrlUtils(
      bool isEmail, bool isTel, String? tel, String? email) async {
    if (isTel) {
      Uri uri = Uri(scheme: 'tel', path: tel);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao fazer a ligação')),
        );
      }
    }
    if (isEmail) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        query: encodeQueryParameters(<String, String>{
          'subject': 'Contato',
        }),
      );
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao enviar o email')),
        );
      }
    }
    if (isEmail == false && isTel == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tipo não Suportado')),
      );
    }
  }
}
