import 'package:flutter_bloc/flutter_bloc.dart';

class StringCubit extends Cubit<String?> {
  StringCubit() : super(null);

  void setString(String? string) => emit(string);
}
