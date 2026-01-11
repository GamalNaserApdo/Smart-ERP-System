class EmployeeModel {
  final int? id; // this can be null because subabse give the id
  final String? name;
  final String? email;
  final String role;
  final String department;
  final bool isActive;
  final int salary;

  EmployeeModel({
    this.id,
    this.name,
    this.email,
    required this.role,
    required this.department,
    required this.isActive,
    required this.salary,
  });

  // hen a pa2a el ta7wel men json 3ashan de el ptstakpel el data ele gaya men
  // supabase 3ashan tkdr tesa5demha fe el tatpek

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json["id"],
      name: json["name"] ?? "UnKnown",
      email: json["email"] ?? "",
      role: json["role"] ?? "Employee",
      department: json["department"] ?? "General",
      isActive: json["is_active"] ?? true,
      salary: json["salary"] ?? 0,
    );
  }

  // hena pa2a alw ardna ta7wel el opject le josn 3ashana deh le el supabase

  Map<String, dynamic> toJson() {
    return {
      "name": name, // ele e3la el yamen da esm el key fe el database
      "email": email,
      "role": role,
      "department": department,
      "is_active": isActive,
      "salary": salary,
    };
  }
}
