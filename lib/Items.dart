import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  MealItem(

      // this.id,
      this.title,
      // this.imageUrl,
      this.availability,
      this.price,
      this.location,
      this.category);
  // final String id;
  final String title;
  // final String imageUrl;
  final String availability;
  final String price;
  final String location;
  final String category;

  void select(BuildContext context) {
    // Navigator.of(context)
    //     .pushNamed(
    //   MealDetailScreen.routeName,
    //   arguments: id,
    // )
    //     .then((result) {
    //   if (result != null) {
    //     // removeItem(result);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    "https://image.freepik.com/free-vector/cardboard-boxes-packing-transportation-goods-delivery-service-concept-product-packaging-carton-boxes-with-confetti-style-illustration-white-background_189145-188.jpg",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.category,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(category),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(
                        width: 6,
                      ),
                      Text(price + " /week"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(location),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
