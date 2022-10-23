import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injector.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/utils/values_managers.dart';
import '../../bloc/login/login_bloc.dart';
import '../../widgets/login/auth_widget.dart';
import '../../widgets/login/other_auth_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LoginBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            //!Image
            SizedBox(
              height: context.isPortrait
                  ? context.height / AppSize.s2_5
                  : context.height / AppSize.s1_5,
              width: double.infinity,
              child: Image.asset(
                AppImageAssets.loginLogo,
                fit: BoxFit.fill,
              ),
            ),
            //! Auth and other auth method widget
            Stack(
              children: const [
                OtherAuthWidget(),
                AuthWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
