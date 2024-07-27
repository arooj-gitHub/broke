import 'package:brokeapp/explore/cars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../nav_bar/bottom_nav_bar.dart';
import '../ui_components/textfields/custom_search_field.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class ExploreScreenMain extends StatefulWidget {
  const ExploreScreenMain({super.key});

  @override
  State<ExploreScreenMain> createState() => _ExploreScreenMainState();
}

class _ExploreScreenMainState extends State<ExploreScreenMain> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: NavBarPage(currentIndex: 0,),
          backgroundColor: AppColors.white,
          body: Column(
            children: [
              SizedBox(height: 10),
              CustomSearchBar(
                controller: searchController,
                onSearch: (value) {},
              ),
              SizedBox(height: 10),
              TabBar(
                indicatorColor: AppColors.purple, // Color of the indicator line
                indicatorWeight: 1.0, // Thickness of the indicator line
                labelColor: AppColors.purple, // Color of selected text and icon
                unselectedLabelColor: AppColors.lightGrey,
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                tabs: [
                  Tab(
                      icon: SvgPicture.asset("assets/svg/boat_flat.svg"),
                      text: AppStrings.boats),
                  Tab(
                      icon: SvgPicture.asset("assets/svg/car_flat.svg"),
                      text: AppStrings.cars),
                  Tab(
                      icon: SvgPicture.asset("assets/svg/house_flat.svg"),
                      text: AppStrings.stays),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("Boats")),
                    Center(child: CarsScreen()),
                    Center(child: Text("Profile Tab")),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }


}
