import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../bloc/home_bloc.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    Key? key,
    required this.state,
  }) : super(key: key);
  final HomeState state;
  @override
  Widget build(BuildContext context) {
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
              context
                  .read<HomeBloc>()
                  .add(GetHomeProductEvent(context: context));
            },
            child: const Text(AppStrings.retry),
          )
        ],
      ),
    );
  }
}
