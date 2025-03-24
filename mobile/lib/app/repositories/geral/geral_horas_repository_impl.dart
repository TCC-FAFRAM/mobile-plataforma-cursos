// import '../../core/database/sqlite_connection_factory.dart';
// import '../../core/database/utils/sqlite_table_names.dart';
// import '../../core/exceptions/database_exception.dart';
// import '../../dtos/pagination_filter_dto.dart';
// import '../../entities/horas_geral.dart';
// import '../base_repository.dart';

// class GeralHorasRepositoryImpl
//     implements
//         BaseRepository<HorasGeral, int, PaginationFilterDTO, HorasGeral> {
//   final SqliteConnectionFactory _connection;
//   final String _tableName = SqliteTableNames.HORAS_GERAL;
//   final String _id = 'codigo = ?';
//   final String _orderBy = 'dia_semana';

//   GeralHorasRepositoryImpl({
//     required SqliteConnectionFactory connection,
//   }) : _connection = connection;

//   @override
//   Future<HorasGeral> find(int? id) async {
//     try {
//       final db = await _connection.openConnection();

//       String whereString;
//       List<dynamic> whereArguments = [];

//       whereString = _id;
//       whereArguments = [id];

//       final result = await db.query(
//         _tableName,
//         where: whereString,
//         whereArgs: whereArguments,
//       );

//       return HorasGeral.fromMap(result.first);
//     } catch (e, s) {
//       throw DatabaseException(error: e, source: s);
//     }
//   }

//   @override
//   Future<List<HorasGeral>> list(PaginationFilterDTO params) async {
//     try {
//       final db = await _connection.openConnection();
//       var newDate = DateTime.now();
//       var select = '''
//          SELECT *
//               FROM horas_geral
//              WHERE DATE(SUBSTR(data, 7, 4) || '-' || SUBSTR(data, 4, 2) || '-' || SUBSTR(data, 1, 2))
//           BETWEEN '${params.filter?.initialDate ?? newDate}' AND '${params.filter?.finalDate ?? newDate}'
//           ''';

//       final result = await db.rawQuery(select);

//       // final result = await db.query(
//       //   _tableName,
//       //   where:
//       //       ''' DATE(SUBSTR(data, 7, 4) || '-' || SUBSTR(data, 4, 2) || '-' || SUBSTR(data, 1, 2)) BETWEEN '?' AND '?' ''',
//       //   whereArgs: [params.filter.initialDate, params.filter.finalDate],
//       //   orderBy: _orderBy,
//       //   limit: params.take,
//       //   offset: params.skip,
//       // );

//       return result.map((e) => HorasGeral.fromMap(e)).toList();
//     } catch (e, s) {
//       throw DatabaseException(error: e, source: s);
//     }
//   }

//   @override
//   Future<void> save(HorasGeral data) async {
//     try {
//       final db = await _connection.openConnection();
//       await db.transaction((txn) async {
//         await txn.insert(_tableName, data.toMap());
//       });
//     } on Exception catch (e, s) {
//       throw DatabaseException(error: e, source: s);
//     }
//   }

//   @override
//   Future<void> update(HorasGeral data) async {
//     try {
//       final db = await _connection.openConnection();
//       await db.transaction((txn) async {
//         await txn.update(_tableName, data.toMap());
//       });
//     } on Exception catch (e, s) {
//       throw DatabaseException(error: e, source: s);
//     }
//   }

//   @override
//   Future<void> delete(HorasGeral data) async {
//     try {
//       final db = await _connection.openConnection();
//       await db.transaction((txn) async {
//         await txn.delete(_tableName);
//       });
//     } catch (e, s) {
//       throw DatabaseException(error: e, source: s);
//     }
//   }

//   @override
//   Future<void> synchronize(dynamic listData, bool clean) async {
//     try {
//       final db = await _connection.openConnection();
//       await db.transaction((txn) async {
//         var batch = txn.batch();

//         txn.rawUpdate('''
//               update $_tableName set sincronizado = 'N'
//             ''');

//         for (var data in listData) {
//           if (data is Map<String, dynamic>) {
//             batch.insert(_tableName, HorasGeral.fromMap(data).toMap());
//           }
//         }

//         txn.delete(
//           _tableName,
//           where: 'sincronizado = ?',
//           whereArgs: ['N'],
//         );

//         await batch.commit(noResult: true);
//       });
//     } catch (e, s) {
//       throw DatabaseException(error: e, source: s);
//     }
//   }

//   @override
//   String tableName() {
//     return _tableName;
//   }
// }
