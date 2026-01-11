import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_erp/core/di/injection.dart';
import 'package:smart_erp/features/home/presentation/cubit/home_state.dart';
import 'package:smart_erp/features/home/presentation/pages/all_employees_screen.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/home_cubit.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1️⃣ BlocProvider: بنوفر الكيوبت للشاشة وبنقوله "هات البيانات فوراً"
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getDashboardData(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dashboard Overview",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // 2️⃣ BlocBuilder: هنا بنسمع لتغييرات الكيوبت عشان نحدث الشاشة
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  // قيم افتراضية
                  String employeesCount = "..."; // يظهر نقط لحد ما يحمل
                  bool isLoading = false;

                  // لو الحالة تحميل
                  if (state is HomeLoading) {
                    isLoading = true;
                  }
                  // لو نجح وجاب الرقم
                  else if (state is HomeLoaded) {
                    employeesCount = state.employeeCount.toString();
                  }
                  // لو حصل خطأ (ممكن تظهر رسالة خطأ، بس هنا هنخليها علامة تعجب)
                  else if (state is HomeError) {
                    employeesCount = "!";
                  }

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    children: [
                      // 👇 الكارت ده بقى ذكي وبيتغير بناء على الداتا بيز
                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            )
                          : SummaryCard(
                              title: "Total Employees",
                              value: employeesCount, // 👈 الرقم الحقيقي هنا
                              icon: Icons.people_alt_outlined,
                              iconColor: AppColors.secondary,
                              onTap: () {
                                print("printed");
                                // نتأكد إن الحالة Loaded وإن القائمة موجودة
                                if (state is HomeLoaded) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllEmployeesScreen(
                                        employees: state
                                            .employees, // بنبعت القائمة للشاشة الجديدة
                                      ),
                                    ),
                                  );
                                }
                                else{
                                  print("State is not HomeLoaded, current state is: $state");
                                }
                              },
                            ),

                      // باقي الكروت لسه ثابتة (هنربطهم بعدين)
                      const SummaryCard(
                        title: "Attendance",
                        value: "92%",
                        icon: Icons.timer_outlined,
                      ),
                      const SummaryCard(
                        title: "New Requests",
                        value: "5",
                        icon: Icons.description_outlined,
                      ),
                      const SummaryCard(
                        title: "Projects",
                        value: "12",
                        icon: Icons.work_outline,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hello, Admin",
                style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
