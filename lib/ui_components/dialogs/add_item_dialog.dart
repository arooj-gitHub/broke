
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key,required this.name,required this.price,required this.rating,required this.onTap});
  final TextEditingController name;
  final TextEditingController price;
  final TextEditingController rating;
  final Function() onTap;


  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColors.white,
      child:Container(
        width: MediaQuery.of(context).size.width * 0.8, // Custom width
        height: MediaQuery.of(context).size.height * 0.4,
        padding:EdgeInsets.only(left:12,right:12),// Custom height
        child: Column(
          children: [
          TextField(
            controller: widget.name,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: widget.price,
            decoration: InputDecoration(hintText: 'Price'),
          ),
          TextField(
            controller: widget.rating,
            decoration: InputDecoration(hintText: 'Rating'),
          ),
          ElevatedButton(
              onPressed: widget.onTap, child:Text("Add") ),
        ],),
      ),
    );
  }
}
