import 'package:alex_sporting/Models/prefrables_model.dart';
import 'package:alex_sporting/Models/subcategories_model.dart';
import 'package:flutter/material.dart';

class PreferablesScreen extends StatelessWidget {
  final List<PreferablesModel> preferables;
  final Function(List<SubCategoriesModel> subCategoriesModel, int index) onTap;

  const PreferablesScreen({required this.preferables, Key? key, required this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 120,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'بتفضل ايه اكتر...',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                        'اختر اخبارك المفضلة من خلال دوائر الاهتمامات الموجودة بالاسفل',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Wrap(
          alignment: WrapAlignment.end,
          children: preferables.map((e) {
            return GestureDetector(
              onTap: () => onTap(e.subcategories, preferables.indexOf(e)),
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      Text(
                        e.title,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
