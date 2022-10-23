import 'package:flutter/material.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/utils/values_managers.dart';
import '../../../domain/entities/product_entity.dart';

class CustomHomeProductItemWidget extends StatelessWidget {
  const CustomHomeProductItemWidget({
    Key? key,
    required this.productEntity,
  }) : super(key: key);
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsRoute,
          arguments: productEntity,
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Stack(
                children: [
                  Hero(
                    tag: productEntity.id,
                    child: Image.network(
                      productEntity.image,
                      height: context.height / AppSize.s5,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                productEntity.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                productEntity.company,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Text(
                    '${productEntity.price.toString()} EGP',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s16),
                    bottomRight: Radius.circular(AppSize.s16),
                  ),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(AppSize.s16),
                        bottomEnd: Radius.circular(AppSize.s16),
                      ),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
