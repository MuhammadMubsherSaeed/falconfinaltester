// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Custom_widget/falcon_button.dart';
import 'building_altration.dart';
import 'complain_portal.dart';
import 'dues/duesportal.dart';
import 'e_tag.dart';
import 'visitorcard/visitor_card.dart';
import 'pet_reg.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the index (0, 1, 2, etc.)
    switch (index) {
      case 0:
        // Navigate to the first screen (Complaint Portal)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 1:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Complainportal()),
        );
        break;
      case 2:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DuesandBillPortal()),
        );
        break;
      case 3:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Etag()),
        );
        break;
      case 4:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VisitorCard()),
        );
        break;
      case 5:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Petreg()),
        );
        break;
      case 6:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Buildingalteration()),
        );
        break;
      // Add cases for other screens as needed
    }
  }

  void handleLogout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/LoginScreen',
      (route) => false,
    );
  }

  Future<bool> deleteUserAccount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      final password = prefs.getString('password');

      if (email == null || password == null) {
        print('Email or password is null. Check SharedPreferences values.');
        return false;
      }

      print('Email: $email, Password: $password');

      final response = await http.post(
        Uri.parse(
            'http://182.180.146.190:8060/api/Tenant/RemoveAccount?Email=$email&Password=$password'),
        body: {
          'Email': email,
          'Password': password,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to remove account: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error removing account: $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () => handleLogout(context),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.delete_forever),
                title: Text('Remove Account'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Remove Account'),
                        content: Text(
                            'Are you sure you want to remove your account?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Remove Account'),
                            onPressed: () async {
                              bool deleted = await deleteUserAccount();

                              if (deleted) {
                                handleLogout(context);
                              } else {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Account Remove Failed'),
                                      content: Text(
                                        'Unable to remove your account at the moment. Please try again later.',
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("WELCOME"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Complainportal()),
                          );
                        },
                        child: Container(
                          height: screenWidth * 0.4,
                          width: screenWidth * 0.4,
                          color: Color.fromARGB(255, 121, 135, 101),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Falconbutton(
                                  btn: "Complaint\n    Portal",
                                  fontsizebtn: 20,
                                  fontweihtbtn: FontWeight.bold,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DuesandBillPortal()),
                          );
                        },
                        child: Container(
                          height: screenWidth * 0.4,
                          width: screenWidth * 0.4,
                          color: Color.fromARGB(255, 92, 108, 136),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.money_outlined,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Falconbutton(
                                  btn: "Dues &\n Fines",
                                  fontsizebtn: 20,
                                  fontweihtbtn: FontWeight.bold,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Etag()),
                          );
                        },
                        child: Container(
                          height: screenWidth * 0.4,
                          width: screenWidth * 0.4,
                          color: Color.fromARGB(255, 207, 93, 85),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.car_crash_sharp,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Falconbutton(
                                  btn: "     E-TAG \nRegistration",
                                  fontsizebtn: 20,
                                  fontweihtbtn: FontWeight.bold,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => VisitorCard()),
                          );
                        },
                        child: Container(
                          height: screenWidth * 0.4,
                          width: screenWidth * 0.4,
                          color: Color.fromARGB(255, 84, 141, 162),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.door_back_door_outlined,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Falconbutton(
                                  btn: "    Card \nIssuance",
                                  fontsizebtn: 20,
                                  fontweihtbtn: FontWeight.bold,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Petreg()),
                          );
                        },
                        child: Container(
                          height: screenWidth * 0.4,
                          width: screenWidth * 0.4,
                          color: Color.fromARGB(255, 198, 88, 105),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.pets,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Falconbutton(
                                  btn: "       Pets \n Registration",
                                  fontsizebtn: 20,
                                  fontweihtbtn: FontWeight.bold,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Buildingalteration()),
                          );
                        },
                        child: Container(
                          height: screenWidth * 0.4,
                          width: screenWidth * 0.4,
                          color: Color.fromARGB(177, 139, 127, 38),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.house_rounded,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Falconbutton(
                                  btn: "   Building\n Alterations",
                                  fontsizebtn: 20,
                                  fontweihtbtn: FontWeight.bold,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              Color.fromARGB(255, 71, 156, 240), // Set the background color
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'Complaints',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money_outlined),
              label: 'Dues & Fines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_crash_sharp),
              label: 'E-TAG Registration',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_back_door_outlined),
              label: 'Card Issuance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: 'Pets Registration',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.house_rounded),
              label: 'Building Alterations',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 11, 162, 34),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
