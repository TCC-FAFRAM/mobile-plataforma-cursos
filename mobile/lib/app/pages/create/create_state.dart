import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'create_state.g.dart';

@match
enum CreateStateStatus {
  initial,
  loading,
  loaded,
  error,
  sucess,
  warning,
  typeUser,
}

final class CreateState extends Equatable {
  final CreateStateStatus status;
  final bool newVersion;
  final String? urlPublished;
  final String? message;
  final String? user;

  const CreateState({
    required this.status,
    this.newVersion = false,
    this.urlPublished,
    this.message,
    required this.user,
  });

  const CreateState.initial()
      : status = CreateStateStatus.initial,
        newVersion = false,
        urlPublished = null,
        message = null,
        user = null;

  @override
  List<Object?> get props => [status, message, user];

  CreateState copyWith({
    CreateStateStatus? status,
    bool? newVersion,
    String? urlPublished,
    String? message,
    String? user,
  }) {
    return CreateState(
      status: status ?? this.status,
      newVersion: newVersion ?? this.newVersion,
      urlPublished: urlPublished ?? this.urlPublished,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
