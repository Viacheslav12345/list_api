import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:list_api/presentation/countries_page/add_or_edit_country.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 7.0),
      padding: EdgeInsets.only(top: 7, bottom: 50, left: 7, right: 7),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(child: const AddOrEditCountry());
                          });
                    },
                    child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        color: theme.cardColor,
                        child: Slidable(
                          key: UniqueKey() /*ValueKey(index)*/,
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {
                              // _deleteCurrentJob();
                            }),
                            children: [
                              SlidableAction(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                                onPressed: (context) {
                                  // _deleteCurrentJob();
                                },
                                backgroundColor:
                                    const Color.fromARGB(255, 147, 246, 185),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Редагувати',
                              ),
                              SlidableAction(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                                onPressed: (context) {
                                  // _deleteCurrentJob();
                                },
                                backgroundColor:
                                    const Color.fromARGB(255, 248, 104, 104),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                width:
                                    MediaQuery.of(context).size.width / 3 - 10,
                                child: Text(
                                  'Great Britain',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.scaffoldBackgroundColor,
                                  // borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      width: 5,
                                      color: theme.cardColor,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside),
                                  image: DecorationImage(
                                    image: Image.asset(
                                            'assets/images/liberty100.png')
                                        .image,
                                  ),
                                ),
                                height: 100,
                                width:
                                    MediaQuery.of(context).size.width / 3 - 10,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 10,
                                child: Text(
                                  'London, Birmingham, Manchester, Glasgow, Newcastle, Sheffield, Leeds, Bristol',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodySmall,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                }),
          ),
          Card(
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
                    // borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        width: 5,
                        color: theme.cardColor,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    // image: DecorationImage(
                    //   image: Image.asset('assets/images/liberty100.png')
                    //       .image,
                    // ),
                  ),
                  height: 45,
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  child: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3 - 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
