// packages
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

// Component
import '../component/MyAppBar.dart';
import '../component/UnitBoxs.dart';
import '../component/ChoseOption.dart';
import '../component/SearchResult.dart';

// Constant
import '../constent/Color.dart';
import '../material/Units.dart';
import '../constent/Text.dart';

// themes
import '../themes/size_config.dart';
import '../themes/AppTheme.dart';

// Function
import '../function/search.dart';

class Units extends StatefulWidget {
  static final id = "units";
  static final ad = 0;
  static var state = false;

  // Searching
  static var isSearching = false;

  // For Unit And Type
  static var Unit_id;
  static var Search = false;
  static var UnitScore = new List(100);

  @override
  _UnitsState createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  @override
  void initState() {
    setState(() {
      Units.state = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          setState(() {
            Units.state = false;
            Units.Search = false;
          });
        },
        child: Container(
          child: Scaffold(
            body: Container(
              color: C_Gray,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 8 * SizeConfig.heightMultiplier,
                    color: C_Purple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Units.isSearching = !Units.isSearching;
                              });
                            },
                            child: Icon(
                              !Units.isSearching ? Icons.search : Icons.cancel,
                              color: Colors.white,
                              size: !Units.isSearching ? 50 : 30,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Units.isSearching
                              ? Theme(
                                  data: new ThemeData(
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.white,
                                  ),
                                  child: TextField(
                                    autofocus: true,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                    onSubmitted: (String search) {
                                      Search.Result.clear();
                                      if (search.isNotEmpty) {
                                        Search.search(search);
                                        setState(() {
                                          Units.Search = true;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: "بحث",
                                      hintStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Text(""),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              !Units.isSearching ? AppName : "",
                              style: AppTheme.Titel.copyWith(
                                fontSize: 3.5 * SizeConfig.textMultiplier,
                                height: 0.15 * SizeConfig.heightMultiplier,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 20 * SizeConfig.widthMultiplier,
                        ),
                        ListView.builder(
                            itemCount: Units_Name.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Column(
                                children: <Widget>[
                                  index == 0
                                      ? SizedBox(
                                          height:
                                              8 * SizeConfig.heightMultiplier,
                                        )
                                      : SizedBox(
                                          height:
                                              0.4 * SizeConfig.heightMultiplier,
                                        ),
                                  buildGestureDetector(
                                      Units_Name[index],
                                      "${UnitsArray[index].length} سؤال ",
                                      "${Units.UnitScore[index]}/100",
                                      index,
                                      Units.UnitScore[index] == 0
                                          ? Colors.white
                                          : C_Purple),
                                ],
                              );
                            }),
                        ChoseOption(Units.state),
                        SearchResult(Units.Search),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  WcFlutterShare.share(
                      sharePopupTitle: 'مادة العسكرية',
                      subject: 'العسكرية ',
                      text:
                          'حمل تطبيق مادة العسكرية : joghaimi.com/askarie.html',
                      mimeType: 'text/plain');
                },
                icon: Icon(Icons.share),
                label: Text("share"),
                backgroundColor: C_Purple),
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(var BoxTitel, var NumerOfQwstions,
      var final_Score, var unit_id, var circleColors) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Units.Unit_id = unit_id;
          Units.state = true;
        });
      },
      child: UnitBoxs(
        BoxTitel: BoxTitel,
        NumerOfQestions: NumerOfQwstions,
        Final_Score: final_Score,
        circleColors: circleColors,
      ),
    );
  }
}
