class Const {
  static List popularPostCategoryList = ["전체", "일상", "교통", "치안", "기타"];
  static List actionTipsList = ["실내", "실외", "기타"];
  static List disasterTypeList = ["전체", "지진", "수해", "전쟁"];

  // 심폐소생술, 응급처치, 소화기, 하임리히
  static List<List<List<String>>> emergencyResponseList = [
    [
      ["Step 01", "assets/icons/image_emergency_response_01_01.png", "반응의 확인", "양쪽 어깨를 두드리며, 환자의 의식과 반응 확인"],
      ["Step 02", "assets/icons/image_emergency_response_01_02.png", "119 신고 및 도움 요청", "구체적으로 사람을 지목해 119 신고 및 주변 자동심장충격기(AED) 요청"],
      ["Step 03", "assets/icons/image_emergency_response_01_03.png", "호훕 확인", "환자의 얼굴과 가슴을 10초 내로 관찰해 호흡 확인 후 호흡이 없거나 비정상적이면 즉시 심폐소생술 준비"],
      ["Step 04", "assets/icons/image_emergency_response_01_04.png", "가슴압박 30회", "환자의 가슴 압박점을 찾아 깍지 낀 두 손의 손바닥 뒤꿈치로 압박 실시(분당 100~200회, 약 5cm 깊이)"],
      ["Step 05", "assets/icons/image_emergency_response_01_05.png", "인공호흡 2회", "환자의 가슴이 올라올 정도로 1초 동안 숨 불어넣기(가슴압박 : 인공호흡 = 30:2)"],
    ],
    [
      ["화상", "assets/icons/image_emergency_response_02_01.png", "", "화상부위를 차가운 흐르는 물에 10~15분 냉각 후물집은 터트리지 않고, 화상부위에 붙어 있는 물질은 떼어내지 않음"],
      ["열사병", "assets/icons/image_emergency_response_02_02.png", "", "환자를 시원한 장소로 옮겨 찬물, 물수건, 선풍기를 이용해 빨리 체온을 낮춤"],
      ["벌에게 쏘였을 때", "assets/icons/image_emergency_response_02_03.png", "", "쏘인 부위에 벌침이 남아있으면, 카드로 밀어서 제거 후 상처를 비누와 물로 씻고, 통증이 심한 경우 얼음 주머니로 냉찜질함"],
      ["뱀에게 물렸을 때", "assets/icons/image_emergency_response_02_04.png", "", "뱀에게 물린 부위를 심장보다 낮게 위치시킨 후 물린 부위를 비누와 물로 씻어냄 물린지 15분 이내인 경우, 물린 부위의 10cm 위에 (심장에 가까운 쪽) 폭 2cm 이상의 헝겊으로 느슨하게 묶음"],
      ["개에게 물렸을 때", "assets/icons/image_emergency_response_02_05.png", "", "출혈이 심하지 않으면 흐르는 물로 5~15분간 씻음 상처를 비비지 않고, 약간의 피가 흐르도록 하여 상처 내 세균이 밖으로 흘러 나오게 함"],
    ],
    [
      ["Step 01", "assets/icons/image_emergency_response_03_01.png", "", "손잡이 부분의 안전핀을 뽑음"],
      ["Step 02", "assets/icons/image_emergency_response_03_02.png", "", "바람을 등지고 서서 호스가 불을 향하게 함"],
      ["Step 03", "assets/icons/image_emergency_response_03_03.png", "", "손잡이를 힘껏 움켜쥠"],
      ["Step 04", "assets/icons/image_emergency_response_03_04.png", "", "분말을 빗자루로 쓸듯이 골고루 뿌림"],
    ],
    [
      ["Step 01", "assets/icons/image_emergency_response_04_01.png", "119 신고 및 손위치 파악", "119에 신고한 후, 주먹을 쥔 엄지 측이 안으로 향하게 명치 끝과 배꼽 사이에 손 위치"],
      ["Step 02", "assets/icons/image_emergency_response_04_02.png", "처치자 위치 확인", "환자의 양발 사이에 발 하나를 위치해 환자 뒤에서 감싸안기"],
      ["Step 03", "assets/icons/image_emergency_response_04_03.png", "등 두드리고 복부 밀어내기", "소리나는 기침이 아닌 경우, 5회 등을 두드리고 복부를 밀어냄"],
      ["Step 04", "assets/icons/image_emergency_response_04_04.png", "기침 격려 및 반복", "이물질이 나오도록 기침을 격려하고, 119가 도착할 때까지 반복"],
    ]
  ];


}