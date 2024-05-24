import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavBar(
      {super.key,
        required this.currentPage,
        this.isHome = ""});
  final String currentPage;
  final String isHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(196, 196, 196, 0.289),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 100,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: isHome == "home"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Image(
                            image: AssetImage('src/images/icone-exeke-png.png'),
                            height: 100),
                        Text.rich(
                          TextSpan(text: currentPage),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: const Icon(
                            Icons.more_vert,
                            size: 40,
                            color: Color.fromRGBO(241, 92, 43, 1.0),
                          ),
                          onPressed: () {
                          },
                        )
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text.rich(
                            TextSpan(text: currentPage),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          const Image(
                              image:
                                  AssetImage('src/images/icone-exeke-png.png'),
                              height: 100),
                        ],),),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
