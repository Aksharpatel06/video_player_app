import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/view/provider/bottom_navigation_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: width,
                child: Image.asset(
                  'asset/img/home/Rectangle 26.png',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    child: Column(
                      children: [
                        Text(
                          'TOP',
                          style: GoogleFonts.notoSans(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '10',
                          style: GoogleFonts.notoSans(
                            height: 0.9
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '  #2 in Nigeria Today',
                    style: GoogleFonts.notoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: heigth * 0.05,
                    child: Image.asset(
                      'asset/img/app logo/logo.png',
                      fit: BoxFit.cover,
                    )),
                Text(
                  'TV Shows',
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Movies',
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'My List',
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) =>
            Provider.of<BottomNavigationProvider>(context, listen: false)
                .bottomChangeIndex(index),
        selectedItemColor: Colors.white,
        currentIndex:
            Provider.of<BottomNavigationProvider>(context).bottomIndex,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
