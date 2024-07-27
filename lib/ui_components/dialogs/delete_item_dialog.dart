import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DeleteItemDialog extends StatefulWidget {
  const DeleteItemDialog({super.key,required this.onTap});
  final Function() onTap;

  @override
  State<DeleteItemDialog> createState() => _DeleteItemDialogState();
}

class _DeleteItemDialogState extends State<DeleteItemDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Custom width
        height: MediaQuery.of(context).size.height * 0.2,
        padding: EdgeInsets.only(left: 12, right: 12),
        margin:  EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:30),
           const Text("Are you sure you want to delete item?"),
            SizedBox(height:15),
            Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, child:Text("Cancel") ),
              SizedBox(width:8),
              ElevatedButton(
                  onPressed: widget.onTap, child:Text("Confirm") ),
            ],)
          ],
        ),
      ),
    );
  }
}
