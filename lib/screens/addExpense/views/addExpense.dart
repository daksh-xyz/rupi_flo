// ignore_for_file: camel_case_types, file_names, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class addexpense extends StatefulWidget {
  const addexpense({super.key});

  @override
  State<addexpense> createState() => _addexpenseState();
}

class _addexpenseState extends State<addexpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Column(
                children: [
                  const Text(
                    "Add Expenses",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: expenseController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            FontAwesomeIcons.indianRupeeSign,
                            size: 16,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: categoryController,
                    textAlignVertical: TextAlignVertical.center,
                    readOnly: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Category',
                        suffixIcon: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  String iconSelected = '';
                                  Color categoryColor = Colors.white;
                                  bool isExpanded = false;
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return AlertDialog(
                                      scrollable: true,
                                      title: const Text('Create a category'),
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            TextFormField(
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: 'Name',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            TextFormField(
                                              onTap: () {
                                                setState(() {
                                                  isExpanded = !isExpanded;
                                                });
                                              },
                                              readOnly: true,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: 'Icon',
                                                  suffixIcon: const Icon(
                                                    CupertinoIcons.chevron_down,
                                                    size: 12,
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius: isExpanded
                                                          ? const BorderRadius
                                                              .vertical(
                                                              top: Radius
                                                                  .circular(12))
                                                          : BorderRadius
                                                              .circular(12),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                            isExpanded
                                                ? Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 200,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                bottom: Radius
                                                                    .circular(
                                                                        12))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: GridView.builder(
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      3,
                                                                  mainAxisSpacing:
                                                                      5,
                                                                  crossAxisSpacing:
                                                                      5),
                                                          itemCount:
                                                              myCategoriesIcons
                                                                  .length,
                                                          itemBuilder:
                                                              (context, int i) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  iconSelected =
                                                                      myCategoriesIcons[
                                                                          i];
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            3,
                                                                        color: iconSelected == myCategoriesIcons[i]
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .grey),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/${myCategoriesIcons[i]}.png'))),
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  )
                                                : Container(),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            TextFormField(
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              readOnly: true,
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx2) {
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ColorPicker(
                                                              pickerColor:
                                                                  categoryColor,
                                                              onColorChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  categoryColor =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: 50,
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      ctx2);
                                                                },
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12))),
                                                                child:
                                                                    const Text(
                                                                  "Save Color",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          22),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  filled: true,
                                                  fillColor: categoryColor,
                                                  hintText: 'Color',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            SizedBox(
                                                width: double.infinity,
                                                height: kToolbarHeight,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12))),
                                                  child: const Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                });
                          },
                          icon: const Icon(
                            FontAwesomeIcons.plus,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.list,
                          size: 16,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: dateController,
                    textAlignVertical: TextAlignVertical.center,
                    readOnly: true,
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 31)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)));

                      if (newDate != null) {
                        setState(() {
                          dateController.text =
                              DateFormat("dd/MM/yyyy").format(newDate);
                          selectedDate = newDate;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Date',
                        prefixIcon: const Icon(
                          FontAwesomeIcons.clock,
                          size: 16,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none)),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: kToolbarHeight,
                      child: TextButton(
                        onPressed: () {
                          // create category object and pop
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
