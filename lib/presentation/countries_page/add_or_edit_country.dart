import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_api/data/models/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/presentation/countries_page/country_cubit/cubit/countries_cubit.dart';

class AddOrEditCountry extends StatefulWidget {
  const AddOrEditCountry({Key? key}) : super(key: key);

  @override
  State<AddOrEditCountry> createState() => _AddOrEditCountryState();
}

class _AddOrEditCountryState extends State<AddOrEditCountry> {
  final _countryNameController = TextEditingController();
  final _cityNameController = TextEditingController();

  bool autoValidate = false;

  @override
  void dispose() {
    _countryNameController.dispose();
    _cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> citiesList = [];
    return
        // Scaffold(
        //     resizeToAvoidBottomInset: true,
        //     appBar: AppBar(
        //       toolbarHeight: 33,
        //       centerTitle: true,
        //       scrolledUnderElevation: 0,
        //       title: const Text('Додати адресу доставки'),
        //     ),
        //     body:
        Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: SingleChildScrollView(
        reverse: false,
        child: Form(
          autovalidateMode: autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              TextFormField(
                controller: _countryNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Назва країни не повинна бути пустою";
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'\D+'))
                ],
                decoration: const InputDecoration(
                  hintText: "Назва країни*",
                ),
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              TextFormField(
                  controller: _cityNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Назва міста не повинна бути пустою";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'\D+'))
                  ],
                  decoration: const InputDecoration(hintText: "Назва міста*"),
                  onEditingComplete: () {
                    citiesList.add(_cityNameController.text);
                    _cityNameController.clear();
                  }

                  // FocusScope.of(context).nextFocus(),
                  ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    autoValidate = true;
                  });
                  var country = Country(
                    name: _countryNameController.text,
                    cities: citiesList,
                    image: 'assets/images/liberty100.png',
                  );
                  final countryBloc = BlocProvider.of<CountriesCubit>(context);
                  countryBloc
                      .onAddCountry(country)
                      .then((value) => Navigator.of(context).pop);
                },
                child: const Text('Зберегти'),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).viewInsets.bottom,
              // ),
            ],
          ),
        ),
      ),
      // )
    );
  }
}
