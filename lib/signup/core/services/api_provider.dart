//TODO delete this package and log function
import 'dart:convert';
import 'dart:developer';
import 'package:todo_bloc/signup/core/services/ihttp_service.dart';
import 'package:todo_bloc/signup/presentation/screens/models/signup/user_model.dart';

class ApiProviderError implements Exception {
  final dynamic message;

  ApiProviderError([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "ApiProviderError: $message";
  }
}

enum ApiErrors { notFound, mustValue }

class ApiProvider {
  final _baseUrl = "https://api.gov.ao/consultarBI/v2/?bi=";
  final IHttpService httpService;
  ApiProvider({
    required this.httpService,
  });

  UserModel serializeJsonToUser(var data) {
    return UserModel(
      iDNUMBER: data[0]["ID_NUMBER"],
      fIRSTNAME: data[0]["FIRST_NAME"],
      lASTNAME: data[0]["LAST_NAME"],
      gENDERNAME: data["GENDER_NAME"],
      fATHERFIRSTNAME: data[0]["FATHER_FIRST_NAME"],
      fATHERLASTNAME: data[0]["FATHER_LAST_NAME"],
      mOTHERFIRSTNAME: data[0]["MOTHER_FIRST_NAME"],
      mOTHERLASTNAME: data[0]["MOTHER_LAST_NAME"],
      bIRTHMUNICIPALITYNAME: data[0]["BIRTH_MUNICIPALITY_NAME"],
      bIRTHPROVINCENAME: data[0]["BIRTH_PROVINCE_NAME"],
      bIRTHDATE: data[0]["BIRTH_DATE"],
      iSSUEPLACE: data[0]["ISSUE_PLACE"],
      iSSUEDATE: data[0]["ISSUE_DATE"],
      eXPIRYDATE: data[0]["EXPIRY_DATE"],
      rESIDENCEADDRESS: data[0]["RESIDENCE_ADDRESS"],
      rESIDENCECOMMUNENAME: data[0]["RESIDENCE_COMMUNE_NAME"],
      rESIDENCEMUNICIPALITYNAME: data[0]["RESIDENCE_MUNICIPALITY_NAME"],
      rESIDENCECOUNTRYNAME: data[0]["RESIDENCE_COUNTRY_NAME"],
      rESIDENCEPROVINCENAME: data[0]["RESIDENCE_PROVINCE_NAME"],
      rESIDENCENEIGHBOR: data[0]["RESIDENCE_NEIGHBOR"],
      mARITALSTATUSNAME: data[0]["MARITAL_STATUS_NAME"],
    );
  }

  Future<UserModel> fetchUserInfoByIdNumber(String idNumber) async {
    var response = await httpService.get('$_baseUrl$idNumber');
    var pardeJson = json.decode(response.body);

    if (response.statusCode == 200 &&
        pardeJson.toString().contains("ID_NUMBER")) {
      return UserModel.fromJson(pardeJson[0]);
    } else if (response.statusCode == 400) {
      throw ApiProviderError("Bad request");
    } else if (response.statusCode == 400) {
      throw ApiProviderError("Bad request");
    } else {
      throw ApiProviderError("Not found");
    }
  }
}
