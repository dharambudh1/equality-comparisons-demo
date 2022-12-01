import 'package:equatable/equatable.dart';

class PersonModel {
  final String id;
  final String name;

  const PersonModel({
    required this.id,
    required this.name,
  });
}

class PersonModelWithOverrideOperatorAndHashCode {
  final String id;
  final String name;

  const PersonModelWithOverrideOperatorAndHashCode({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PersonModelWithOverrideOperatorAndHashCode &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            name == other.name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}


class PersonModelWithEquatable extends Equatable {
  final String id;
  final String name;

  const PersonModelWithEquatable({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
