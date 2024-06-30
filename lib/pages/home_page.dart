import 'package:delivery_app/core/consts.dart';
import 'package:delivery_app/core/flutter_icons.dart';
import 'package:delivery_app/models/food_model.dart';
import 'package:delivery_app/pages/detail_page.dart';
import 'package:delivery_app/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodlist = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .7);
  var paddingLeft = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: _buildRightSection(),
            ),
            Container(
              color: AppColors.greenColor,
              height: MediaQuery.of(context).size.height,
              width: 50,
              padding: EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        image: DecorationImage(
                            image:
                                ExactAssetImage('assets/images/profile.jpg'))),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(FlutterIcons.ellipsis_v),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: Transform.rotate(
                alignment: Alignment.topLeft,
                angle: -math.pi / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildMenu('Vegetables', 0),
                        _buildMenu('Chicken', 1),
                        _buildMenu('Beef', 2),
                        _buildMenu('Thai', 3),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      margin: EdgeInsets.only(left: paddingLeft),
                      width: 150,
                      height: 70,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper: AppClipper(),
                              child: Container(
                                width: 150,
                                height: 63,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: math.pi / 2,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 15,
                                ),
                              ),
                            ),
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
      ),
    );
  }

  Widget _buildMenu(String menu, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paddingLeft = index * 150;
        });
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            menu,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildRightSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Column(
        children: [
          _customAppBar(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 340,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: foodlist.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage(foodlist[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 21,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 55,
                                  bottom: 30,
                                  right: 0,
                                ),
                                padding: EdgeInsets.all(28),
                                decoration: BoxDecoration(
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: SizedBox()),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 16,
                                          unratedColor: Colors.black12,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 0.5),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(width: 10),
                                        Text('(120 Reviews)',
                                            style: TextStyle(
                                              fontSize: 11,
                                            )),
                                      ],
                                    ),
                                    Text(
                                      '${foodlist[index].name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Transform.rotate(
                                  angle: math.pi / 3,
                                  child: Image(
                                    width: 180,
                                    image: AssetImage(
                                        'assets/images/${foodlist[index].imgPath}'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    '\$${foodlist[index].price.toInt()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                _buildPopularList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: foodlist.length,
      padding: EdgeInsets.only(
        left: 40,
        bottom: 16,
        top: 20,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(
            bottom: 16,
          ),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )),
          child: Row(
            children: [
              Image(
                width: 100,
                image: AssetImage('assets/images/${foodlist[index].imgPath}'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${foodlist[index].name}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${foodlist[index].price.toInt()}',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '${foodlist[index].weight.toInt()}gm Weight',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

// class _buildBackGround extends StatelessWidget {
//   _buildBackGround({
//     required this.foodlist,
//   });

//   final List<FoodModel> foodlist;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         top: 55,
//         bottom: 30,
//         right: 16,
//       ),
//       padding: EdgeInsets.all(28),
//       decoration: BoxDecoration(
//         color: AppColors.greenColor,
//         borderRadius: BorderRadius.all(
//           Radius.circular(32),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(child: SizedBox()),
//           Row(
//             children: [
//               RatingBar.builder(
//                 initialRating: 3,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemSize: 16,
//                 unratedColor: Colors.black12,
//                 itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
//                 itemBuilder: (context, _) => Icon(
//                   Icons.star,
//                   color: Colors.black,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               SizedBox(width: 10),
//               Text('(120 Reviews)',
//                   style: TextStyle(
//                     fontSize: 11,
//                   )),
//             ],
//           ),
//           Text(
//             '${foodlist[index].name}',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

Widget _customAppBar() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        RichText(
          text: TextSpan(
            text: 'Hello \n',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Shailee Weedly',
                style: TextStyle(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.greenLightColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
                Icon(
                  FlutterIcons.sistrix,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          child: Center(
            child: Icon(
              FlutterIcons.local_mall,
              size: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
