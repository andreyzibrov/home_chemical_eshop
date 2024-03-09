import 'package:flutter/material.dart';
import 'product_list.dart';
import 'product_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ozon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageMain(),
    );
  }
}

class PageMain extends StatelessWidget {
  const PageMain({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Ozon"),
            Spacer(),
            Text("♥      "),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListScreen(cards: cards[index]),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
               color: Colors.cyan[100],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(cards[index].images.mainImage),
                  ),
                  Text(
                    cards[index].name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
