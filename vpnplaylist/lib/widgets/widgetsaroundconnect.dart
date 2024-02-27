import 'package:flutter/material.dart';


class RoundWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget IconFile;

  const RoundWidget({super.key, required this.title, required this.subtitle, required this.IconFile});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          IconFile,
          
          SizedBox(height: 4,),
          Text(title , style: TextStyle( fontSize: 18)),

           SizedBox(height: 4,),
          Text(subtitle , style: TextStyle( fontSize: 12)),
        ],
      ),
    );
  }
}