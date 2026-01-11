// الكيوبت (الويتر/الجرسون): وظيفته ياخد الطلب ويوصله.

// الريبوزيتوري (مدير المطبخ): يعرف يجيب أي حاجة من الثلاجة.

// الـ UseCase (عنصر في المنيو - مثلاً "برجر"):

// أنت لما تطلب، بتشاور على "برجر" (UseCase).

// مش بتروح لمدير المطبخ تقوله "هات عيش ولحمة وشويهم وحط صوص" (Repository Call).

// الـ UseCase هو "الوصفة الجاهزة" اللي بتسهل التعامل بين الويتر والمطبخ.

// el malaf da hwa ele pykf pen el shasha we pen el 3mlyat el m3kda in the background(useCase)

// dol el states ele pytklm peha el cubit m3a el screen
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_erp/features/home/domain/usecases/get_all_employees_use_case.dart';
import 'package:smart_erp/features/home/domain/usecases/get_employees_count_use_case.dart';
import 'package:smart_erp/features/models/employee_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  // el cubit 7atet hena el rakm el 7yro7 ll el screen
  final int employeeCount;

  HomeLoaded(this.employeeCount, {required this.employees});

  final List<EmployeeModel> employees;
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

// 3ashan lma atlop el class da ya getit tedhony gahez
// extend Cybuit kda penkol en el cubit wazefto el wa7yda eno y8er el state
@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetEmployeesCountUseCase getEmployeesCountUseCase;
  final GetAllEmployeesUseCase getAllEmployeesUseCase;

  // talapana el useCase el 3mlnah fe el 5twa el fatet
  // el cubit awl maytwld 7yroo7 ll homeinit
  HomeCubit(
    this.getEmployeesCountUseCase, {
    required this.getAllEmployeesUseCase,
  }) : super(HomeInitial());

  Future<void> getDashboardData() async {
    emit(HomeLoading()); // 1. بنقول للشاشة تحمل

    // 2. بنبعت الطلبين في نفس الوقت (عشان نكسب وقت)
    final countResult = await getEmployeesCountUseCase.call();
    final listResult = await getAllEmployeesUseCase.call();

    // 3. بنفك الصندوق الأول (العدد)
    countResult.fold(
      (failure) => emit(HomeError(failure.message)), // لو فشل في العدد
      (count) {
        // 4. لو العدد نجح، نفك الصندوق التاني (القائمة)
        listResult.fold(
          (failure) => emit(HomeError(failure.message)), // لو فشل في القائمة
          (employeesList) {
            // ✅ 5. لو الاتنين نجحوا.. مبروك! نبعت البيانات كلها للشاشة
            emit(
              HomeLoaded(
                count, // العدد
                employees: employeesList, // القائمة
              ),
            );
          },
        );
      },
    );
  }
}
