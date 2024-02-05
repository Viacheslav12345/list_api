import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_api/data/models/country.dart';
import 'package:list_api/presentation/countries_page/country_cubit/cubit/countries_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:path/path.dart' as path;

class AddPhotoCountry extends StatefulWidget {
  final Country country;
  const AddPhotoCountry({Key? key, required this.country}) : super(key: key);

  @override
  State<AddPhotoCountry> createState() => _AddPhotoCountryState();
}

class _AddPhotoCountryState extends State<AddPhotoCountry> {
  UploadTask? uploadTask;
  String photoCountry = '';
  final fBStorage = FirebaseStorage.instance;

  void changePhotoCountry(String photoCountry) {
    final countryBloc = BlocProvider.of<CountriesCubit>(context);
    Country country = widget.country.copyWith(image: photoCountry);

    countryBloc
        .onEditCountry(country)
        .then((value) => countryBloc.onLoadAllCountries());
  }

  @override
  Widget build(BuildContext context) {
    photoCountry = widget.country.image;
    // return BlocBuilder<CountriesCubit, CountriesState>(
    //     builder: (context, state) {
    String defaultPicture = 'assets/images/countryDefault.png';
    return IconButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: () async {
          File? selectedImage;
          final XFile? image = await ImagePicker()
              .pickImage(source: ImageSource.gallery, maxWidth: 100);
          if (image != null) {
            selectedImage = File(image.path);

            var ref = fBStorage
                .ref()
                .child('photoCountry/${path.basename(selectedImage.path)}');
            uploadTask = ref.putFile(File(selectedImage.path));

            var snapshot = await uploadTask!.whenComplete(() => {
                  Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)!.photoDownloaded,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: const Color.fromARGB(255, 248, 104, 104),
                    textColor: Theme.of(context).cardColor,
                    fontSize: 18.0,
                  )
                });
            var urlDownload = await snapshot.ref.getDownloadURL();
            photoCountry = urlDownload;
            changePhotoCountry(photoCountry);
          }
        },
        icon: Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 3 - 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 5,
                  color: Theme.of(context).cardColor,
                  strokeAlign: BorderSide.strokeAlignOutside),
              image: DecorationImage(
                  image: (photoCountry.isNotEmpty)
                      ? Image.network(photoCountry).image
                      : AssetImage(defaultPicture),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)),
        ));
  }
}
