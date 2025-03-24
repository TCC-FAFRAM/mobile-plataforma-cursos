import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../cubit/string_cubit.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

mixin AppLoader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader(String? message) {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocSelector<StringCubit, String?, String?>(
                  selector: (state) {
                    return state;
                  },
                  builder: (context, messageCubit) {
                    return Visibility(
                      visible: message != null || messageCubit != null,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          message ?? messageCubit ?? 'Carregando...',
                          maxLines: 2,
                          style: context.textStyle.textExtraBold.copyWith(
                            backgroundColor: Colors.transparent,
                            color: context.appColors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                LoadingAnimationWidget.newtonCradle(
                  color: context.appColors.primary,
                  size: 160,
                )
              ],
            ),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      final stringCubit = context.read<StringCubit>();
      stringCubit.setString(null);
      Navigator.of(context).pop();
    }
  }
}
