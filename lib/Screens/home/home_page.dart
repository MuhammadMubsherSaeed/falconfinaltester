import 'package:falconfinaltester/Screens/home/pet_reg.dart';
import 'package:falconfinaltester/Screens/home/visitorcard/visitor_card.dart';
import 'package:flutter/material.dart';
import '../../Custom_widget/falcon_button.dart';
import 'building_altration.dart';
import 'complain_portal.dart';
import 'dues/duesportal.dart';
import 'e_tag.dart';

class Homescreen extends StatelessWidget {
  void handleLogout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/LoginScreen',
      (route) => false,
    );
  }

  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              // Add the logout button to the drawer
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () => handleLogout(context),
              ),
              SizedBox(
                height: 10,
              ),
              // ListTile(
              //   leading: Icon(Icons.delete_forever),
              //   title: Text('Remove Account'),
              //   onTap: () => handleLogout(context),
              // ),
              ListTile(
                leading: Icon(Icons.delete_forever),
                title: Text('Remove Account'),
                onTap: () {
                  // Show a confirmation dialog to confirm account disable
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
                          // TextButton(
                          //   child: Text('Disable'),
                          //   onPressed: () {
                          //     // Add the code to disable the account here
                          //     // This could involve updating user account status or data
                          //     // and logging the user out or handling account inactivity
                          //     // Be sure to implement the logic according to your specific needs.

                          //     // After disabling the account, you can log the user out
                          //     handleLogout(context);
                          //   },
                          // ),
                          TextButton(
                            child: Text('Disable'),
                            onPressed: () async {
                              // Add the code to delete the user's account from the database here
                              bool deleted =
                                  await deleteUserAccount(); // Replace with your own function

                              if (deleted) {
                                // If the account is successfully deleted, log the user out
                                handleLogout(context);
                              } else {
                                // Handle the case where the account deletion failed
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Account Deletion Failed'),
                                      content: Text(
                                          'Unable to delete your account at the moment. Please try again later.'),
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
                          )
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
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Complainportal()));
                      },
                      child: Container(
                        height: 160,
                        width: 180,
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
                                // onpress: () {
                                //   // Navigator.push(
                                //   //     context,
                                //   //     MaterialPageRoute(
                                //   //         builder: (_) => Complainportal()));
                                // },
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
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DuesandBillPortal(),
                          ),
                        );
                      },
                      child: Container(
                        height: 160,
                        width: 180,
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
                                // onpress: () {
                                //   // Navigator.push(
                                //   //   context,
                                //   //   MaterialPageRoute(
                                //   //     builder: (_) => WebViews(),
                                //   //   ),
                                //   // );
                                // },
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
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Etag()));
                      },
                      child: Container(
                        height: 160,
                        width: 180,
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
                                // onpress: () {
                                //   Navigator.push(context,
                                //       MaterialPageRoute(builder: (_) => Etag()));
                                // },
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
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VisitorCard(),
                          ),
                        );
                      },
                      child: Container(
                        height: 160,
                        width: 180,
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
                                // onpress: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (_) => VisitorCard(),
                                //     ),
                                //   );
                                // },
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
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Petreg()));
                      },
                      child: Container(
                        height: 160,
                        width: 180,
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
                                // onpress: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (_) => Petreg()));
                                // },
                                btn: "       Pets \n Registation",
                                fontsizebtn: 20,
                                fontweihtbtn: FontWeight.bold,
                                btncolor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Buildingalteration()));
                      },
                      child: Container(
                        height: 160,
                        width: 180,
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
                                // onpress: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (_) => Buildingalteration()));
                                // },
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  deleteUserAccount() {}
}
