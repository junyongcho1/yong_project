import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:yong_project/widget/cardlist.dart';
export 'package:yong_project/widget/cardlist.dart';
import 'package:yong_project/widget/onlyimagecard.dart';

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
                image: AssetImage('assets/carousel/baner4.png'),
                fit: BoxFit.cover),
          ),
          child: InkWell(
            onTap: () {
              print('배너 클릭');
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/carousel/baner3.jpeg'),
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
        SizedBox(
            height: 400,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 149, 181),
                  ),
                )),
                Positioned(
                    top: 35,
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
                    top: 70,
                    left: 10,
                    child: Text(
                      '원하는 어플리케이션을 클릭해보세요. 어플 소개영상이 있어요.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),

                //////////////////////////positioned///////////
                Positioned(
                  top: 80,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: SingleChildScrollView(
                    //physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CardSlider(
                          height: 260,
                          width: 150,
                          heightImage: 170,
                          onTap: () {
                            print('레이');
                          },
                          imageProvider: AssetImage('assets/carousel/rei.png'),
                          tags: [
                            // _tag('아이브', () {
                            //   print('아이브');
                            // }),
                            _tag('레이', () {
                              print('콩순이');
                            })
                          ],
                          title: Text(
                            'IVE',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ), //_title(),
                          description: Text(
                            '어플 구경 쌉가능',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ), //_content(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CardSlider(
                          height: 260,
                          width: 150,
                          heightImage: 170,
                          onTap: () {
                            print('채원');
                          },
                          imageProvider:
                              AssetImage('assets/carousel/chaewon.png'),
                          tags: [
                            // _tag('르세라핌', () {
                            //   print('르세라핌');
                            // }),
                            _tag('채원', () {
                              print('채원');
                            })
                          ],
                          title: Text(
                            'LE SSERAFIM',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ), //_title(),
                          description: Text(
                            '어플 구경 쌉가능',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ), //_content(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CardSlider(
                          height: 260,
                          width: 150,
                          heightImage: 170,
                          onTap: () {
                            print('이나경');
                          },
                          imageProvider:
                              AssetImage('assets/carousel/nageong.jpeg'),
                          tags: [
                            //_tag('Category', () {}),
                            _tag('이나경', () {})
                          ],
                          title: Text(
                            'fromis_9',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ), //_title(),
                          description: Text(
                            '어플 구경 쌉가능',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ), //_content(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CardSlider(
                          height: 260,
                          width: 150,
                          heightImage: 170,
                          onTap: () {
                            print('카리나');
                          },
                          imageProvider:
                              AssetImage('assets/carousel/karina.png'),
                          tags: [
                            //_tag('Category', () {}),
                            _tag('카리나', () {})
                          ],
                          title: Text(
                            'aespa',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ), //_title(),
                          description: Text(
                            '어플 구경 쌉가능',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ), //_content(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('접속위치 주변 이용시설',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 95, 91, 91)),
              textAlign: TextAlign.start),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 200, //MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //decoration: BoxDecoration(color: Colors.blue),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  OnlyCardSlider(
                    height: 150,
                    width: 230,
                    heightImage: 150,
                    onTap: () {
                      print('카리나2');
                    },
                    imageProviders: AssetImage('assets/carousel/karina.png'),
                    title: Text(
                      '카리나',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 91, 91)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  OnlyCardSlider(
                    height: 150,
                    width: 230,
                    heightImage: 150,
                    onTap: () {
                      print('이나경2');
                    },
                    imageProviders: AssetImage('assets/carousel/nageong.jpeg'),
                    title: Text(
                      '이나경',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 91, 91)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  OnlyCardSlider(
                    height: 150,
                    width: 230,
                    heightImage: 150,
                    onTap: () {
                      print('채원2');
                    },
                    imageProviders: AssetImage('assets/carousel/chaewon.png'),
                    title: Text(
                      '채원',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 91, 91)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  OnlyCardSlider(
                    height: 150,
                    width: 230,
                    heightImage: 150,
                    onTap: () {
                      print('레이2');
                    },
                    imageProviders: AssetImage('assets/carousel/rei.png'),
                    title: Text(
                      '레이',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 91, 91)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('애니매이션 쇼핑 할까요?',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 95, 91, 91)),
              textAlign: TextAlign.start),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                OnlyCardSlider(
                  height: 150,
                  width: 200,
                  heightImage: 150,
                  onTap: () {
                    print('귀멸의 칼날:도공 마을편');
                  },
                  imageProviders: AssetImage('assets/cardimg/mictri.jpeg'),
                  title: Text(
                    '귀멸의칼날: 도공 마을편',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 91, 91)),
                  ),
                  description: Text('300,000원'),
                ),
                SizedBox(
                  width: 10,
                ),
                OnlyCardSlider(
                  height: 150,
                  width: 200,
                  heightImage: 150,
                  onTap: () {
                    print('나의 히어로 아카데미아');
                  },
                  imageProviders: AssetImage('assets/cardimg/hero.jpeg'),
                  title: Text(
                    '나의 히어로 아카데미아',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 91, 91)),
                  ),
                  description: Text('200,000원'),
                ),
              ]),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  OnlyCardSlider(
                    height: 150,
                    width: 200,
                    heightImage: 150,
                    onTap: () {
                      print('도쿄 리벤져스');
                    },
                    imageProviders: AssetImage('assets/cardimg/tokyo.jpeg'),
                    title: Text(
                      '도쿄 리벤져스',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 91, 91)),
                    ),
                    description: Text('300,000원'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OnlyCardSlider(
                    height: 150,
                    width: 200,
                    heightImage: 150,
                    onTap: () {
                      print('도쿄구울');
                    },
                    imageProviders: AssetImage('assets/cardimg/guoul.png'),
                    title: Text(
                      '도쿄구울',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 91, 91)),
                    ),
                    description: Text('200,000원'),
                  ),
                ],
              )
            ],
          ),
        )
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
