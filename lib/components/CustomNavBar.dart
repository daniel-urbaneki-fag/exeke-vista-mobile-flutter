import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.currentPage, this.isHome = ""});
  final String currentPage;
  final String isHome;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(196, 196, 196, 0.289),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: isHome == "home"
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image: AssetImage('src/images/icone-exeke-png.png'),
                          height: 100),
                      Text.rich(
                        TextSpan(text: currentPage),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromRGBO(196, 196, 196, 0.289),
                            elevation: 0),
                        child: const Text.rich(
                          TextSpan(text: "Menu"),
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text.rich(
                          TextSpan(text: currentPage),
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        Image(
                            image: AssetImage('src/images/icone-exeke-png.png'),
                            height: 100),
                      ])),
      ),
    );
  }
}
