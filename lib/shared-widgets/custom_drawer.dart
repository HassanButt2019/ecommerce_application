
part  of 'shared_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: SizedBox(
                    height: 100,
                      child: Image.asset(ConstantPath.getPath('avatar-1.png',),fit: BoxFit.cover)),
                ),
                const SizedBox(height: 10,),
                Center(child: _boldText(width , "Name Of Person")),
                const SizedBox(height: 10,),
                _subTitleText("hassanqa13@gmail.com")
              ],
            ),
          ),
          _itemTile(
              "Home" ,
              Icons.home_outlined ,
            onpressed: (){
                GeneralFunctions.navigateTo(context, HomeScreen.route());
            }
          ),
          _itemTile(
              "Categories" ,
              Icons.category_outlined ,
              onpressed: (){
                Navigator.push(context, CategoryList.route());
              }
          ),

          _itemTile(
              "My Orders" ,
              Icons.document_scanner_outlined,
              onpressed: (){
                GeneralFunctions.navigateTo(context, HomeScreen.route());
              }
          ),

          _itemTile(
              "Wish List" ,
              Icons.favorite_border_outlined,
              onpressed: (){
                GeneralFunctions.navigateTo(context, HomeScreen.route());
              }
          ),

          _itemTile(
              "Settings" ,
              Icons.settings_outlined,
              onpressed: (){
                GeneralFunctions.navigateTo(context, HomeScreen.route());
              }
          ),
          _itemTile(
              "Notifications" ,
              Icons.notification_important_outlined,
              onpressed: (){
                GeneralFunctions.navigateTo(context, HomeScreen.route());
              }
          ),
          _itemTile(
              "Help & FAQ" ,
              Icons.info_outline,
              onpressed: (){
                GeneralFunctions.navigateTo(context, HomeScreen.route());
              }
          ),

          _itemTile(
              "Logout" ,
              Icons.logout,
              onpressed: ()async{
                await storage.deleteAll();
                GeneralFunctions.navigateTo(context, FirstScreen.route());
              }
          ),


        ],
      ),
    );
  }

  ListTile _itemTile(title, icon ,{ onpressed}) {
    return ListTile(
          leading: Icon(icon , size:30 ,),
          title: _subTitleText(title),
          onTap:onpressed,
        );
  }

  SizedBox _boldText(double width , name) {
    return SizedBox(
        width: width * 0.90,
        child:  Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }

  Text _subTitleText(String heading,) => Text(
    heading,
    style: TextStyle(
        fontSize: 14,
        color: ConstantColors.categoryHeadingColor),
  );
}
