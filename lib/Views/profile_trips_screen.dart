import 'package:alex_sporting/Models/trips_model.dart';
import 'package:flutter/material.dart';

class Trips extends StatefulWidget {
  final List<TripsModel> trips;
  final Function(TripsModel trip) changeTripStatus;

  const Trips({super.key, required this.trips, required this.changeTripStatus});

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
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
                    'متفوتش الرحلات',
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
                        'اطلع معانا رحلات نادي سبورتنج من خلال دوائر الاهتمامات الموجودة بالاسفل',
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
          children: widget.trips.map((e) {
            return GestureDetector(
              onTap: () {
                widget.changeTripStatus(e);
                setState(() {});
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .38,
                height: MediaQuery.of(context).size.height * .38,
                padding: const EdgeInsets.all(18),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: e.selected ? Colors.green.shade400 : Colors.grey.shade100,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Wrap(
                  children: [
                    Text(
                      e.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: e.selected ? Colors.white : Colors.grey,
                          fontSize: 25,
                        ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
