import 'package:falconfinaltester/Screens/home/building_altration.dart';
import 'package:falconfinaltester/Screens/home/complain_portal.dart';
import 'package:falconfinaltester/Screens/home/e_tag.dart';
import 'package:falconfinaltester/Screens/home/home_page.dart';
import 'package:falconfinaltester/Screens/home/pet_reg.dart';
import 'package:falconfinaltester/Screens/home/visitorcard/visitor_card.dart';
import 'package:flutter/material.dart';
import 'billhistory.dart';
import 'genratebill.dart';

class DuesandBillPortal extends StatefulWidget {
  const DuesandBillPortal({Key? key});

  @override
  State<DuesandBillPortal> createState() => _DuesandBillPortalState();
}

class _DuesandBillPortalState extends State<DuesandBillPortal>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 2; // Set the index for Dues and Bill Portal

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dues And Fine'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,

              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   // child: Falcontext(
              //   //   textvalue: "Dues And Fine",
              //   //   fontsize1: 30,
              //   //   bold1: FontWeight.bold,
              //   // ),
              // ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            text: 'Bill Generate',
                          ),
                          Tab(
                            text: 'Bill History',
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
                    GenerateBill(),
                    BillHistory(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Dues and Fine',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 11, 162, 34),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index != 3) {
      // If the selected item is not E-TAG Registration, update the _selectedIndex and navigate accordingly
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Homescreen()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Complainportal()),
          );
          break;
        case 2:
          // The current screen (Dues and Bill Portal) is already selected
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => VisitorCard()),
          );
          break;
        case 5:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Petreg()),
          );
          break;
        case 6:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Buildingalteration()),
          );
          break;
        case 7:
          // Handle navigation for Dues and Fine Portal
          break;
      }
    } else {
      // If the selected item is E-TAG Registration, navigate to the E-TAG screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Etag()),
      );
    }
  }

// class _DuesandBillPortalState extends State<DuesandBillPortal>
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
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Falcontext(
//                   textvalue: "Dues And Fine",
//                   fontsize1: 30,
//                   bold1: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TabBar(
//                         unselectedLabelColor: Colors.black,
//                         controller: tabController,
//                         labelColor: Colors.white,
//                         indicatorColor: Colors.white,
//                         indicatorWeight: 2,
//                         indicator: BoxDecoration(
//                           color: Colors.brown,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         tabs: [
//                           Tab(
//                             text: 'Bill Generate',
//                           ),
//                           Tab(
//                             text: 'Bill History',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   controller: tabController,
//                   children: [
//                     GenerateBill(),
//                     BillHistory(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../../../Custom_widget/text_palcon.dart';
// import 'billhistory.dart';
// import 'genratebill.dart';

// class DuesandBillPortal extends StatefulWidget {
//   const DuesandBillPortal({super.key});

//   @override
//   State<DuesandBillPortal> createState() => _DuesandBillPortalState();
// }

// class _DuesandBillPortalState extends State<DuesandBillPortal>
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
//                         textvalue: "Dues And Fine",
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
//                                   text: 'Bill Genrate',
//                                 ),
//                                 Tab(
//                                   text: 'Bill History',
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
//                           GenerateBill(),
//                           BillHistory(),
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
}
