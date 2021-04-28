import 'package:http/http.dart' as http;
import 'package:shopping_api/models/product.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return productFromJson(data);
    } else {
      return null;
    }
  }
}
