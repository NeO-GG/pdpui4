import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Cars", style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_none, color: Colors.red,),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart, color: Colors.red,),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // #categories
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    singleTab(true, "All"),
                    singleTab(false, "Red"),
                    singleTab(false, "Blue"),
                    singleTab(false, "Green"),
                    singleTab(false, "Yellow"),
                  ],
                ),
              ),

              const SizedBox(height: 20,),

              // #makeItem
              makeItem("assets/images/im_car1.jpg"),
              makeItem("assets/images/im_car5.jpg"),
              makeItem("assets/images/im_car3.jpg"),
              makeItem("assets/images/im_car4.png"),
              makeItem("assets/images/im_car2.jpg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTab(bool type, String text){
    return AspectRatio(
        aspectRatio: 2.2/1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: type? Colors.red: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: type? Colors.white: Colors.black,fontSize: type? 20:17),),
        ),
      ),
    );
  }

  Widget makeItem(String image){
    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0,10),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("PDP Car",style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10, width: 10,),
                      Text("100\$",style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                    ],
                 ),
                const SizedBox(width: 10),
                Row(
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                    child: Text("Electric", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                        )

                  ],
                ),
              ],
            ),
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Center(
                child: Icon(Icons.favorite_border, size: 20,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
