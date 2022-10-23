import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/utils/values_managers.dart';
import '../../../domain/entities/product_entity.dart';
import '../../bloc/home_bloc.dart';
import 'custom_gradient_widget.dart';
import 'custom_home_product_item_widget.dart';

class HomeLoadedBody extends StatelessWidget {
  const HomeLoadedBody({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          alignment: AlignmentDirectional.center,
        ),
        title: TextFormField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: AppStrings.search,
            suffixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          Constant.verticalDivider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.white,
              onPrimary: AppColors.grey,
            ),
            onPressed: () {},
            child: const Icon(Icons.filter_alt_rounded),
          ),
          Constant.verticalDivider(),
        ],
      ),
      body: Stack(
        children: [
          const CustomGradientWidget(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              children: [
                SizedBox(
                  height: context.height / AppSize.s5,
                  width: context.width,
                  //! We can here use carousel Builder
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: context.read<HomeBloc>().pageController,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s16),
                        ),
                        child: Image.asset(
                          'assets/images/acer.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: context.height / AppSize.s10,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: ChoiceChip(
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p16,
                            vertical: AppPadding.p4,
                          ),
                          disabledColor: AppColors.white,
                          selectedColor: AppColors.primary,
                          backgroundColor: Colors.red,
                          shadowColor: Colors.black,
                          label: Text(
                            context.read<HomeBloc>().category[index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.black),
                          ),
                          avatar: CircleAvatar(
                            backgroundImage: AssetImage(
                              context.read<HomeBloc>().category[index]['image'],
                            ),
                          ),
                          selected: index == 0 ? true : false,
                        ),
                      );
                    },
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Expanded(
                  child: MasonryGridView.count(
                    physics: const BouncingScrollPhysics(),
                    itemCount: products.length + 1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Text(
                              AppStrings.recommendedForYou,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          : CustomHomeProductItemWidget(
                              productEntity: products[--index],
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
