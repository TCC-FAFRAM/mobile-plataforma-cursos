import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../services/home/home_service.dart';
import '../../services/home/home_service_impl.dart';

List<SingleChildWidget> homeServiceProvider = [
  Provider<HomeService>(
    create: (context) => HomeServiceImpl(),
  ),
];
