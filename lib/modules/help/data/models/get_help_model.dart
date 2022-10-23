// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:magd_soft_task/modules/help/data/models/item_help_model.dart';
import 'package:magd_soft_task/modules/help/domain/entities/get_help_entity.dart';

class GetHelpModel extends GetHelpEntity {
  const GetHelpModel({
    required super.status,
    required super.message,
    required super.help,
  });

  GetHelpModel copyWith({
    int? status,
    String? message,
    List<ItemHelpModel>? help,
  }) {
    return GetHelpModel(
      status: status ?? this.status,
      message: message ?? this.message,
      help: help ?? this.help,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'help': help.map((x) => x).toList(),
    };
  }

  factory GetHelpModel.fromMap(Map<String, dynamic> map) {
    return GetHelpModel(
      status: map['status'] as int,
      message: map['message'] as String,
      help: List<ItemHelpModel>.from(
        (map['help'] as List<int>).map<ItemHelpModel>(
          (x) => ItemHelpModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetHelpModel.fromJson(String source) =>
      GetHelpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GetHelpModel(status: $status, message: $message, help: $help)';

  @override
  bool operator ==(covariant GetHelpModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        listEquals(other.help, help);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ help.hashCode;
}
