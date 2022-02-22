import '../model/id_model.dart';
import 'package:http/http.dart' as http;

class IdServices {
  Future<List<IdModel>> getIds() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      return idModeleFromJson(response.body);
    } else {
      throw Exception("Gelmedim abimmm");
    }
  }
}
