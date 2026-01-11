import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart'; // تأكد إن الملف ده موجود وفيه مسار اللوجو
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: "g@gmail.com");
  final passwordController = TextEditingController(text: "123456");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor:
            AppColors.background, // الخلفية الداكنة (الكحلي/الأسود)
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // 1. الانتقال للصفحة الرئيسية
              Navigator.of(context).pushReplacementNamed(Routes.home);

              // 2. رسالة ترحيب خضراء (لون البراند)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Welcome Back, ${state.user.name} 👋",
                    style: const TextStyle(color: AppColors.onPrimary),
                  ),
                  backgroundColor: AppColors.primary,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else if (state is LoginError) {
              // رسالة خطأ حمراء
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              // 👈 إضافة مهمة لحماية المحتوى من الحواف
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 1. اللوجو
                        Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors
                                  .surface, // لون الكروت (أفتح من الخلفية قليلاً)
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ), // ظل أقوى عشان الخلفية غامقة
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Image.network(
                              "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg", // 👈 رابط ينتهي بـ jpg
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        // 2. نصوص الترحيب
                        const Text(
                          "Welcome Back!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary, // أبيض
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sign in to continue to Smart ERP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary, // رمادي
                          ),
                        ),
                        const SizedBox(height: 40),

                        // 3. حقل الإيميل
                        CustomTextField(
                          controller: emailController,
                          label: "Email Address",
                          icon: Icons.email_outlined,
                          validator: (value) =>
                              value!.isEmpty ? "Required" : null,
                        ),
                        const SizedBox(height: 20),

                        // 4. حقل الباسورد
                        CustomTextField(
                          controller: passwordController,
                          label: "Password",
                          icon: Icons.lock_outline,
                          isPassword: true,
                          validator: (value) =>
                              value!.isEmpty ? "Required" : null,
                        ),
                        const SizedBox(height: 40),

                        // 5. زر الدخول
                        state is LoginLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              )
                            : CustomButton(
                                text: "LOGIN",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // إغلاق الكيبورد قبل الإرسال لتجربة مستخدم أفضل
                                    FocusScope.of(context).unfocus();

                                    context.read<LoginCubit>().userLogin(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                      ],
                    ),
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
