import 'package:flutter/material.dart';
import 'package:wallpaperhubapp/data/data.dart';
import 'package:wallpaperhubapp/model/categories_model.dart';
import 'package:wallpaperhubapp/widgets/widget.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  @override
  void initState() {
    categories=getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      title: brandName(),
        elevation: 0.0,
      ),
      body: Container(child:Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30)
            ),
        padding:EdgeInsets.symmetric(horizontal: 24),
        margin:EdgeInsets.symmetric(horizontal: 24) ,
         child: Row(children: <Widget>[
            Expanded(

              child:TextField(

                  decoration: InputDecoration(
                    hintText:"search wallpaper",
                    border:InputBorder.none
                  ),
                ),
              ),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(height: 16,),
          ListView.builder(
              itemCount:categories.length,
               shrinkWrap: true,
               itemBuilder: (context, index){
                return CategoriesTile(
                    title: categories[index].categoriesName,
                  imgUrl: categories[index].imgUrl,
                );

               }
          )

          ],),
        
      ),
      );



  }
}

class CategoriesTile extends StatelessWidget {
   final String imgUrl, title;
   CategoriesTile({required this.title, required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Container(
          child: Image.network(imgUrl),
      ),
        Container(child: Text(title),),
        ],)
    );
  }
}

