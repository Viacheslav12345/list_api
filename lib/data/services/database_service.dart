import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_api/data/models/country.dart';

class DatabaseService {
  final _countryCollection = FirebaseFirestore.instance.collection('countries');

  Future<void> addCountry(Country country) async {
    _countryCollection.doc(country.name).set(country.toMap());
  }

  Future<void> updateCountry(Country country) async {
    _countryCollection.doc(country.name).update(country.toMap());
  }

  Future<void> daleteCountry(String countryName) async {
    _countryCollection.doc(countryName).delete();
  }

  Future<List<Country>> getAllCountries() async {
    List<Country> listCountries = [];
    var snapshot = await _countryCollection.get();
    // if (snapshot.data() != null && snapshot.data()!.isNotEmpty) {
    for (var country in snapshot.docs) {
      listCountries.add(Country.fromMap(country.data()));
    }
    // }
    return listCountries;
  }
}
