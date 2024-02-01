import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/constants/constant.dart';
import '../../../../config/extentions/textstyle_util.dart';

import '../../../../core/common/overlay/loading_overlay.dart';
import '../widgets/custom_tf.dart';
import '../bloc/auth_bloc.dart';
import '../../../../core/common/custom_widgets/dialog_widget/warning_dialog.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingOverlay = LoadingOverlay();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case AuthInitState:
            loadingOverlay.hide();
            break;
          case AuthLoadingState:
            loadingOverlay.show(context);
            break;
          case AuthSuccessState:
            loadingOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: CColor.positive,
              content: Text('Sign In Success'),
            ));
            Navigator.pushReplacementNamed(context, '/dataentry');
            break;
          case AuthErrorState:
            loadingOverlay.hide();
            state as AuthErrorState;
            showDialog(
                context: context,
                builder: (context) => WarningDialog(
                      message: state.message,
                    ));
            break;
          case AuthChangeMethodState:
            Navigator.pushReplacementNamed(context, '/signup');
          default:
        }
      },
      child: const SignInContent(),
    );
  }
}

class SignInContent extends StatelessWidget {
  const SignInContent({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    final blocRead = context.read<AuthBloc>();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CString.signinTitle,
                style: context.headlineLarge,
              ),
              const Gap(8),
              const Text(CString.signinSubtitle),
              const Gap(32),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        CustomTF(
                          label: 'Email',
                          hintText: 'yanto123@gmail.com',
                          onChanged: (value) =>
                              blocRead.add(AuthEmailChangedEvent(email: value)),
                          validator: (value) => state.email?.error,
                        ),
                        const Gap(24),
                        CustomTF(
                          label: 'Password',
                          hintText: 'yanto@123',
                          isPasword: true,
                          onChanged: (value) =>
                              blocRead.add(AuthPasswordChangedEvent(password: value)),
                          validator: (value) => state.password?.error,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Gap(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CString.signinNav,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        blocRead.add(AuthChangeMethodEvent());
                      },
                      child: const Text('Daftar'))
                ],
              ),
              const Gap(32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    var state = globalKey.currentState!;
                    if (state.validate()) {
                      blocRead.add(AuthSignInEvent());
                      state.reset();
                    }
                  },
                  // style: FilledButton.styleFrom(textStyle: TextStyle()),
                  child: const Text(CString.signinTitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
