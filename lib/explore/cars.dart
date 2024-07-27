import 'package:brokeapp/models/Car_model.dart';
import 'package:brokeapp/services/car_service.dart';
import 'package:brokeapp/ui_components/dialogs/add_item_dialog.dart';
import 'package:brokeapp/ui_components/dialogs/delete_item_dialog.dart';
import 'package:brokeapp/ui_components/dialogs/update_item_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class CarsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carItem = ref.watch(carListNotifierProvider);
    final TextEditingController name = TextEditingController();
    final TextEditingController rating = TextEditingController();
    final TextEditingController price = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// dummy button to add car
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddDialog(
                            name: name,
                            price: price,
                            rating: rating,
                            onTap: () {
                              ref.read(carListNotifierProvider.notifier).addCar(
                                    CarModel(
                                      id: DateTime.now().toString(),
                                      name: name.text,
                                      location: "xyz",
                                      price: double.tryParse(price.text),
                                      rating: double.tryParse(rating.text),
                                      image:
                                          "https://hips.hearstapps.com/hmg-prod/images/bmw-vision-neue-klasse-concept28-64e39f53b0cc3.jpg?crop=0.541xw:0.495xh;0.276xw,0.389xh&resize=980:*",
                                    ),
                                  );
                              Navigator.of(context).pop();
                            });
                      });
                },
                child: Text(
                  "Add Item",
                  style: const TextStyle(
                      color: AppColors.purple,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            /// shows all cars
            child: ListView.builder(
                itemCount: carItem.length,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 384,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              border: Border.all(
                                  width: 0.7, color: AppColors.lightGrey2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// shows car's image
                              Container(
                                  width: 384,
                                  height: 172,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          "https://hips.hearstapps.com/hmg-prod/images/bmw-vision-neue-klasse-concept28-64e39f53b0cc3.jpg?crop=0.541xw:0.495xh;0.276xw,0.389xh&resize=980:*"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 16, top: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            /// add dummy button to edit car data
                                            Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    shape: BoxShape.circle),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    name.text =
                                                        carItem[index].name ??
                                                            "";
                                                    price.text =
                                                        carItem[index].price.toString() ??
                                                            "";
                                                    rating.text=carItem[index].rating.toString()??"";
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return EditDialog(
                                                              name: name,
                                                              price: price,
                                                              rating: rating,
                                                              onTap: () {
                                                                ref
                                                                    .read(carListNotifierProvider
                                                                        .notifier)
                                                                    .editCar(
                                                                      CarModel(
                                                                        id: carItem[index]
                                                                            .id,
                                                                        name: name
                                                                            .text,
                                                                        location:
                                                                            "xyz",
                                                                        price: double.tryParse(
                                                                            price.text),
                                                                        rating:
                                                                            double.tryParse(rating.text),
                                                                        image:
                                                                            "https://hips.hearstapps.com/hmg-prod/images/bmw-vision-neue-klasse-concept28-64e39f53b0cc3.jpg?crop=0.541xw:0.495xh;0.276xw,0.389xh&resize=980:*",
                                                                      ),
                                                                    );
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                        });
                                                  },
                                                  child: Icon(Icons.edit,
                                                      color: AppColors.black,
                                                      size: 18),
                                                )),
                                            SizedBox(width: 8),

                                            /// add dummy button to delete car
                                            Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    shape: BoxShape.circle),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return DeleteItemDialog(
                                                              onTap: () {
                                                            ref
                                                                .read(carListNotifierProvider
                                                                    .notifier)
                                                                .deleteCar(
                                                                    carItem[index]
                                                                            .id ??
                                                                        "");
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        });
                                                  },
                                                  child: Icon(Icons.delete,
                                                      color: AppColors.black,
                                                      size: 18),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 15, left: 14),
                                child: Text(
                                  carItem[index].name ?? "",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [

                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/star_flat.png",
                                              height: 14,
                                              width: 14),
                                          Text(
                                            "${carItem[index].rating.toString() ?? 0} | 10 Trips",
                                            style: TextStyle(
                                                color: AppColors.darkGrey,
                                                fontSize: 8.7,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "\$${carItem[index].price.toString() ?? ""}/day",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(left: 12),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/svg/location_flat.svg",
                                          height: 14,
                                          width: 14),
                                      const Text(
                                        "11.6 mi from current location",
                                        style: TextStyle(
                                            color: AppColors.darkGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ]);
                }),
          ),
        ],
      ),
    );
  }
}
