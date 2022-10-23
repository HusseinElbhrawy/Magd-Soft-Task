import 'package:equatable/equatable.dart';
import 'item_help_entity.dart';

class GetHelpEntity extends Equatable {
  final int status;
  final String message;
  final List<ItemHelpEntity> help;

  const GetHelpEntity({
    required this.status,
    required this.message,
    required this.help,
  });
  @override
  List<Object?> get props => [
        status,
        message,
        help,
      ];
}
