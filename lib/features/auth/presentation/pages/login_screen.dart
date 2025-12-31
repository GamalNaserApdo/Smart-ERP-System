import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_erp/core/routes/app_routes.dart';
import 'package:smart_erp/core/widgets/custom_button.dart';
import 'package:smart_erp/core/widgets/custom_text_field.dart';
import 'package:smart_erp/utils/app_assets.dart';
import 'package:smart_erp/utils/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: "admin@erp.com");
  final passwordController = TextEditingController(text: "123456");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.background, // الخلفية الهادئة
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushReplacementNamed(Routes.home);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Welcome Back, ${state.user.name} 👋"),
                  backgroundColor: AppColors.primary,
                  behavior: SnackBarBehavior.floating, // تظهر عائمة وشيك
                ),
              );
              // TODO: Navigate to Home
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 1. اللوجو والعنوان
                      // افترضت أن اسم الصورة logo.png لو مختلف غيره هنا
                      // تأكد أن الصورة موجودة في assets/icons/logo.png (أو الاسم اللي عندك)
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          // هنا بنعرض اللوجو بتاعك
                          child: Image.asset(AppAssets.logo),
                        ),
                      ),
                      const SizedBox(height: 40),

                      const Text(
                        "Welcome Back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Sign in to continue to Smart ERP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // 2. حقل الإيميل بتصميم حديث
                      CustomTextField(
                        controller: emailController,
                        label: "Email Address",
                        icon: Icons.email_outlined,
                        validator: (value) =>
                            value!.isEmpty ? "Required" : null,
                      ),
                      const SizedBox(height: 20),

                      // 3. حقل الباسورد
                      CustomTextField(
                        controller: passwordController,
                        label: "Password",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        validator: (value) =>
                            value!.isEmpty ? "Required" : null,
                      ),
                      const SizedBox(height: 40),

                      // 4. زرار الدخول
                      state is LoginLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            )
                          : SizedBox(
                              height: 56, // زرار عريض ومريح
                              child: CustomButton(
                                // 👈 استخدام الزر الجديد
                                text: "LOGIN",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<LoginCubit>().userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
