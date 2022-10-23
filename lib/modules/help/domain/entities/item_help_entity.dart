import 'package:equatable/equatable.dart';

class ItemHelpEntity extends Equatable {
  final int id;
  final String question;
  final String answer;

  const ItemHelpEntity({
    required this.id,
    required this.question,
    required this.answer,
  });
  @override
  List<Object?> get props => [
        id,
        question,
        answer,
      ];
}
