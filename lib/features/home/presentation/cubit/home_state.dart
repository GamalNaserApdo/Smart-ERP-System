// ⚠️ ماتنساش تعمل Import للموديل فوق خالص في الملف

// 1. حالة التحميل (لما الدائرة تلف)
import 'package:smart_erp/features/home/presentation/cubit/home_cubit.dart';
import 'package:smart_erp/features/models/employee_model.dart';

class EmployeesListLoading extends HomeState {}

// 2. حالة النجاح (لما البيانات تيجي)
class EmployeesListLoaded extends HomeState {
  final List<EmployeeModel>
  employees; // 👈 دي اللي كنت بتحاول تنادي عليها ومش لاقيها

  EmployeesListLoaded(this.employees);
}

// 3. حالة الخطأ (لو حصل مشكلة)
class EmployeesListError extends HomeState {
  final String message;

  EmployeesListError(this.message);
}
