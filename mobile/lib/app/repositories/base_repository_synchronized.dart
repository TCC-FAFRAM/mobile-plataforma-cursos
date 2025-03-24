import 'base_repository.dart';

abstract interface class BaseRepositorySyncronized<T, F, L, R>
    implements BaseRepository<T, F, L, R> {
  Future<List<dynamic>> synchronizeSend();
  Future<void> synchronizeClean();
}
