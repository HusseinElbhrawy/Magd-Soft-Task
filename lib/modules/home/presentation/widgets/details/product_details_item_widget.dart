import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../domain/entities/product_entity.dart';
import 'Custom_product_details_widget.dart';
import '../home/custom_gradient_widget.dart';

import '../../../../../core/utils/values_managers.dart';

class ProductDetailsItemWidget extends StatelessWidget {
  const ProductDetailsItemWidget({
    Key? key,
    required this.productEntity,
  }) : super(key: key);
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          const CustomGradientWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.name,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                ),
                Text(
                  productEntity.type,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                ),
                Constant.horizontalDivider(),
                Hero(
                  tag: productEntity.id,
                  child: Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.white,
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(
                          productEntity.image,
                          height: context.height / 3,
                          width: context.width / 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Constant.horizontalDivider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: context.height / 7,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Material(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.white,
                          elevation: 20,
                          child: Image.network(productEntity.image),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Constant.verticalDivider(),
                      itemCount: 4,
                    ),
                  ),
                ),
                Constant.horizontalDivider(),
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(16),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/acer.png',
                        width: 75,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(productEntity.type),
                    subtitle: Text(
                      'View Store',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300,
                        onPrimary: AppColors.primary,
                        padding: const EdgeInsets.all(8),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.arrow_forward_ios_sharp),
                    ),
                  ),
                ),
                Constant.horizontalDivider(),
                ListTile(
                  title: const Text('Price'),
                  subtitle: Text(productEntity.price.toString()),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        context.width / AppSize.s2,
                        context.height / AppSize.s20,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Add To Cart'),
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: context.width / AppSize.s8,
                  endIndent: context.width / AppSize.s8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomProductDetailsWidget(
                      isVisible: true,
                      color: AppColors.black,
                      title: 'Overview',
                      voidCallback: () {},
                    ),
                    CustomProductDetailsWidget(
                      isVisible: false,
                      color: AppColors.black,
                      title: 'Specification',
                      voidCallback: () {},
                    ),
                    CustomProductDetailsWidget(
                      isVisible: false,
                      color: AppColors.black,
                      title: 'Review',
                      voidCallback: () {},
                    ),
                  ],
                ),
                Constant.horizontalDivider(),
                Text(
                  productEntity.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
