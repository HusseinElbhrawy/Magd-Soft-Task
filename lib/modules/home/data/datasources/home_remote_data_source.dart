import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getAllProduct();
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final DioConsumer dioConsumer;

  HomeRemoteDataSourceImplementation({required this.dioConsumer});
  @override
  Future<List<ProductModel>> getAllProduct() async {
    final result = await dioConsumer.get(EndPoint.getProducts);

    return List<ProductModel>.of(
      (result['products'] as List).map(
        (e) => ProductModel.fromMap(e),
      ),
    );
  }
}
