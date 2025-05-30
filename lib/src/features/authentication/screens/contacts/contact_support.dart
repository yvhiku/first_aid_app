import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tContactSupport),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                tSupportImage,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            SizedBox(height: tDefaultSize),

            Text(
              "We're here to help!",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              "Contact our support team through any of the following methods:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: tDefaultSize),

            _buildContactCard(
              context,
              icon: Icons.email,
              title: "Email Support",
              subtitle: "Get help via email",
              actionText: "Send Email",
              onTap: () => _launchUrl("yvhiku@yandex.ru"),
            ),

            _buildContactCard(
              context,
              icon: Icons.phone,
              title: "Phone Support",
              subtitle: "Call our support team",
              actionText: "Call Now",
              onTap: () => _launchUrl("tel:+79960808085"),
            ),

            _buildContactCard(
              context,
              icon: Icons.chat_bubble,
              title: "Live Chat",
              subtitle: "Chat with an agent",
              actionText: "Start Chat",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Live chat coming soon!")),
                );
              },
            ),

            SizedBox(height: tDefaultSize),

            Text(
              "Frequently Asked Questions",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ..._buildFAQItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: tDefaultSize - 10),
      child: Padding(
        padding: EdgeInsets.all(tDefaultSize - 5),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color.fromARGB(255, 125, 132, 197),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 125, 132, 197),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                actionText,
                style: TextStyle(color: Colors.white), // White text added here
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFAQItems(BuildContext context) {
    final faqs = [
      {
        "question": "How do I reset my password?",
        "answer":
            "You can reset your password through the 'Forgot Password' option on the login screen.",
      },
      {
        "question": "How do I contact customer service?",
        "answer":
            "Use any of the contact methods above or visit our website for more options.",
      },
    ];

    return faqs.map((faq) {
      return ExpansionTile(
        title: Text(faq["question"]!),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(faq["answer"]!),
          ),
        ],
      );
    }).toList();
  }
}
