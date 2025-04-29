import 'package:app/app/services/cursos/curso_service.dart';
import 'package:app/app/services/cursos/curso_service_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> cursoServiceProvider = [
  Provider<CursoService>(
    create: (context) =>
        CursoServiceImpl(logger: context.read(), restClient: context.read()),
  ),
];
