class JusoListResponse {
  Results? results;

  JusoListResponse({this.results});

  JusoListResponse.fromJson(Map<String, dynamic> json) {
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  Common? common;
  List<Juso>? juso;

  Results({this.common, this.juso});

  Results.fromJson(Map<String, dynamic> json) {
    common =
    json['common'] != null ? new Common.fromJson(json['common']) : null;
    if (json['juso'] != null) {
      juso = <Juso>[];
      json['juso'].forEach((v) {
        juso!.add(new Juso.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.common != null) {
      data['common'] = this.common!.toJson();
    }
    if (this.juso != null) {
      data['juso'] = this.juso!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Common {
  String? errorMessage;
  String? countPerPage;
  String? totalCount;
  String? errorCode;
  String? currentPage;

  Common(
      {this.errorMessage,
        this.countPerPage,
        this.totalCount,
        this.errorCode,
        this.currentPage});

  Common.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'];
    countPerPage = json['countPerPage'];
    totalCount = json['totalCount'];
    errorCode = json['errorCode'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMessage'] = this.errorMessage;
    data['countPerPage'] = this.countPerPage;
    data['totalCount'] = this.totalCount;
    data['errorCode'] = this.errorCode;
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class Juso {
  String? detBdNmList;
  String? engAddr;
  String? rn;
  String? emdNm;
  String? zipNo;
  String? roadAddrPart2;
  String? emdNo;
  String? sggNm;
  String? jibunAddr;
  String? siNm;
  String? roadAddrPart1;
  String? bdNm;
  String? admCd;
  String? udrtYn;
  String? lnbrMnnm;
  String? roadAddr;
  String? lnbrSlno;
  String? buldMnnm;
  String? bdKdcd;
  String? liNm;
  String? rnMgtSn;
  String? mtYn;
  String? bdMgtSn;
  String? buldSlno;

  Juso(
      {this.detBdNmList,
        this.engAddr,
        this.rn,
        this.emdNm,
        this.zipNo,
        this.roadAddrPart2,
        this.emdNo,
        this.sggNm,
        this.jibunAddr,
        this.siNm,
        this.roadAddrPart1,
        this.bdNm,
        this.admCd,
        this.udrtYn,
        this.lnbrMnnm,
        this.roadAddr,
        this.lnbrSlno,
        this.buldMnnm,
        this.bdKdcd,
        this.liNm,
        this.rnMgtSn,
        this.mtYn,
        this.bdMgtSn,
        this.buldSlno});

  Juso.fromJson(Map<String, dynamic> json) {
    detBdNmList = json['detBdNmList'];
    engAddr = json['engAddr'];
    rn = json['rn'];
    emdNm = json['emdNm'];
    zipNo = json['zipNo'];
    roadAddrPart2 = json['roadAddrPart2'];
    emdNo = json['emdNo'];
    sggNm = json['sggNm'];
    jibunAddr = json['jibunAddr'];
    siNm = json['siNm'];
    roadAddrPart1 = json['roadAddrPart1'];
    bdNm = json['bdNm'];
    admCd = json['admCd'];
    udrtYn = json['udrtYn'];
    lnbrMnnm = json['lnbrMnnm'];
    roadAddr = json['roadAddr'];
    lnbrSlno = json['lnbrSlno'];
    buldMnnm = json['buldMnnm'];
    bdKdcd = json['bdKdcd'];
    liNm = json['liNm'];
    rnMgtSn = json['rnMgtSn'];
    mtYn = json['mtYn'];
    bdMgtSn = json['bdMgtSn'];
    buldSlno = json['buldSlno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detBdNmList'] = this.detBdNmList;
    data['engAddr'] = this.engAddr;
    data['rn'] = this.rn;
    data['emdNm'] = this.emdNm;
    data['zipNo'] = this.zipNo;
    data['roadAddrPart2'] = this.roadAddrPart2;
    data['emdNo'] = this.emdNo;
    data['sggNm'] = this.sggNm;
    data['jibunAddr'] = this.jibunAddr;
    data['siNm'] = this.siNm;
    data['roadAddrPart1'] = this.roadAddrPart1;
    data['bdNm'] = this.bdNm;
    data['admCd'] = this.admCd;
    data['udrtYn'] = this.udrtYn;
    data['lnbrMnnm'] = this.lnbrMnnm;
    data['roadAddr'] = this.roadAddr;
    data['lnbrSlno'] = this.lnbrSlno;
    data['buldMnnm'] = this.buldMnnm;
    data['bdKdcd'] = this.bdKdcd;
    data['liNm'] = this.liNm;
    data['rnMgtSn'] = this.rnMgtSn;
    data['mtYn'] = this.mtYn;
    data['bdMgtSn'] = this.bdMgtSn;
    data['buldSlno'] = this.buldSlno;
    return data;
  }
}