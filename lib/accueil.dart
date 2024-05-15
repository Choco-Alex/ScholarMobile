import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scholar/account.dart';
import 'package:scholar/drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Accueil extends StatefulWidget {
  const Accueil({
    super.key,
  });
  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final images = [
    "assets/images/girl (1).png",
    "assets/images/girl (2).png",
    "assets/images/eleve.png",
    "assets/images/clip2.png",
    "assets/images/log.png",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Account())),
              child: Icon(Icons.account_circle)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo,
                Colors.black,
              ],
            ),
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 300,
                        // autoPlay: true,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,

                        autoPlayInterval: Duration(seconds: 2),
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final image = images[index];
                        return buildImage(image, index);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildIndicator(),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.yellow,
                      Colors.green,
                      Colors.red,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "\"S",
                          style: TextStyle(
                            color: Color.fromARGB(255, 85, 233, 90),
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "cholar,",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "est une application qui a été créée pour faciliter le paiement des frais de scolarité. Vous écomiserez ainsi en temps et en argent toute fois en évitant les risques de perte, de vol ou d'agression en cours de route ou de confier l'argent à l'enfant et de s'exposer aux risques cités ci-dessus.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Accès depuis n'importe quel appareil et facile à utiliser.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) => Container(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        count: images.length,
        activeIndex: activeIndex,
        effect: SlideEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.white,
          dotColor: Colors.black,
        ),
      );
}
