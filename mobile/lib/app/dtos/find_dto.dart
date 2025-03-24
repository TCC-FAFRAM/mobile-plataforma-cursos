import 'base_dto.dart';

final class FindDTO<F, S, T> implements BaseDTO {
  final F primaryKey;
  final S? secondaryKey;
  final T? thirdKey;
  FindDTO({
    required this.primaryKey,
    this.secondaryKey,
    this.thirdKey,
  });
}
