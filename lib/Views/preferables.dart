// import 'package:alex_sporting_club/Models/prefrables_model.dart';
// import 'package:flutter/material.dart';

// class Preferables extends StatelessWidget {
//   final List<PreferablesModel> preferables;

//   const Preferables({required this.preferables, Key? key}) : super(key: key);

//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               ClipPath(
//                 clipper: CurvedClipper(),
//                 child: Container(
//                   height: 320,
//                   color: Color.fromARGB(156, 217, 215, 215),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 right: 20,
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_forward,
//                       color: Color.fromARGB(255, 89, 86, 86)),
//                   onPressed: () {
//                     // تصرف عند الضغط على زر الرجوع
//                   },
//                 ),
//               ),
//               Positioned(
//                 top: 100,
//                 right: 20,
//                 left: 20,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                           'بتفضل إيه أكتر..',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 0, 174, 70),
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//                     Positioned(
//                 top: 160,
//                 right: 20,
//                 left: 20,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(

// 'اختر اختياراتك المفضلة من خلال دوائر الاهتمامات الموجودة بالاسفل',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CurvedClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 150);
//     path.quadraticBezierTo(
//       (size.width / 4) * 2,
//       size.height,
//       size.width,
//       size.height - 70,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'package:alex_sporting/Models/prefrables_model.dart';
import 'package:flutter/material.dart';

class Preferables extends StatelessWidget {
  final List<PreferablesModel> preferables;

  const Preferables({required this.preferables, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CurvedClipper(),
                child: Container(
                  height: 320,
                  color: const Color.fromARGB(156, 217, 215, 215),
                ),
              ),
              Positioned(
                top: 35,
                right: 15,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 89, 86, 86)),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom:75,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.star, size: 50),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '..بتفضل ايه اكتر',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 174, 70),
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: [
                                Text(
                                  'ببلالابلاب ثللمىللبببىللىر لرر         ودة بالاسفل',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: preferables.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(preferables[index].title,
                            style: const TextStyle(color: Colors.black)),
                        const Icon(Icons.arrow_back_ios, color: Colors.black),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
              onPressed: () {
                // Add your back button logic here
              },
            ),
            Row(
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? Colors.red : Colors.grey,
                  ),
                );
              }).reversed.toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
      (size.width / 4) * 2,
      size.height,
      size.width,
      size.height - 70,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
