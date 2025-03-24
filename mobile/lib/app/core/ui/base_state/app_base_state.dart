import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';

import '../helpers/app_loader.dart';
import '../helpers/app_messages.dart';

abstract class AppBaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with AppLoader, AppMessages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
