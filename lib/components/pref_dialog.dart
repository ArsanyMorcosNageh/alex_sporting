import 'package:flutter/material.dart';

import '../Models/subcategories_model.dart';

class PrefDialog extends StatefulWidget {
  final List<SubCategoriesModel> prefs;
  final Function(List<SubCategoriesModel> pref) selectAll;
  final Function(SubCategoriesModel subCategory) selectSingle;final Function(List<SubCategoriesModel> prefs, BuildContext ctx) submitChanges;

  const PrefDialog(
      {super.key,
      required this.prefs,
      required this.selectAll,
      required this.selectSingle,
      required this.submitChanges});

  @override
  State<PrefDialog> createState() => _PrefDialogState();
}

class _PrefDialogState extends State<PrefDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .75,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ),
                if (widget.prefs.isNotEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .55,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              widget.selectAll(widget.prefs);
                              setState(() {});
                            },
                            child: const Text(
                              'اختيار الكل',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                          ),
                          ...widget.prefs.map((e) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      widget.selectSingle(e);
                                      setState(() {});
                                    },
                                    child: Row(
                                      mainAxisAlignment: e.selected
                                          ? MainAxisAlignment.spaceBetween
                                          : MainAxisAlignment.end,
                                      children: [
                                        if (e.selected)
                                          const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            children: [
                                              Text(
                                                e.title,
                                                textAlign: TextAlign.end,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            GestureDetector(
              onTap: () => widget.submitChanges(widget.prefs, context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'تم',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
