import 'package:flutter/material.dart';
import 'package:list_app/theme/colors.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List books = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchBooks();
  }

  fetchBooks() async {
   var bookUrl = "https://jsonkeeper.com/b/3CSV";
   var bookResponse = http.get(Uri.parse(bookUrl));
   print(bookResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List App"),
      ),
      body : getBody(),
    );
  }

  Widget getBody(){
    return ListView.builder(itemBuilder: (context, index){
      return getBooksCard();
    });
  }

  Widget getBooksCard(){
    return Card(
      child : Padding(
        padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 125,
              height: 150,
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage("https://media.wired.com/photos/5b8999943667562d3024c321/master/w_2560%2Cc_limit/trash2-01.jpg")
                ),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("RD Sharma", style: TextStyle(fontSize: 25),),
                SizedBox(height: 10,),
                Text("Mathematics", style: TextStyle(fontSize: 16),),

              ],
            )
          ],
        ),
      ),
      ),
    );
  }
}
