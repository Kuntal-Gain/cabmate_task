import 'package:flutter/material.dart';
class prof extends StatefulWidget {
  const prof({super.key});

  @override
  State<prof> createState() => _profState();
}

class _profState extends State<prof> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
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
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Accounts Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
              ),
              title: Text('Enable Face ID/Touch ID'),
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
                  Icon(Icons.info_outline,color: Colors.blue,size: 30,),
                ],
              ),
            ),

            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
              ),
              title: Text('Manage Account'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
              ),
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
              title: Text('Change Currency'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Payment",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text('Payment Method'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
              title: Text('My Wallet'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
              ),
              title: Text('Add Money'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
              ),
              title: Text('Send Money'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}
