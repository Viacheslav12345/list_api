// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:list_api/data/models/country.dart';
import 'package:list_api/presentation/countries_page/country_cubit/cubit/countries_cubit.dart';

class AddOrEditCountry extends StatefulWidget {
  final Country? country;
  const AddOrEditCountry({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  State<AddOrEditCountry> createState() => _AddOrEditCountryState();
}

class _AddOrEditCountryState extends State<AddOrEditCountry> {
  TextEditingController _countryNameController = TextEditingController();
  final _cityNameController = TextEditingController();

  bool autoValidate = false;
  List<String> citiesList = [];
  String nameCountry = '';

  @override
  void initState() {
    _countryNameController =
        TextEditingController(text: widget.country?.name ?? '');

    citiesList = (widget.country != null) ? widget.country!.cities : [];
    nameCountry = _countryNameController.text;

    super.initState();
  }

  @override
  void dispose() {
    _countryNameController.dispose();
    _cityNameController.dispose();
    super.dispose();
  }

  void addCity() {
    if (_cityNameController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Введіть назву міста.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: const Color.fromARGB(255, 248, 104, 104),
        textColor: Theme.of(context).cardColor,
        fontSize: 18.0,
      );
    } else if (_cityNameController.text.isNotEmpty &&
        !citiesList.contains(_cityNameController.text)) {
      citiesList.insert(0, _cityNameController.text);
      _cityNameController.clear();
      setState(() {});
    }
  }

  void removeCity(String nameCity) {
    citiesList.remove(nameCity);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Form(
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Країна',
              style: Theme.of(context).primaryTextTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            TextFormField(
              textAlign: TextAlign.center,
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
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  isCollapsed: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  hintText: "Назва країни*",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  errorStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 248, 104, 104),
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 248, 104, 104),
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  )),
              onEditingComplete: () {
                nameCountry = _countryNameController.text;
                FocusScope.of(context).nextFocus();
                setState(() {});
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(height: 20),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Міста',
              style: Theme.of(context).primaryTextTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                TextFormField(
                    textAlign: TextAlign.center,
                    controller: _cityNameController,
                    validator: (value) {
                      if (citiesList.isEmpty) {
                        return "Назва міста не повинна бути пустою";
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\D+'))
                    ],
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 13),
                        hintText: "Назва міста*",
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        errorStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 104, 104),
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 248, 104, 104),
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        )),
                    onEditingComplete: () {
                      addCity();
                    }),
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                    onPressed: () {
                      addCity();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).cardColor)),
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    )),
                const SizedBox(
                  height: 15,
                ),
                (citiesList.isNotEmpty)
                    ? Center(
                        child: Column(
                        children: [
                          for (var i = 0; i < citiesList.length; i++)
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => removeCity(citiesList[i]),
                              child: Column(
                                children: [
                                  Text(
                                    citiesList[i],
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyMedium,
                                  ),
                                  // const SizedBox(height: 5),
                                  CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    maxRadius: 12,
                                    child: Icon(
                                      Icons.remove,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ))
                    : Text(
                        'Введіть хоча б одну назву міста в поле "Міста"',
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                const SizedBox(height: 10),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).cardColor),
              ),
              onPressed: () {
                setState(() {
                  autoValidate = true;
                });

                var country = Country(
                  name: _countryNameController.text,
                  cities: citiesList,
                  image: '',
                );
                final countryBloc = BlocProvider.of<CountriesCubit>(context);

                (widget.country != null)
                    ? countryBloc.onEditCountry(country).whenComplete(() {
                        countryBloc.onLoadAllCountries();
                        Navigator.pop(context);
                      })
                    : countryBloc.onAddCountry(country).whenComplete(() {
                        countryBloc.onLoadAllCountries();
                        Navigator.pop(context);
                      });
              },
              child: Text('Зберегти',
                  style: Theme.of(context).textTheme.titleSmall),
            ),
          ],
        ),
      ),
    );
  }
}
