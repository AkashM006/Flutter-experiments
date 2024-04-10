import 'package:freezed_annotation/freezed_annotation.dart';

part "person.freezed.dart";
part "person.g.dart";

const defaultPerson = Person(
  name: "",
  id: -1,
);

@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required int id,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
