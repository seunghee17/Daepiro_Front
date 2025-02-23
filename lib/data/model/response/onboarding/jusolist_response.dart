class JusoListResponse {
  Results? results;

  JusoListResponse({this.results});

  JusoListResponse.fromJson(Map<String, dynamic> json) {
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
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
    json['common'] != null ? Common.fromJson(json['common']) : null;
    if (json['juso'] != null) {
      juso = <Juso>[];
      json['juso'].forEach((v) {
        juso!.add(Juso.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (common != null) {
      data['common'] = common!.toJson();
    }
    if (juso != null) {
      data['juso'] = juso!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = errorMessage;
    data['countPerPage'] = countPerPage;
    data['totalCount'] = totalCount;
    data['errorCode'] = errorCode;
    data['currentPage'] = currentPage;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detBdNmList'] = detBdNmList;
    data['engAddr'] = engAddr;
    data['rn'] = rn;
    data['emdNm'] = emdNm;
    data['zipNo'] = zipNo;
    data['roadAddrPart2'] = roadAddrPart2;
    data['emdNo'] = emdNo;
    data['sggNm'] = sggNm;
    data['jibunAddr'] = jibunAddr;
    data['siNm'] = siNm;
    data['roadAddrPart1'] = roadAddrPart1;
    data['bdNm'] = bdNm;
    data['admCd'] = admCd;
    data['udrtYn'] = udrtYn;
    data['lnbrMnnm'] = lnbrMnnm;
    data['roadAddr'] = roadAddr;
    data['lnbrSlno'] = lnbrSlno;
    data['buldMnnm'] = buldMnnm;
    data['bdKdcd'] = bdKdcd;
    data['liNm'] = liNm;
    data['rnMgtSn'] = rnMgtSn;
    data['mtYn'] = mtYn;
    data['bdMgtSn'] = bdMgtSn;
    data['buldSlno'] = buldSlno;
    return data;
  }
}