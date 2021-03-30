import 'package:http/http.dart' as http;

abstract class Bloc {
  fetchBooks() async {
    var bookUrl = "https://jsonkeeper.com/b/3CSV";
    var bookResponse = await http.get(bookUrl);
    return bookResponse;
  }
}
