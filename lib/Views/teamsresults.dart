// import 'package:alex_sporting_club/Models/teamsresults_model.dart';
// import 'package:flutter/material.dart';

// class TeamsResults extends StatelessWidget {
// final List<TeamsResultsModel> teams;
// const TeamsResults({super.key, required this.teams});

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
//                         'المطاعم',
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
//                         'المطاعم',
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











import 'package:alex_sporting/Models/teamsresults_model.dart';
import 'package:flutter/material.dart';

class TeamsResults extends StatelessWidget {
final List<TeamsResultsModel> teams;
const TeamsResults({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, size: 50),
                const SizedBox(width: 10),
                Text(
                  'اختر الفرق التي تريد متابعتها',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'من خلال دوائر الاهتمامات الموجودة بالاسفل',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10, // Replace with your list length
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.grey,
                    ),
                    child: Text(
                      'فريق ${index + 1}', // Replace with your data
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Row(
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 1 ? Colors.red : Colors.grey,
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


