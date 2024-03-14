import 'package:flutter/material.dart';
import 'package:transviti_assessment_test/controller/home/get_api.dart';
import 'package:transviti_assessment_test/model/institutes_model.dart';

class GetApiRepository with ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  /// institutes Api Repository
  InstitutesApi institutesApi = InstitutesApi();
  Future<List<InstitutesModel>> institutesFetchApi() async {
    return await institutesApi.getInstitutesApi();
  }
}
