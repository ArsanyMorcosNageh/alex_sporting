import 'package:alex_sporting/Models/events_model.dart';

import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  final List<EventsModel> events;
  final Function(EventsModel event) changeStatus;

  const Events({super.key, required this.events, required this.changeStatus});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
                    'فعاليات تهمك!',
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
                        'تابع فعاليات نادي سبورتنج من خلال دوائر الاهتمامات الموجودة بالاسفل',
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
          children: widget.events.map((e) {
            return GestureDetector(
              onTap: () {
                widget.changeStatus(e);
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                decoration: BoxDecoration(
                  color: e.selected ? Colors.green : Colors.grey.shade100,
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
                  child: Text(
                    e.title,
                    style: TextStyle(
                        color: e.selected ? Colors.white : Colors.grey),
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
