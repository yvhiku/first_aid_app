import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/features/core/screens/home/home_page.dart';
import 'package:flutter_application_1/src/features/core/screens/profile/profile.dart';
import 'package:flutter_application_1/src/features/core/screens/saved/saved.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/all_topic.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                );
              }
              return const TextStyle(color: Colors.grey, fontSize: 12);
            }),
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected:
                (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home, color: tPrimaryColor),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.task_copy, color: tPrimaryColor),
                label: 'Topics',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.book_saved, color: tPrimaryColor),
                label: 'Saved',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.profile_circle, color: tPrimaryColor),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const AllTopicsScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];
}
