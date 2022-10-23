// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:magd_soft_task/modules/help/domain/entities/item_help_entity.dart';

class ItemHelpModel extends ItemHelpEntity {
  const ItemHelpModel({
    required super.id,
    required super.question,
    required super.answer,
  });

  ItemHelpModel copyWith({
    int? id,
    String? question,
    String? answer,
  }) {
    return ItemHelpModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  factory ItemHelpModel.fromMap(Map<String, dynamic> map) {
    return ItemHelpModel(
      id: map['id'] as int,
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemHelpModel.fromJson(String source) =>
      ItemHelpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ItemHelpModel(id: $id, question: $question, answer: $answer)';

  @override
  bool operator ==(covariant ItemHelpModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ answer.hashCode;
}
