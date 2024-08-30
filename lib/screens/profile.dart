import 'package:cabmate_task/screens/gift_card_screen.dart';
import 'package:cabmate_task/widgets/profile_card_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/img_1.png'),
            ),
            SizedBox(width: 10),
            Text("Emma Brown"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Accounts Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/5107/5107483.png',
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Text('Enable Face ID/Touch ID'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                  ),
                  const Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                    size: 30,
                  ),
                ],
              ),
            ),
            profileCardTile(Colors.pink, "Manage Account", Icons.person),
            profileCardTile(Colors.green, "Change Password", Icons.password),
            profileCardTile(Colors.yellow, "Change Currency",
                Icons.currency_exchange_sharp),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Payment",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            profileCardTile(Colors.red, "Payment Method", Icons.payment),
            profileCardTile(Colors.blue, "My Wallet", Icons.wallet),
            profileCardTile(Colors.orange, "Add Money", Icons.money),
            profileCardTile(Colors.greenAccent, "Send Money", Icons.money),
            const Padding(padding: EdgeInsets.all(10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Gift Card",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GiftCardScreen())),
              child: profileCardTile(
                  Colors.brown, "Send Gift Card", Icons.wallet_giftcard),
            ),
            profileCardTile(
                Colors.blue, "Redeem Gift Card", Icons.card_giftcard),
            const Padding(padding: EdgeInsets.all(10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Support",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            profileCardTile(Colors.yellow, "About us", Icons.info),
            profileCardTile(Colors.black, "Privacy Policy", Icons.privacy_tip),
            profileCardTile(
                Colors.redAccent, "Terms & Conditions", Icons.file_open),
            profileCardTile(
                Colors.pinkAccent, "FAQ", Icons.question_mark_outlined),
            profileCardTile(Colors.greenAccent, "Live Chat", Icons.chat),
            profileCardTile(
                Colors.orangeAccent, "Contact Us", Icons.question_answer),
            const Padding(padding: EdgeInsets.all(10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Other",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            profileCardTile(Colors.blueAccent, "Logout", Icons.logout),
          ],
        ),
      ),
    );
  }
}
