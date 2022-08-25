import 'package:estore_admin_panel/data/static.dart';
import 'package:estore_admin_panel/utils/constants/constants.dart';
import 'package:estore_admin_panel/view/widgets/user_info_detail.dart';
import 'package:flutter/material.dart';

class TopUsers extends StatelessWidget {
  const TopUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 540,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Customers',
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: appPadding,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: usersData.length,
            itemBuilder: (context, index) => UserInfoDetail(info: usersData[index],),
          )
        ],
      ),
    );
  }
}