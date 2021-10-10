import 'package:card/card.dart';
import 'package:card/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final images = const <Color>[
    Color(0xffff0000),
    Color(0xff00ff00),
    Color(0xff0000ff),
    Color(0xffff00ff),
    Color(0xffffff00),
  ];

  final opacity = const [0.0, 0.2, 0.4, 0.6, 1.0, 0.0];
  final scale = const [0.6, 0.6, 0.8, 1.0, 1.0];

  final offset = const [
    Offset(0, 250),
    Offset(0, 200),
    Offset(0, 75),
    Offset(0, 50),
    Offset(0, 25),
  ];

  void onIndexChangeHandler(int index) {
    context.read<ColorProvider>().updateColor(images[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExampleVertical"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('BALANCE'),
                    Text('EXPIRES'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CARD HOLDER'),
                    Text('CVC'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Swiper(
              onIndexChanged: onIndexChangeHandler,
              layout: SwiperLayout.CUSTOM,
              scrollDirection: Axis.vertical,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: 240.0,
              curve: Curves.bounceOut,
              index: images.indexOf(context.read<ColorProvider>().color),
              customLayoutOption: CustomLayoutOption(
                startIndex: -3,
                stateCount: images.length,
              )
                  .addOpacity(opacity)
                  .addScale(scale, Alignment.center)
                  .addTranslate(offset),
              duration: 600,
              itemBuilder: (_, index) {
                return CreditCard(color: images[index]);
              },
              itemCount: images.length,
            ),
          ),
        ],
      ),
    );
  }
}
