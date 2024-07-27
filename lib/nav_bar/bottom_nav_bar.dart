import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class NavBarPage extends StatefulWidget {
  int currentIndex;
  NavBarPage({super.key, required this.currentIndex});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
       border:  Border(
         top: BorderSide(width: 0.7, color: AppColors.lightGrey2),
       ),

      ),
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.currentIndex,
        selectedItemColor:  AppColors.purple,
        unselectedItemColor: AppColors.lightGrey3,
        selectedLabelStyle: TextStyle(color: AppColors.purple, fontSize: 11,fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(color: AppColors.lightGrey3,  fontSize: 11,fontWeight: FontWeight.w500),
        onTap: (index) {
          switch (index) {
            case 0:
              {

              }
              break;

            case 1:
              {

              }
              break;
            case 2:
              {

              }
              break;
            case 3:
              {

              }
              break;
            case 4:
              {

              }
              break;
            default:
              {
                //statements;
              }
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SvgPicture.asset('assets/svg/buttom_search.svg',color: widget.currentIndex == 0?AppColors.purple:AppColors.lightGrey3),
              ],
            ),
            label: AppStrings.explore,
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SvgPicture.asset('assets/svg/Vector.svg',color: widget.currentIndex == 1?AppColors.purple:AppColors.lightGrey3),
              ],
            ),
            label:AppStrings.favorite ,
          ),
          //assets/search_icon.svg
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset('assets/svg/buttom_trips.svg',color: widget.currentIndex == 2?AppColors.purple:AppColors.lightGrey3),
              ],
            ),
            label: AppStrings.trips,
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SvgPicture.asset('assets/svg/buttom_inbox.svg',color: widget.currentIndex == 3?AppColors.purple:AppColors.lightGrey3),
              ],
            ),
            label: AppStrings.inbox,
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SizedBox(
                    child: SvgPicture.asset(
                      'assets/svg/buttom_profile.svg',
                        color: widget.currentIndex == 4?AppColors.purple:AppColors.lightGrey3
                    )),
              ],
            ),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}