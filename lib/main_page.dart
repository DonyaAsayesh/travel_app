import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/travel_model.dart';
import 'package:expandable_text/expandable_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  double imageSize = 65;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: size.height / 1.8,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height / 2.2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                      image: DecorationImage(
                        image: AssetImage(travelList[_selectedIndex].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //head icons
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(190, 255, 255, 255)),
                            child: const Icon(CupertinoIcons.chevron_left),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(190, 255, 255, 255)),
                            child: const Icon(CupertinoIcons.heart),
                          )
                        ],
                      ),
                    ),
                  ),
                  //
                  Positioned(
                    left: 120,
                    top: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: SizedBox(
                        width: 350,
                        height: double.maxFinite,
                        child: ListView.builder(
                          itemCount: travelList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  travelList[index].image),
                                              fit: BoxFit.cover)),
                                      width: _selectedIndex == index
                                          ? imageSize + 15
                                          : imageSize,
                                      height: _selectedIndex == index
                                          ? imageSize + 15
                                          : imageSize,
                                      duration:
                                          const Duration(milliseconds: 200),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: size.width / 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          travelList[_selectedIndex].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.placemark_fill,
                              color: Colors.black,
                            ),
                            Text(
                              travelList[_selectedIndex].location,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    color: Color.fromARGB(60, 0, 0, 0),
                                    width: 1.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        "Distaste",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 1, 225, 255),
                                            fontFamily: 'Ubuntu',
                                            fontSize: 18),
                                      ),
                                      Text(
                                          travelList[_selectedIndex].distance +
                                              " Km",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    color: Color.fromARGB(60, 0, 0, 0),
                                    width: 1.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        "Temp",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 1, 225, 255),
                                            fontFamily: 'Ubuntu',
                                            fontSize: 18),
                                      ),
                                      Text(
                                          travelList[_selectedIndex].temp +
                                              "° C",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    color: Color.fromARGB(60, 0, 0, 0),
                                    width: 1.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        "Rating",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 1, 225, 255),
                                            fontFamily: 'Ubuntu',
                                            fontSize: 18),
                                      ),
                                      Text(travelList[_selectedIndex].rating,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                        child: Text("Description",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                                fontSize: 21)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: ExpandableText(
                          travelList[_selectedIndex].description,
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                          expandText: "ReadMore",
                          collapseText: "ReadLess",
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Let's Go here",style: TextStyle(color: Colors.white,fontFamily: 'Ubuntu',fontSize: 25,fontWeight: FontWeight.bold),),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50),),
                    child: Icon(
                      CupertinoIcons.chevron_forward,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
              color: Colors.black,
              width: double.infinity,
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
