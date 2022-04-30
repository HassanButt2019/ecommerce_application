

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertask/categories/bloc/bloc.dart';
import 'package:fluttertask/categories/bloc/events/events.dart';
import 'package:fluttertask/categories/bloc/states/states.dart';
import 'package:fluttertask/categories/model/categories.dart';
import 'package:fluttertask/categories/repository/category_repository.dart';
import 'package:fluttertask/constants/constant_colors.dart';
import 'package:fluttertask/constants/constant_paths.dart';
import 'package:fluttertask/product/model/products.dart';
import 'package:fluttertask/shared-widgets/no_result_screen.dart';

class CategoryDetailList extends StatelessWidget {
  const CategoryDetailList({Key? key,this.categories}) : super(key: key);
  final Categories? categories;
  static Route route() => MaterialPageRoute(builder: (_) => const CategoryDetailList());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RepositoryProvider(
      create: (context)=>CategoryRepository(),
      child: BlocProvider(
        create: (context) =>
        CategoryBloc(RepositoryProvider.of<CategoryRepository>(context))..add(LoadProducts(id: categories?.id)),
        child: Scaffold(
          backgroundColor: ConstantColors.backgroundColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios , color: Colors.black,size: 28,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            title: _boldText(width, categories?.name??"",size:24.0),
            actions: const [
              Icon(Icons.search_outlined , color: Colors.black,size: 28,),
              SizedBox(width: 10,),
              Icon(Icons.shopping_cart_outlined , color: Colors.black,size: 28,),
               SizedBox(width: 15,),
            ],
          ),
          body: Column(
            children: [
              Container(
                height: height *0.07,
                width: width,
                color: Colors.white,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     SizedBox(
                        height: height *0.07,
                        width: width *0.80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.filter,size: 24,color: Colors.black,)  ,
                                  _subTitleText("Filters",)
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context,state){
                         return SizedBox(
                            height: 60,
                            width: width*0.10,
                            child: Center(
                              child: GestureDetector(
                                onTap: (){
                                  context.read<CategoryBloc>()..add(ChangeLayout(id:categories?.id ));
                                },
                                child: _boldText(width, "#",size: 26.0),
                              ),
                            ),
                          );
                        },

                      )
                    ],
                  ),
                ),
              ),

              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context,state) {
                  if (state is CategoryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is CategorySuccessGridView)
                    {
                      return state.products!.isEmpty? const NoResult() :SizedBox(
                        height: height * 0.80,
                        child:state.products!.isEmpty? const NoResult() : ListView.builder(
                          itemCount: state.products?.length,
                          itemBuilder: (context,index){
                            return list_tile_item(width, height,state.products![index]);
                          },
                        ),
                      );
                    }
                  if(state is CategorySuccess) {
                    return
                       SizedBox(
                      height: height * 0.80,
                      child: state.products!.isEmpty? const NoResult() :GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                          itemCount: state.products?.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return grid_viewItem(height, width, state, index);
                          }),

                    );
                  }

                  return Container();

                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding grid_viewItem(double height, double width, CategorySuccess state, int index) {
    return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Container(
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              ConstantPath.getPath("BG.png")),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    _boldText(width, state.products![index].name?? ""),
                                    const SizedBox(height: 10,),
                                    _subTitleText(
                                      (state.products?[index].price)?? "\$ 1,4500" , color: Colors.blue,),
                                    const SizedBox(height: 5,),
                                    _subTitleText(
                                        state.products?[index].price??  "\$ 1,4500 (-50%)",
                                        lineThrough: true),
                                    const SizedBox(height: 5,),
                                    ratingWidget(),
                                    const SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                            ),
                          );
  }

  Padding list_tile_item(double width, double height , Products products) {
    return Padding(
          padding: const EdgeInsets.only(top:0.0),
          child: Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              tileColor: Colors.white,
              leading: Container(
                width: width*0.2,
                height: height*0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ConstantPath.getPath("BG.png")),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Column(
                children: [
                  _boldText(width, products.name),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5,),
                  _subTitleText(products.price??"\$ 1,4500", color: Colors.blue),
                  const SizedBox(height: 5,),
                  _subTitleText(products.price??"\$ 1,4500 (-50%)",lineThrough: true),
                 const SizedBox(height: 5,),
                   ratingWidget(),
                  const SizedBox(height: 15,),

                ],
              ),

            ),
          ),

        );
  }

  RatingBar ratingWidget() {
    return RatingBar.builder(
            itemSize: 14,
            initialRating: 3,
            minRating: 1,
            unratedColor: Colors.white,
            direction: Axis.horizontal,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.blue,
              size: 12,
            ),
            onRatingUpdate: (rating) {
            },
          );
  }

  Text _subTitleText(String heading, {bool? lineThrough = false , color} ) => Text(
    heading,
    textAlign: TextAlign.start,
    style: TextStyle(
        decoration: lineThrough! ? TextDecoration.lineThrough : null,
        fontSize: 14,
        color: color==null?ConstantColors.categoryHeadingColor:color),
  );

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



