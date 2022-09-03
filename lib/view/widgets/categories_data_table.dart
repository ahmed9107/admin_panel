import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesDatatable extends StatelessWidget {
  const CategoriesDatatable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<CategoryController>(
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
                  label: Text('Category Name'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: List<DataRow>.generate(
                controller.categoryList.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(controller.categoryList[index].id!)),
                    DataCell(
                      Text(controller.categoryList[index].name!)),
                    DataCell(
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            //image: AssetImage('assets/images/photo1.jpg')
                            image: NetworkImage('${AppConstants.BASE_URL}/uploads/${controller.categoryList[index].image!}')
                          )
                        ),
                      )),
                    DataCell(
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                title: 'Warning!',
                                titleStyle: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0
                                ),
                                middleText: "Are sure you want to delete this customer?",
                                middleTextStyle: GoogleFonts.roboto(
                                  fontSize: 16.0
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
                                      controller.deleteCategory(controller.categoryList[index]);
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
                              controller.manageCategoryToggleScreen(1, categoryData: controller.categoryList[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3161FC),
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