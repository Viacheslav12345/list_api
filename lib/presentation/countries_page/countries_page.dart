import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:list_api/data/models/country.dart';
import 'package:list_api/presentation/countries_page/add_or_edit_country.dart';
import 'package:list_api/presentation/countries_page/country_cubit/cubit/countries_cubit.dart';
import 'package:list_api/presentation/countries_page/country_widgets/add_photo_country.dart';
import 'package:list_api/presentation/weather_page/weather_cubit/weather_cubit.dart';
import 'package:list_api/presentation/weather_page/weather_page.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<CountriesCubit, CountriesState>(
      builder: (context, state) {
        List<Country> allCountries = [];
        if (state is CountriesLoaded) {
          allCountries = state.allCountries;
        }

        void deleteCountry(String countryName) {
          BlocProvider.of<CountriesCubit>(context)
              .onDeleteCountry(countryName)
              .then((value) => BlocProvider.of<CountriesCubit>(context)
                  .onLoadAllCountries());
        }

        return switch (state) {
          CountriesLoaded() => Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: allCountries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              margin: const EdgeInsets.symmetric(vertical: 7),
                              color: theme.cardColor,
                              child: Slidable(
                                key: UniqueKey() /*ValueKey(index)*/,
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  dismissible: DismissiblePane(onDismissed: () {
                                    deleteCountry(allCountries[index].name);
                                  }),
                                  children: [
                                    SlidableAction(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)),
                                      onPressed: (context) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                  insetPadding:
                                                      const EdgeInsets.all(20),
                                                  child: AddOrEditCountry(
                                                      country:
                                                          allCountries[index]));
                                            });
                                      },
                                      backgroundColor: const Color.fromARGB(
                                          255, 147, 246, 185),
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit,
                                      label: 'Редагувати',
                                    ),
                                    SlidableAction(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                      onPressed: (context) {
                                        deleteCountry(allCountries[index].name);
                                      },
                                      backgroundColor: const Color.fromARGB(
                                          255, 248, 104, 104),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Видалити',
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(7),
                                      width: MediaQuery.of(context).size.width /
                                              3 -
                                          10,
                                      child: Text(
                                        allCountries[index].name,
                                        textAlign: TextAlign.right,
                                        style: theme.textTheme.titleMedium,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    AddPhotoCountry(
                                        country: allCountries[index]),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              3 -
                                          10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            children: [
                                              for (var i = 0;
                                                  i <
                                                      allCountries[index]
                                                          .cities
                                                          .length;
                                                  i++)
                                                Text(
                                                  allCountries[index].cities[i],
                                                  // textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              BlocProvider.of<WeatherCubit>(
                                                      context)
                                                  .onLoadCityForecast(
                                                      allCountries[index]
                                                          .cities)
                                                  .then(
                                                    (value) =>
                                                        Navigator.of(context)
                                                            .push(
                                                      MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            WeatherPage(
                                                          country: allCountries[
                                                                  index]
                                                              .name,
                                                          cityNameList:
                                                              allCountries[
                                                                      index]
                                                                  .cities,
                                                        ),
                                                      ),
                                                    ),
                                                  );

                                              //!! add timout 1 sec
                                            },
                                            child: Icon(
                                              Icons.navigate_next,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              size: 35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return const Dialog(
                              insetPadding: EdgeInsets.all(20),
                              child: AddOrEditCountry(country: null));
                        }),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      color: theme.cardColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.scaffoldBackgroundColor,
                              border: Border.all(
                                  width: 5,
                                  color: theme.cardColor,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 3 - 10,
                            child: Icon(
                              Icons.add,
                              size: 35,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          CountriesLoading() ||
          CountriesInitial() =>
            const Center(child: CircularProgressIndicator()),
          CountriesLoadingFailure() => Center(
              child: Text(
                'Error',
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
            ),
        };
      },
    );
  }
}
