import 'package:flutter/material.dart';
import '../../../Custom_widget/text_palcon.dart';
import 'billhistory.dart';
import 'genratebill.dart';

class DuesandBillPortal extends StatefulWidget {
  const DuesandBillPortal({super.key});

  @override
  State<DuesandBillPortal> createState() => _DuesandBillPortalState();
}

class _DuesandBillPortalState extends State<DuesandBillPortal>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
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
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Falcontext(
                        textvalue: "Dues And Fine",
                        fontsize1: 30,
                        bold1: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      // height: 50,
                      width: MediaQuery.of(context).size.height,
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
                                  text: 'Bill Genrate',
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
          ),
        ),
      ),
    );
  }
}
