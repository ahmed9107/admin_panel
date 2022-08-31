import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDatatable extends StatelessWidget {
  const ProductsDatatable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<ProductController>(
      builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: DataTable(
              headingTextStyle: GoogleFonts.roboto(
                fontSize: (height/46.89),
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight),
              dataTextStyle: GoogleFonts.roboto(
                fontSize: (height/52.75),
                color: Theme.of(context).primaryColorLight),
              headingRowColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.2)),
              dataRowColor: MaterialStateProperty.all(Theme.of(context).backgroundColor.withOpacity(0.4)),
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('ID'),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Price'),
                ),
                DataColumn(
                  label: Text('Created At'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
                DataColumn(
                  label: Text('Count'),
                ),
                DataColumn(
                  label: Text('Discount'),
                ),
                DataColumn(
                  label: Text('Status'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: List<DataRow>.generate(
                controller.productList.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(controller.productList[index].id!)),
                    DataCell(
                      Text(controller.productList[index].name!)),
                    DataCell(
                      Text(controller.productList[index].price!)),
                    DataCell(
                      Text(controller.productList[index].addDate!)),
                    DataCell(
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/photo1.jpg')
                            //image: NetworkImage('${AppConstants.BASE_URL}/${controller.productList[index].image!}')
                          )
                        ),
                      )),
                    DataCell(
                      Text(controller.productList[index].count!)),
                    DataCell(
                      Text(int.parse(controller.productList[index].discount!) > 0 
                        ? '${controller.productList[index].discount!}%'
                        : '--')),
                    DataCell(
                      int.parse(controller.productList[index].active!) > 0
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ABB34),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text('ON', style: GoogleFonts.roboto(color: Colors.white)))
                        : Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB40000),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text('OFF', style: GoogleFonts.roboto(color: Colors.white)))
                    ),
                    DataCell(
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                title: 'Warning!',
                                titleStyle: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                                middleText: "Are sure you want to delete this customer?",
                                middleTextStyle: GoogleFonts.roboto(
                                  fontSize: 13.0
                                ),
                                radius: 10,
                                actions: [
                                  InkWell(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child: const Text('Cancel')),
                                  InkWell(
                                    onTap: (){
                                      controller.deleteProduct(controller.productList[index]);
                                      Get.back();
                                    },
                                    child: const Text('Yes')),
                                ]
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD33535),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: const Icon(EvaIcons.trashOutline, color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              controller.manageProductToggleScreen(1, product: controller.productList[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF006492),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: const Icon(EvaIcons.editOutline, color: Colors.white)),
                          ),
                        ]
                      )),
                  ],
                ),
              )
            ),
          ),
        );
      }
    );
  }
}