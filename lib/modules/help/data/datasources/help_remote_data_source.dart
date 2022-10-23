import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../models/item_help_model.dart';

abstract class HelpRemoteDataSource {
  Future<List<ItemHelpModel>> getHelp();
}

class HelpRemoteDataSourceImplementation implements HelpRemoteDataSource {
  final DioConsumer dioConsumer;

  HelpRemoteDataSourceImplementation({required this.dioConsumer});
  @override
  Future<List<ItemHelpModel>> getHelp() async {
    final result = await dioConsumer.get(EndPoint.getHelp);

    return List<ItemHelpModel>.of(
      (result['help'] as List).map(
        (e) => ItemHelpModel.fromMap(e),
      ),
    );
  }
}
