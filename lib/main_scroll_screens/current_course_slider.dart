import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> imagesList = [
  'assets/images/main6gopika.jpg',
  'assets/images/mainsanush1.jpg',
  'assets/images/main10vishnu.jpg',
  'assets/images/main13archanaartist.jpg',
];
final List<String> titles = [
  'JSA',
  'JLA',
  'SCIPRO SKILLS',
  'SCIPRO LANGUAGE COURSES',
];
final List<String> subtitles = [
  'COURSE 1',
  'COURSE1',
  'Technology',
  'Speaking',
];
class CurrentCourseSlider extends StatefulWidget {
  @override
  _CurrentCourseSliderState createState() => _CurrentCourseSliderState();
}

class _CurrentCourseSliderState extends State<CurrentCourseSlider> {
  int _currentIndex = 0;
  int _sub =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFFB3E5FC),
      height:330,
      child:
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:10.0),
            child:Text("HOT PICKS",style: TextStyle(color: Colors.black,fontSize: 18,
                fontWeight: FontWeight.bold),),),
          SizedBox(height: 10.0,),
          Container(
            //  color: Colors.indigo,
            height: 330,
            child:Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  // enlargeCenterPage: true,
                  //scrollDirection: Axis.vertical,
                  onPageChanged: (index, reason,) {
                    setState(
                          () {
                        _currentIndex = index;
                        _sub = index;
                      },
                    );
                  },
                ),
                items: imagesList
                    .map(
                      (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: Column(
                          children:[
                            Image.asset(
                              item,
                              height: 200.0,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
              Column(children:[
                Text(
                  '${titles[_currentIndex]}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    //backgroundColor: Colors.black45,
                    color: Colors.black,
                  ),textAlign: TextAlign.center,
                ),
                Text('${subtitles[_sub]}', style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.black45,
                  color: Colors.black,
                ),)
              ],),],),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index = imagesList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color.fromRGBO(0, 0, 0, 0.8)
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
              );
            }).toList(),
          )
        ],
      ),
      //ListTile(),
    );


  }
}
