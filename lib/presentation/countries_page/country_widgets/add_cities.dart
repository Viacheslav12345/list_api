// import 'package:flutter/material.dart';

// class AddCities extends StatefulWidget {
//   AddCities({Key? key}) : super(key: key);

//   @override
//   State<AddCities> createState() => _AddCitiesState();
// }

// class _AddCitiesState extends State<AddCities> {
//   @override
//   void initState() {
//         citiesList = (widget.country != null) ? widget.country!.cities : [];

//     super.initState();
//   }

//   final _cityNameController = TextEditingController();
//   List<String> citiesList = [];


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//             textAlign: TextAlign.center,
//             controller: _cityNameController,
//             validator: (value) {
//               if (citiesList.isEmpty) {
//                 return "Назва міста не повинна бути пустою";
//               }
//               return null;
//             },
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp(r'\D+'))
//             ],
//             decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Theme.of(context).cardColor,
//                 isCollapsed: true,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
//                 hintText: "Назва міста*",
//                 hintStyle: Theme.of(context).textTheme.bodySmall,
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none),
//                 focusedBorder:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                 errorStyle: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//                 errorBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   borderSide: BorderSide(
//                     color: Color.fromARGB(255, 248, 104, 104),
//                     style: BorderStyle.solid,
//                     width: 2,
//                   ),
//                 ),
//                 focusedErrorBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   borderSide: BorderSide(
//                     color: Color.fromARGB(255, 248, 104, 104),
//                     style: BorderStyle.solid,
//                     width: 2,
//                   ),
//                 )),
//             onEditingComplete: () {
//               addCity();
//             }),
//         const SizedBox(
//           height: 10,
//         ),
//         IconButton(
//             onPressed: () {
//               addCity();
//             },
//             style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all(Theme.of(context).cardColor)),
//             icon: Icon(
//               Icons.add,
//               color: Theme.of(context).scaffoldBackgroundColor,
//             )),
//         const SizedBox(
//           height: 15,
//         ),
//         (citiesList.isNotEmpty)
//             ? Center(
//                 child: Column(
//                 children: [
//                   for (var i = 0; i < citiesList.length; i++)
//                     InkWell(
//                       splashColor: Colors.transparent,
//                       highlightColor: Colors.transparent,
//                       onTap: () => removeCity(citiesList[i]),
//                       child: Column(
//                         children: [
//                           Text(
//                             citiesList[i],
//                             style:
//                                 Theme.of(context).primaryTextTheme.bodyMedium,
//                           ),
//                           // const SizedBox(height: 5),
//                           CircleAvatar(
//                             backgroundColor: Theme.of(context).cardColor,
//                             maxRadius: 12,
//                             child: Icon(
//                               Icons.remove,
//                               color: Theme.of(context).scaffoldBackgroundColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ))
//             : Text(
//                 'Введіть хоча б одну назву міста в поле "Міста"',
//                 style: Theme.of(context).primaryTextTheme.bodyMedium,
//                 textAlign: TextAlign.center,
//               ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }
