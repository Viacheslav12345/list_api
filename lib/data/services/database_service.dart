import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:list_api/data/models/country.dart';

class DatabaseService {
  var fAuth = FirebaseAuth.instance;

  final _countryCollection = FirebaseFirestore.instance.collection('countries');

  Future<void> addCountry(Country country) async {
    _countryCollection.doc(country.name).set(country.toMap());
  }

  Future<void> updateCountry(Country country) async {
    _countryCollection.doc(country.name).update(country.toMap());
  }

  void daleteCountry(String countryName) async {
    _countryCollection.doc(countryName).delete();
  }

  Future<List<Country>> getAllCountries() async {
    List<Country> listCountries = [];
    var snapshot = await _countryCollection.doc().get();
    if (snapshot.data() != null && snapshot.data()!.isNotEmpty) {
      for (var country in snapshot.data()!.values) {
        listCountries.add(Country.fromJson(country));
      }
    }
    return listCountries;
  }
}
