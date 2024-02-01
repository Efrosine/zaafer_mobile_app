import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zaafer_mobile_app/config/constants/constant.dart';
import 'package:zaafer_mobile_app/config/extentions/textstyle_util.dart';
import 'package:zaafer_mobile_app/features/auth/presentation/widgets/custom_tf.dart';

import '../../../../core/common/custom_widgets/dialog_widget/warning_dialog.dart';
import '../../domain/entities/auth_entity.dart';
import '../bloc/auth_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case AuthSuccessState:
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: CColor.positive,
              content: Text('Sign Up Success'),
            ));
            break;
          case AuthErrorState:
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

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
              Form(
                key: globalKey,
                child: Column(
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) => current is AuthEmailChangedState,
                      builder: (context, state) {
                        return CustomTF(
                          controller: emailController,
                          label: 'Email',
                          hintText: 'yanto123@gmail.com',
                          onChanged: (value) =>
                              blocRead.add(AuthEmailChangedEvent(email: value)),
                          errorMessage:
                              state is AuthEmailChangedState ? state.message : null,
                        );
                      },
                    ),
                    const Gap(24),
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) =>
                          current is AuthPasswordChangedState,
                      builder: (context, state) {
                        return CustomTF(
                          controller: passwordController,
                          label: 'Password',
                          hintText: 'yanto@123',
                          isPasword: false,
                          onChanged: (value) =>
                              blocRead.add(AuthPasswordChangedEvent(password: value)),
                          errorMessage:
                              state is AuthPasswordChangedState ? state.message : null,
                        );
                      },
                    ),
                    const Gap(24),
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) =>
                          current is AuthConfirmPasswordChangedState,
                      builder: (context, state) {
                        return CustomTF(
                          controller: confirmPasswordController,
                          label: 'Ulangi Password',
                          hintText: 'yanto@123',
                          isPasword: false,
                          onChanged: (value) => blocRead.add(
                              AuthConfirmPasswordChangedEvent(
                                  password: passwordController.text,
                                  confirmPassword: value)),
                          errorMessage: state is AuthConfirmPasswordChangedState
                              ? state.message
                              : null,
                        );
                      },
                    ),
                  ],
                ),
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
                      var email = emailController.text;
                      var password = passwordController.text;
                      blocRead.add(AuthSignUpEvent(
                          authEntity: AuthEntity(
                        email: email,
                        password: password,
                      )));
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
