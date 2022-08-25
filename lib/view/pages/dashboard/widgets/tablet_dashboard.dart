import 'package:estore_admin_panel/data/static.dart';
import 'package:estore_admin_panel/view/pages/dashboard/widgets/top_users_widgets.dart';
import 'package:estore_admin_panel/view/widgets/bar_charts.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/info_card.dart';
import 'package:estore_admin_panel/view/widgets/pie_charts.dart';
import 'package:flutter/material.dart';

class TabletDashboard extends StatelessWidget {
  const TabletDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(5)
            ),
            //color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(child: AnalyticInfoCard(info:analyticData[0])),
                            const SizedBox(width:10),
                            Expanded(child: AnalyticInfoCard(info:analyticData[1])),
                          ]
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(child: AnalyticInfoCard(info:analyticData[2])),
                            const SizedBox(width:10),
                            Expanded(child: AnalyticInfoCard(info:analyticData[3])),
                          ]
                        ),
                      ),
                    ),
                    const SizedBox(height:10.0),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const BigText(
                                text: "Revenue Chart",
                                size: 20,
                                color: Color(0xFFA4A6B3),
                              ),
                              SizedBox(
                                width: 500,
                                height: 350,
                                child: SimpleBarChart.withSampleData()
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const BigText(
                                  text: "Pie Chart",
                                  size: 20,
                                  color: Color(0xFFA4A6B3),
                                ),
                                SizedBox(
                                  height: 350,
                                  child: SimplePieChart.withSampleData()
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height:10.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  BigText(
                                    text: "Top Orders",
                                    size: 20,
                                    color: Color(0xFFA4A6B3),
                                  ),
                                  SizedBox(
                                    height: 540
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width:10.0),
                          const Expanded(
                            child: TopUsers()
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height:10.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}