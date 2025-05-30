import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';
import 'package:flutter_application_1/src/features/core/controlers/navbar.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/all_topic.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/bleeding.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/burns.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/choking.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/cpr.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/poisons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(appBar: _buildAppBar(height), body: _buildBody(context));
  }

  AppBar _buildAppBar(double height) {
    return AppBar(
      leading: const Icon(Icons.menu, color: Color.fromARGB(255, 139, 47, 49)),
      title: IconButton(
        onPressed: () {},
        icon: Image(image: AssetImage(tLogo), height: height * 0.05),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: tCardBgColor,
          ),
        ),
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            color: Color.fromARGB(255, 139, 47, 49),
          ),
          onSelected: (value) {},
          itemBuilder:
              (context) => [
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
                const PopupMenuItem(value: 'help', child: Text('Help')),
                const PopupMenuItem(value: 'logout', child: Text('Logout')),
              ],
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            _buildEmergencyCallContainer(context),
            const SizedBox(height: 25.0),
            _buildFirstButtonRow(context),
            const SizedBox(height: 15.0),
            _buildSecondButtonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyCallContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(25), // Increased inner padding
      width: double.infinity, // Make container take full width
      constraints: BoxConstraints(
        minHeight: 180, // Set minimum height
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ), // Slightly larger border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center contents vertically
        children: [
          Text(
            'EMERGENCY NUMBER',
            style: TextStyle(
              fontSize: 20, // Larger font size
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: tSecondaryColor,
            ),
          ),
          const SizedBox(height: 20), // Increased spacing
          Container(
            width: 140, // Wider button
            height: 70, // Taller button
            decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: BorderRadius.circular(15), // Larger border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => _makeEmergencyCall(context),
                child: Center(
                  child: Text(
                    'CALL 112',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Larger font size
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(context, tCprimg, tCpr, const CprScreen()),
        const SizedBox(width: 15.0),
        _buildButton(context, tWoundimg, tBleeding, const WoundScreen()),
        const SizedBox(width: 15.0),
        _buildButton(context, tBurnimg, 'Burns', const BurnScreen()),
      ],
    );
  }

  Widget _buildSecondButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(context, tChokingimg, tChoking, const ChokingScreen()),
        const SizedBox(width: 15.0),
        _buildButton(context, tPoisonimg, tPoisons, const PoisonScreen()),
        const SizedBox(width: 15.0),
        _buildButton(
          context,
          tServiceToOhersimg,
          tAllTopics,
          const AllTopicsScreen(),
        ),
      ],
    );
  }

  void _makeEmergencyCall(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Emergency Call'),
            content: const Text('Are you sure you want to call 112?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Uncomment after adding url_launcher:
                  // launch('tel:112');
                },
                child: const Text('Call'),
              ),
            ],
          ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String image,
    String text,
    Widget screen,
  ) {
    return SizedBox(
      width: 100,
      height: 100,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          foregroundColor: tWhiteColor,
          backgroundColor: tPrimaryColor,
          side: BorderSide(color: tSecondaryColor),
          padding: const EdgeInsets.all(8.0),
        ),
        onPressed: () {
          if (screen is AllTopicsScreen) {
            Get.find<NavigationController>().selectedIndex.value = 1;
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image), width: 40.0),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
