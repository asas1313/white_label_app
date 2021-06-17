import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../widgets/about_slides/slide1.dart';
import '../../widgets/about_slides/slide2.dart';
import '../../widgets/about_slides/slide3.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutSlider extends StatefulWidget {
  @override
  _AboutSliderState createState() => _AboutSliderState();
}

class _AboutSliderState extends State<AboutSlider> {
  final slides = [
    Slide1(),
    Slide2(),
    Slide3(),
  ];
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        margin:
            sizingInformation.isMobile ? EdgeInsets.all(0) : EdgeInsets.all(8),
        child: Container(
          child: Column(
            children: [
              CarouselSlider(
                items: slides,
                options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: slides.map((url) {
                  int index = slides.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
