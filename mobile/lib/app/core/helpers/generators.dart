import 'package:uuid/uuid.dart';

class Generators {
  static Generators? _instance;

  Generators._();
  static Generators get instance => _instance ??= Generators._();

  String generateIdv4() {
    const uuid = Uuid();
    final id = uuid.v4();
    return id;
  }
}
