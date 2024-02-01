import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/features/auth/presentation/widgets/custom_tf.dart';

import '../../../../core/common/custom_widgets/dialog_widget/warning_dialog.dart';
import '../../../../core/common/overlay/loading_overlay.dart';
import '../bloc/auth_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              content: Text('Sign Up Success'),
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
            Navigator.pushReplacementNamed(context, '/signin');
          default:
        }
      },
      child: const SignUpContent(),
    );
  }
}

class SignUpContent extends StatelessWidget {
  const SignUpContent({super.key});

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
                CString.signupTitle,
                style: context.headlineLarge,
              ),
              const Gap(8),
              const Text(CString.signupSubtitle),
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
                          isPasword: false,
                          onChanged: (value) =>
                              blocRead.add(AuthPasswordChangedEvent(password: value)),
                          validator: (value) => state.password?.error,
                        ),
                        const Gap(24),
                        CustomTF(
                          label: 'Ulangi Password',
                          hintText: 'yanto@123',
                          isPasword: false,
                          onChanged: (value) => blocRead.add(
                              AuthConfirmPasswordChangedEvent(confirmPassword: value)),
                          validator: (value) => state.confirmPassword?.error,
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
                    CString.signupNav,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        blocRead.add(AuthChangeMethodEvent());
                      },
                      child: const Text('Masuk'))
                ],
              ),
              const Gap(32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    var state = globalKey.currentState!;
                    if (state.validate()) {
                      blocRead.add(AuthSignUpEvent());
                      state.reset();
                    }
                  },
                  child: const Text(CString.signupTitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
