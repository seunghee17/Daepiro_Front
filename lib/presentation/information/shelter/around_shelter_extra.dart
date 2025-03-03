import '../../../data/model/response/information/around_shelter_list_response.dart';

class AroundShelterExtra {
  final double latitude;
  final double longitude;
  final String address;
  final List<Shelters> earthquakeShelterList;
  final List<Shelters> tsunamiShelterList;
  final List<Shelters> civilShelterList;

  AroundShelterExtra({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.earthquakeShelterList,
    required this.tsunamiShelterList,
    required this.civilShelterList,
  });
}
