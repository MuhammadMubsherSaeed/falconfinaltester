import 'package:falconfinaltester/Screens/home/building_altration.dart';
import 'package:falconfinaltester/Screens/home/complain_portal.dart';
import 'package:falconfinaltester/Screens/home/dues/duesportal.dart';
import 'package:falconfinaltester/Screens/home/e_tag.dart';
import 'package:falconfinaltester/Screens/home/home_page.dart';
import 'package:falconfinaltester/Screens/home/pet_reg.dart';
import 'package:flutter/material.dart';
import 'package:falconfinaltester/Screens/home/visitorcard/cardtypes/servant.dart';
import 'package:falconfinaltester/Screens/home/visitorcard/cardtypes/visitor.dart';

class VisitorCard extends StatefulWidget {
  const VisitorCard({super.key});

  @override
  State<VisitorCard> createState() => _VisitorCardState();
}

class _VisitorCardState extends State<VisitorCard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 4; // Set the index for Visitor Card

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Apply For Card'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.1,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(12),
                //   ),
                //   child: Falcontext(
                //     textvalue: "Apply For Card",
                //     fontsize1: MediaQuery.of(context).size.width * 0.1,
                //     bold1: FontWeight.bold,
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          controller: tabController,
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tabs: [
                            Tab(
                              text: 'Servant',
                            ),
                            Tab(
                              text: 'Visitor',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Tab2(),
                      Tab3(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 71, 156, 240),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Complainportal()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DuesandBillPortal()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Etag()),
        );
        break;
      case 4:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => VisitorCard()),
        // );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Petreg()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Buildingalteration()),
        );
        break;
      case 7:
        // Handle navigation for Visitor Card
        break;
    }
  }
}







// import 'package:falconfinaltester/Screens/home/visitorcard/cardtypes/servant.dart';
// import 'package:falconfinaltester/Screens/home/visitorcard/cardtypes/visitor.dart';
// import 'package:flutter/material.dart';

// import '../../../Custom_widget/text_palcon.dart';

// class VisitorCard extends StatefulWidget {
//   const VisitorCard({super.key});

//   @override
//   State<VisitorCard> createState() => _VisitorCardState();
// }

// class _VisitorCardState extends State<VisitorCard>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Falcontext(
//                         textvalue: "Apply For Card",
//                         fontsize1: 30,
//                         bold1: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Container(
//                       // height: 50,
//                       width: MediaQuery.of(context).size.height,
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TabBar(
//                               unselectedLabelColor: Colors.black,
//                               controller: tabController,
//                               labelColor: Colors.white,
//                               indicatorColor: Colors.white,
//                               indicatorWeight: 2,
//                               indicator: BoxDecoration(
//                                 color: Colors.brown,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               tabs: [
//                                 Tab(
//                                   text: 'Servant',
//                                 ),
//                                 Tab(
//                                   text: 'Visitor',
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         controller: tabController,
//                         children: [
//                           Tab2(),
//                           Tab3(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
