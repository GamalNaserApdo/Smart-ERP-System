class AppConstant {
  // 1️⃣ Supabase Configuration
  // هات القيم دي من Supabase Dashboard -> Project Settings -> API
  static const String BASE_URL =
      "https://bhpdkyioztnpesucpked.supabase.co/"; // 👈 حط الرابط بتاعك هنا
  static const String anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJocGRreWlvenRucGVzdWNwa2VkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjcyNzUyMjIsImV4cCI6MjA4Mjg1MTIyMn0.avK90qlvWX7ZqxmzsxWIFTj6U-jaCwr7Z6jjEVUMcfc"; // 👈 حط المفتاح الطويل هنا

  // 2️⃣ Connection Timeouts
  static const int connectTimeout = 30000; // 30 sec
  static const int receiveTimeout = 30000;

  // 3️⃣ Table Names
  static const String employeesTable = "employees";

  // 4️⃣ Fonts & UI
  static const String fontFamily = "Cairo";
}
