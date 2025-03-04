import 'package:flutter/material.dart';
import 'package:food_order_app/controller/menu_item_controller.dart';
import 'package:food_order_app/controller/modifiers_controller.dart';
import 'package:food_order_app/models/modifier/modifier_group.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ModifierItemWidget extends StatefulWidget {
  List<String> modifierGroupIdList;

  ModifierItemWidget({required this.modifierGroupIdList});

  @override
  State<ModifierItemWidget> createState() => _ModifierItemWidgetState();
}

class _ModifierItemWidgetState extends State<ModifierItemWidget> {
  late double _deviceHeight, _deviceWidth;
  final modifierController = Get.put(ModifiersController());
  final menuItemController = Get.put(MenuItemController());

  late List<String> modifierGroupIdList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modifierGroupIdList = widget.modifierGroupIdList;
    print(modifierGroupIdList.length);
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: modifierGroupIdList.length,
      itemBuilder: (context, index) {
        return FutureBuilder(
          future: modifierController.loadModifiers(modifierGroupIdList[index]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.greenColor),
              );
            }

            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return Container();
            }

            List<Modifier>? modifiers = snapshot.data;

            return Column(
              children: List.generate(
                modifiers!.length,
                (modifierIndex) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: _deviceWidth * 0.01),
                    width: _deviceWidth,
                    decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _formatTitle(
                                        modifiers[modifierIndex].title),
                                    style: TextStyle(
                                        color: AppColors.greenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: _deviceHeight * 0.018),
                                  ),
                                  SizedBox(
                                    height: _deviceHeight * 0.005,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemCount: modifiers[modifierIndex]
                                        .modifierOptions
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        width: _deviceWidth,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                                flex: 6,
                                                child: Text(_formatItemIds(
                                                    modifiers[modifierIndex]
                                                        .modifierOptions[index]
                                                        .optionId),style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.blackColor,
                                                  fontSize: _deviceHeight * 0.017
                                                ),)),
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    backgroundColor:
                                                        AppColors.grayColor,
                                                    fixedSize:
                                                        const Size(40, 50),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size:
                                                        20, // Smaller icon size
                                                    color: AppColors.greenColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "0",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        _deviceHeight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    backgroundColor:
                                                        AppColors.grayColor,
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size:
                                                        20, // Smaller icon size
                                                    color: AppColors.greenColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  String _formatTitle(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  String _formatItemIds(String item) {
    String name = item.split('-').last;
    name = name.toLowerCase();
    name = name
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return name;
  }
}
