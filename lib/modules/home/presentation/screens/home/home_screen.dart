import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/injector.dart';
import '../../../../../core/utils/enums.dart';
import '../../bloc/home_bloc.dart';
import '../../widgets/home/home_error_widget.dart';
import '../../widgets/home/home_loaded_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<HomeBloc>()
        ..add(GetHomeProductEvent(context: context)),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.getAllProductRequestState) {
            case RequestState.loading:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            case RequestState.loaded:
              return HomeLoadedBody(
                products: state.products,
              );
            case RequestState.error:
              return HomeErrorWidget(state: state);
          }
        },
      ),
    );
  }
}
