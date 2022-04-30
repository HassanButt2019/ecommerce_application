



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertask/categories/model/categories.dart';
import 'package:fluttertask/categories/view/category_detaillist.dart';
import 'package:fluttertask/constants/constant_colors.dart';
import 'package:fluttertask/shared-widgets/no_result_screen.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key,required this.categories}) : super(key: key);
  final List<Categories> categories;

  final Random r = Random();

  static Route route() => MaterialPageRoute(builder: (_) =>  CategoryList(categories:[],));
  final List<IconData> iconData = <IconData>[Icons.home,Icons.computer,Icons.mobile_friendly, Icons.school];

  Icon randomIcon2() => Icon(iconData[r.nextInt(iconData.length)]);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return categories.isEmpty?const NoResult() :Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios , color: Colors.black,size: 28,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: _boldText(width, "Category List",size:24.0),

      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context,index){
          return _categoryTile(index,context);
        },
      ),
    );
  }

  Card _categoryTile(int index,context) {
    return Card(
          margin: const EdgeInsets.only(left: 20 , right: 20,top: 10),
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryDetailList(categories: categories[index],)));

            },
            tileColor: Colors.white,
            leading: randomIcon2(),
            title: Text(
              categories[index].name??"",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(
              categories[index].createdAt??"",
              style: TextStyle(
                  color: ConstantColors.categoryHeadingColor, fontSize: 14),
            ),
          ),
        );
  }

  SizedBox _boldText(double width , name , {size}) {
    return SizedBox(
        width: width * 0.90,
        child:  Text(
          name,
          textAlign: TextAlign.start,
          style:  TextStyle(
              fontSize: size==null?16:size, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}
