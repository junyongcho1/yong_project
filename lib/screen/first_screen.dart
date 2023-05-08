import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yong_project/widget/cardlist.dart';
export 'package:yong_project/widget/cardlist.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List imageList = [
    {'id': 1, 'image_path': 'assets/carousel/lesserafim.png'},
    {'id': 2, 'image_path': 'assets/carousel/ive.png'},
    {'id': 3, 'image_path': 'assets/carousel/visa.jpeg'},
  ];
  final CarouselController carouselController = CarouselController();
  int current_Index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(current_Index);
              },
              child: CarouselSlider(
                  items: imageList
                      .map((item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ))
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 1.7,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current_Index = index;
                        });
                      })),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  print(entry);
                  print(entry.key);
                  return GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(entry.key);
                    },
                    child: Container(
                      width: current_Index == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: current_Index == entry.key
                              ? Colors.white
                              : Colors.white70),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          //alignment: Alignment(0.0, 0.0),
          margin: EdgeInsets.only(left: 20, right: 20),
          //padding: EdgeInsets.only(left: 20, right: 20),
          //width: 150,

          //padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '어떤 운동을 찾고 계신가요?',
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: '어떤 운동을 찾고 계신가요?',
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: 20),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/carousel/baner2.webp'),
                fit: BoxFit.cover),
          ),
          child: InkWell(
            onTap: () {
              print('배너 클릭');
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // SizedBox(
        //     height: 300,
        //     child: DecoratedBox(
        //       decoration:
        //           BoxDecoration(color: Color.fromARGB(255, 245, 149, 181)),
        //       child: Column(children: [
        //         Text(
        //           '영상으로 구경하는 어플리케이션',
        //           textAlign: TextAlign.start,
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 25,
        //           ),
        //         ),
        //         Text(
        //           '원하는 어플리케이션을 클릭해보세요. 어플 소개영상이 있어요.',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 15,
        //           ),
        //         )
        //       ]),
        //     )),
        // SizedBox(
        //   height: 300,
        //   child: Column(children: [
        //     Text(
        //       '영상으로 구경하는 어플리케이션',
        //       textAlign: TextAlign.start,
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 25,
        //       ),
        //     ),
        //     Text(
        //       '원하는 어플리케이션을 클릭해보세요. 어플 소개영상이 있어요.',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 15,
        //       ),
        //     )
        //   ]),
        // ),
        ////////////////////////////////////////////////////////////
        // Container(
        //     padding: EdgeInsets.only(left: 15),
        //     height: 300,
        //     decoration: BoxDecoration(
        //       color: Color.fromARGB(255, 245, 149, 181),
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(
        //           height: 25,
        //         ),
        //         //margin: EdgeInsets.only(left: 20, top: 30),
        //         Text(
        //           '영상으로 구경하는 어플리케이션',
        //           textAlign: TextAlign.start,
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 25,
        //           ),
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Text(
        //           '원하는 어플리케이션을 클릭해보세요. 어플 소개영상이 있어요.',
        //           textAlign: TextAlign.start,
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 15,
        //           ),
        //         )
        //       ],
        //     )),
        ///////////////////////////////////////////////////
        // Container(
        //     padding: EdgeInsets.only(left: 15),
        //     height: 300,
        //     decoration: BoxDecoration(
        //       color: Color.fromARGB(255, 245, 149, 181),
        //     ),
        //     child: Stack(
        //       children: [
        //         Positioned(
        //             top: 25,
        //             left: 0,
        //             child: Text(
        //               '영상으로 구경하는 어플리케이션',
        //               textAlign: TextAlign.start,
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 25,
        //               ),
        //             )),
        //         Positioned(
        //             top: 55,
        //             left: 0,
        //             child: Text(
        //               '원하는 어플리케이션을 클릭해보세요. 어플 소개영상이 있어요.',
        //               textAlign: TextAlign.start,
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 15,
        //               ),
        //             )),
        //         Positioned(
        //             top: 100,
        //             left: 0,
        //             child: Container(
        //               height: 100,
        //               width: 50,
        //               decoration: BoxDecoration(
        //                 color: Color.fromARGB(255, 149, 167, 245),
        //               ),
        //             ))
        //       ],
        //     )),
        SizedBox(
            //padding: EdgeInsets.only(left: 15),
            height: 500,
            //decoration: BoxDecoration(color: Colors.black),
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 149, 181),
                  ),
                )),
                Positioned(
                    top: 25,
                    left: 10,
                    child: Text(
                      '영상으로 구경하는 어플리케이션',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )),
                Positioned(
                    top: 55,
                    left: 10,
                    child: Text(
                      '원하는 어플리케이션을 클릭해보세요. 어플 소개영상이 있어요.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),
                // Positioned(
                //   top: 100,
                //   left: 10,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       CardSlider(
                //         height: 280,
                //         width: 200,
                //         heightImage: 180,
                //         onTap: () {
                //           print('snfma');
                //         },
                //         imageProvider: AssetImage('assets/carousel/rei.png'),
                //         tags: [
                //           _tag('아이브', () {
                //             print('아이브');
                //           }),
                //           _tag('레이', () {
                //             print('콩순이');
                //           })
                //         ],
                //         title: Text(
                //           '보령점',
                //           style: TextStyle(
                //               fontSize: 20, fontWeight: FontWeight.bold),
                //         ), //_title(),
                //         description: Text(
                //           '어플 구경 쌉가능',
                //           style: TextStyle(
                //               fontSize: 15, fontWeight: FontWeight.bold),
                //         ), //_content(),
                //       ),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       CardSlider(
                //         height: 280,
                //         width: 200,
                //         heightImage: 180,
                //         onTap: () {
                //           print('snfma');
                //         },
                //         imageProvider:
                //             AssetImage('assets/carousel/chaewon.png'),
                //         tags: [
                //           _tag('르세라핌', () {
                //             print('르세라핌');
                //           }),
                //           _tag('채원', () {
                //             print('채원');
                //           })
                //         ],
                //         title: Text(
                //           '보령점',
                //           style: TextStyle(
                //               fontSize: 20, fontWeight: FontWeight.bold),
                //         ), //_title(),
                //         description: Text(
                //           '어플 구경 쌉가능',
                //           style: TextStyle(
                //               fontSize: 15, fontWeight: FontWeight.bold),
                //         ), //_content(),
                //       ),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       CardSlider(
                //         height: 260,
                //         width: 200,
                //         heightImage: 180,
                //         onTap: () {
                //           print('snfma');
                //         },
                //         imageProvider: AssetImage('assets/google.png'),
                //         // tags: [_tag('Category', () {}), _tag('Product', () {})],
                //         title: Text('보령점'), //_title(),
                //         description: Text('어플 구경 쌉가능'), //_content(),
                //       ),
                //     ],
                //   ),
                // ),
                ///////////////////////////////////////////////
                // Container(
                //   height: 280,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       CardSlider(
                //         height: 280,
                //         width: 200,
                //         heightImage: 180,
                //         onTap: () {
                //           print('snfma');
                //         },
                //         imageProvider: AssetImage('assets/carousel/rei.png'),
                //         tags: [
                //           _tag('아이브', () {
                //             print('아이브');
                //           }),
                //           _tag('레이', () {
                //             print('콩순이');
                //           })
                //         ],
                //         title: Text(
                //           '보령점',
                //           style: TextStyle(
                //               fontSize: 20, fontWeight: FontWeight.bold),
                //         ), //_title(),
                //         description: Text(
                //           '어플 구경 쌉가능',
                //           style: TextStyle(
                //               fontSize: 15, fontWeight: FontWeight.bold),
                //         ), //_content(),
                //       ),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       CardSlider(
                //         height: 280,
                //         width: 200,
                //         heightImage: 180,
                //         onTap: () {
                //           print('snfma');
                //         },
                //         imageProvider:
                //             AssetImage('assets/carousel/chaewon.png'),
                //         tags: [
                //           _tag('르세라핌', () {
                //             print('르세라핌');
                //           }),
                //           _tag('채원', () {
                //             print('채원');
                //           })
                //         ],
                //         title: Text(
                //           '보령점',
                //           style: TextStyle(
                //               fontSize: 20, fontWeight: FontWeight.bold),
                //         ), //_title(),
                //         description: Text(
                //           '어플 구경 쌉가능',
                //           style: TextStyle(
                //               fontSize: 15, fontWeight: FontWeight.bold),
                //         ), //_content(),
                //       ),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       CardSlider(
                //         height: 260,
                //         width: 200,
                //         heightImage: 180,
                //         onTap: () {
                //           print('snfma');
                //         },
                //         imageProvider: AssetImage('assets/google.png'),
                //         // tags: [_tag('Category', () {}), _tag('Product', () {})],
                //         title: Text('보령점'), //_title(),
                //         description: Text('어플 구경 쌉가능'), //_content(),
                //       ),
                //     ],
                //   ),
                // ),
                ///////////////////////////
                Positioned(
                  top: 100,
                  left: 10,
                  child: SingleChildScrollView(
                    //physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CardSlider(
                          height: 280,
                          width: 200,
                          heightImage: 180,
                          onTap: () {
                            print('snfma');
                          },
                          imageProvider: AssetImage('assets/carousel/rei.png'),
                          tags: [
                            _tag('아이브', () {
                              print('아이브');
                            }),
                            _tag('레이', () {
                              print('콩순이');
                            })
                          ],
                          title: Text(
                            '보령점',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ), //_title(),
                          description: Text(
                            '어플 구경 쌉가능',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ), //_content(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CardSlider(
                          height: 280,
                          width: 200,
                          heightImage: 180,
                          onTap: () {
                            print('snfma');
                          },
                          imageProvider:
                              AssetImage('assets/carousel/chaewon.png'),
                          tags: [
                            _tag('르세라핌', () {
                              print('르세라핌');
                            }),
                            _tag('채원', () {
                              print('채원');
                            })
                          ],
                          title: Text(
                            '보령점',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ), //_title(),
                          description: Text(
                            '어플 구경 쌉가능',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ), //_content(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CardSlider(
                          height: 260,
                          width: 200,
                          heightImage: 180,
                          onTap: () {
                            print('snfma');
                          },
                          imageProvider: AssetImage('assets/google.png'),
                          // tags: [_tag('Category', () {}), _tag('Product', () {})],
                          title: Text('보령점'), //_title(),
                          description: Text('어플 구경 쌉가능'), //_content(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    ));
  }

  Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.green),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          tag,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  //_tag(String s, Null Function() param1) {}
}
