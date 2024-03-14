import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:transviti_assessment_test/model/institutes_model.dart';
import 'package:transviti_assessment_test/utils/const/app_api_constant.dart';

class InstitutesApi {
  Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  Future<List<InstitutesModel>> getInstitutesApi() async {
    try {
      http.Response response = await http.get(uri, headers: AppApiConstants.defaultHeaders);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('MyBooking------> $response');
        List list = jsonDecode(response.body);
        log('MyBookingList------> $list');
        final result = list.map((e) => InstitutesModel.fromMap(e)).toList();
        log('result $result');
        return result;
      } else {
        return throw Exception('error throw');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
