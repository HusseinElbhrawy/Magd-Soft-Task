import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/injector.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/utils/values_managers.dart';
import '../bloc/help_bloc.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          serviceLocator<HelpBloc>()..add(const HelpEvent()),
      child: BlocBuilder<HelpBloc, HelpState>(
        builder: (context, state) {
          switch (state.getHelpRequestState) {
            case RequestState.loading:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            case RequestState.loaded:
              return HelpLoadedBody(state: state);
            case RequestState.error:
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Constant.horizontalDivider(),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HelpBloc>().add(const HelpEvent());
                      },
                      child: const Text(
                        'Retry',
                      ),
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

class HelpLoadedBody extends StatelessWidget {
  const HelpLoadedBody({Key? key, required this.state}) : super(key: key);
  final HelpState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Constant.fixedElevatedButtonSize(context),
            ),
            onPressed: () {
              context.read<HelpBloc>().goToNextPage(context);
            },
            child: const Text(AppStrings.continueT),
          ),
        ],
      ),
      appBar: AppBar(
        toolbarHeight: context.isPortrait
            ? context.height / AppSize.s8
            : context.height / AppSize.s4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          alignment: AlignmentDirectional.center,
        ),
        title: Text(
          AppStrings.help,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: context.height / AppSize.s3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(.5),
                    AppColors.primary.withOpacity(.3),
                    AppColors.white,
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: state.data.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExpansionTileCard(
                initialPadding: const EdgeInsets.all(AppPadding.p8),
                borderRadius: BorderRadius.circular(AppSize.s16),
                finalPadding: const EdgeInsets.all(AppPadding.p8),
                title: Text(
                  state.data[index].question,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primary),
                ),
                initiallyExpanded: context.read<HelpBloc>().items[index],
                animateTrailing: true,
                shadowColor: AppColors.black,
                initialElevation: AppSize.s20,
                elevation: AppSize.s20,
                elevationCurve: Curves.easeIn,
                children: [
                  Container(
                    margin: const EdgeInsets.all(AppMargin.m16),
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s16),
                    ),
                    child: Text(
                      state.data[index].answer,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
