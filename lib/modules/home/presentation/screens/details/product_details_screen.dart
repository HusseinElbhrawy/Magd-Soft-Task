import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';
import '../../widgets/details/custom_details_screen_app_bar_widget.dart';
import '../../widgets/details/product_details_item_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.productEntity,
  }) : super(key: key);
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomDetailsScreenAppBar(),
          ProductDetailsItemWidget(productEntity: productEntity),
        ],
      ),
    );
  }
}
