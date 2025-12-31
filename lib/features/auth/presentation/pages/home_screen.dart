import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          "Smart ERP Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      drawer: _buildDrawer(context), // القائمة الجانبية
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ترحيب
            const Text(
              "Overview",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // كروت الإحصائيات (Stat Cards)
            Row(
              children: [
                _buildStatCard("Employees", "120", Icons.people, Colors.orange),
                const SizedBox(width: 15),
                _buildStatCard(
                  "Products",
                  "450",
                  Icons.inventory,
                  Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 30),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 15),

            // شبكة الأقسام (Grid)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildMenuCard(
                    context,
                    "HR System",
                    Icons.groups,
                    Colors.blue,
                  ),
                  _buildMenuCard(
                    context,
                    "Inventory",
                    Icons.warehouse,
                    Colors.green,
                  ),
                  _buildMenuCard(
                    context,
                    "Sales",
                    Icons.shopping_cart,
                    Colors.redAccent,
                  ),
                  _buildMenuCard(
                    context,
                    "Reports",
                    Icons.bar_chart,
                    Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت داخلي للكروت الإحصائية
  Widget _buildStatCard(
    String title,
    String count,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(
              count,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(title, style: const TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  // ويدجت داخلي لكروت القائمة
  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        // هنا هنربط بالصفحات الجاية
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // القائمة الجانبية
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.primary),
            accountName: Text("Admin User"),
            accountEmail: Text("admin@erp.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              // كود الخروج مستقبلاً
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
