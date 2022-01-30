//TODO refatorar o nome das variaveis

class UserModel {
  String? iDNUMBER;
  String? fIRSTNAME;
  String? lASTNAME;
  String? gENDERNAME;
  String? bIRTHDATE;
  String? fATHERFIRSTNAME;
  String? fATHERLASTNAME;
  String? mOTHERFIRSTNAME;
  String? mOTHERLASTNAME;
  String? mARITALSTATUSNAME;
  String? bIRTHPROVINCENAME;
  String? bIRTHMUNICIPALITYNAME;
  String? iSSUEDATE;
  String? eXPIRYDATE;
  String? iSSUEPLACE;
  String? rESIDENCECOUNTRYNAME;
  String? rESIDENCEPROVINCENAME;
  String? rESIDENCEMUNICIPALITYNAME;
  String? rESIDENCECOMMUNENAME;
  String? rESIDENCENEIGHBOR;
  String? rESIDENCEADDRESS;

  UserModel(
      {iDNUMBER,
      fIRSTNAME,
      lASTNAME,
      gENDERNAME,
      bIRTHDATE,
      fATHERFIRSTNAME,
      fATHERLASTNAME,
      mOTHERFIRSTNAME,
      mOTHERLASTNAME,
      mARITALSTATUSNAME,
      bIRTHPROVINCENAME,
      bIRTHMUNICIPALITYNAME,
      iSSUEDATE,
      eXPIRYDATE,
      iSSUEPLACE,
      rESIDENCECOUNTRYNAME,
      rESIDENCEPROVINCENAME,
      rESIDENCEMUNICIPALITYNAME,
      rESIDENCECOMMUNENAME,
      rESIDENCENEIGHBOR,
      rESIDENCEADDRESS});

  UserModel.fromJson(Map<String, dynamic> json) {
    iDNUMBER = json['ID_NUMBER'];
    fIRSTNAME = json['FIRST_NAME'];
    lASTNAME = json['LAST_NAME'];
    gENDERNAME = json['GENDER_NAME'];
    bIRTHDATE = json['BIRTH_DATE'];
    fATHERFIRSTNAME = json['FATHER_FIRST_NAME'];
    fATHERLASTNAME = json['FATHER_LAST_NAME'];
    mOTHERFIRSTNAME = json['MOTHER_FIRST_NAME'];
    mOTHERLASTNAME = json['MOTHER_LAST_NAME'];
    mARITALSTATUSNAME = json['MARITAL_STATUS_NAME'];
    bIRTHPROVINCENAME = json['BIRTH_PROVINCE_NAME'];
    bIRTHMUNICIPALITYNAME = json['BIRTH_MUNICIPALITY_NAME'];
    iSSUEDATE = json['ISSUE_DATE'];
    eXPIRYDATE = json['EXPIRY_DATE'];
    iSSUEPLACE = json['ISSUE_PLACE'];
    rESIDENCECOUNTRYNAME = json['RESIDENCE_COUNTRY_NAME'];
    rESIDENCEPROVINCENAME = json['RESIDENCE_PROVINCE_NAME'];
    rESIDENCEMUNICIPALITYNAME = json['RESIDENCE_MUNICIPALITY_NAME'];
    rESIDENCECOMMUNENAME = json['RESIDENCE_COMMUNE_NAME'];
    rESIDENCENEIGHBOR = json['RESIDENCE_NEIGHBOR'];
    rESIDENCEADDRESS = json['RESIDENCE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID_NUMBER'] = iDNUMBER;
    data['FIRST_NAME'] = fIRSTNAME;
    data['LAST_NAME'] = lASTNAME;
    data['GENDER_NAME'] = gENDERNAME;
    data['BIRTH_DATE'] = bIRTHDATE;
    data['FATHER_FIRST_NAME'] = fATHERFIRSTNAME;
    data['FATHER_LAST_NAME'] = fATHERLASTNAME;
    data['MOTHER_FIRST_NAME'] = mOTHERFIRSTNAME;
    data['MOTHER_LAST_NAME'] = mOTHERLASTNAME;
    data['MARITAL_STATUS_NAME'] = mARITALSTATUSNAME;
    data['BIRTH_PROVINCE_NAME'] = bIRTHPROVINCENAME;
    data['BIRTH_MUNICIPALITY_NAME'] = bIRTHMUNICIPALITYNAME;
    data['ISSUE_DATE'] = iSSUEDATE;
    data['EXPIRY_DATE'] = eXPIRYDATE;
    data['ISSUE_PLACE'] = iSSUEPLACE;
    data['RESIDENCE_COUNTRY_NAME'] = rESIDENCECOUNTRYNAME;
    data['RESIDENCE_PROVINCE_NAME'] = rESIDENCEPROVINCENAME;
    data['RESIDENCE_MUNICIPALITY_NAME'] = rESIDENCEMUNICIPALITYNAME;
    data['RESIDENCE_COMMUNE_NAME'] = rESIDENCECOMMUNENAME;
    data['RESIDENCE_NEIGHBOR'] = rESIDENCENEIGHBOR;
    data['RESIDENCE_ADDRESS'] = rESIDENCEADDRESS;
    return data;
  }
}
