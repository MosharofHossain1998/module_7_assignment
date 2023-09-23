import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.blue,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<String> product = [
    'Spicy Chicken',
    'Chicken Nugget',
    'Burger',
    'Chicken Roll',
    'Vegetable Roll',
    'Chips',
    'Milk Shake',
    'Butter Ban',
    'Dairy Milk',
    'Mango Juice',
    'Coca Cola',
    'Tomato',
    'Potato',
    'Salt',
    'Sugar',
    'Water',
    'Puffed Rice',
    'Orange',
    'Apple',
    'Banana',
  ];

  List<double> price = [
    50.00,
    80.00,
    30.00,
    70.00,
    60.00,
    48.00,
    220.00,
    250.00,
    300.00,
    120.00,
    50.00,
    80.00,
    30.00,
    70.00,
    60.00,
    48.00,
    220.00,
    250.00,
    30.00,
    50.00,
  ];

  Map<int , int> counters = {};
  int totalproduct =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: product.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if(counters.containsKey(index) == false){
            counters[index] = 0;
            //print(counters.keys);
            ///print(counters.values);
            ///print(counters[index]);
          }
          return Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product[index]),
                      SizedBox(height: 3,),
                      Text("\$${price[index]}", style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Counter : ${counters[index]}"),
                      ElevatedButton(
                        onPressed: () {
                          totalproduct++;
                          counters[index] = (counters[index]!+1);
                          setState(() {
                            if(counters[index] == 5){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text("You've bought 5  ${product[index]}"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          });
                        },
                        child: Text("Buy Now"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(TptalProductBought: totalproduct)));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  final int TptalProductBought;
  const Cart({super.key, required this.TptalProductBought});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),

      body: Center(child: Text("Total Products Bought : ${widget.TptalProductBought}",style: Theme.of(context).textTheme.bodyLarge,)),
    );
  }
}

