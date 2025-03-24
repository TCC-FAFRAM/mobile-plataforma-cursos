abstract interface class BaseRepository<T, F, L, R> {
  Future<List<R>> list(L params);
  Future<T> find(F params);
  Future<void> save(T data);
  Future<void> update(T data);
  Future<void> delete(T data);
  Future<void> synchronize(dynamic listData, bool clean);
  String tableName();
}
