import 'package:alex_sporting/view_model/get_activities_cubit/get_activities_cubit.dart';
import 'package:alex_sporting/view_model/get_activities_cubit/get_activities_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInterestsScreen extends StatelessWidget {
  const EditInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivitiesCubit()..getAllActivities(context),
      child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
        builder: (context, state) {
          var cubit = ActivitiesCubit.get(context);
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return Scaffold(
            body: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CurvedClipper(),
                    child: Container(
                      height: height * 0.4,
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(top: height * .05),
                      color: const Color.fromARGB(156, 217, 215, 215),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  cubit.allActivitiesModel != null
                      ? Container(
                          margin: EdgeInsets.only(top: height * .18),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: height * .85,
                          child: PageView.builder(
                            controller: cubit.pageController,
                            reverse: true,
                            itemCount: cubit.pages.length,
                            itemBuilder: (context, index) {
                              return cubit.pages[cubit.currentIndex];
                            },
                            onPageChanged: (val) => cubit.incrementIndex(val),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              width: width,
              height: height * .08,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, -1.5),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => cubit.incrementIndex(cubit.currentIndex+1),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 12, right: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(0, 3),
                            blurRadius: 2,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == cubit.currentIndex
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );
                    }).reversed.toList(),
                  ),
                ],
              ),
            ),
          );
        },
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
