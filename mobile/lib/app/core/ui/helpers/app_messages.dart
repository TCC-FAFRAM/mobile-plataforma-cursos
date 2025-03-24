import 'package:app/app/core/ui/helpers/app_size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

mixin AppMessages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Erro!',
        message: message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showInfo(String message) {
    final snackBar = SnackBar(
      elevation: 50,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: context.percentHeight(.14),
          child: AwesomeSnackbarContent(
            title: 'Informação',
            message: message,
            contentType: ContentType.help,
          ),
        ),
      ),
      duration: Duration(minutes: 1),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showSuccess(String message) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Sucesso!',
        message: message,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
