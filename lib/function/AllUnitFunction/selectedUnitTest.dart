// Function
import 'package:askarie/screens/MultibleChoice.dart';

import '../DB/DataBaseHelper.dart';
//Screens
import '../../screens/units.dart';
Future selectedUnitTest()async{
  // TODO Show Ads
  await saveTestUnitQsArray(Units.materialName,Units.selectedUnits);
  // GoToUnitTestPage
  MultibleChoise.materialName=Units.materialName;
  //
  return true;
}
Future <void> saveTestUnitQsArray(var materialName , var unitsName) async{
  // Initialize DB
  DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
  Units.questionNumber = (unitsName.length*10)-1;
  print(Units.questionNumber);
  int incrementStart =0;
  int incrementLim =10;
  int increment =10;
  for(int x=0;x<unitsName.length;x++) {
    var allQs = await baseHelper.getRandomQS(materialName, unitsName[x]);
    var allIndex =0;
    for (; incrementStart < incrementLim; incrementStart++) {
      Units.questionsArray[incrementStart] = [
        allQs[allIndex]["QS"],
        allQs[allIndex]["A_Ans"],
        allQs[allIndex]["B_Ans"],
        allQs[allIndex]["C_Ans"],
        allQs[allIndex]["D_Ans"],
        allQs[allIndex]["solution"],
      ];
      allIndex++;
    }
    incrementStart = incrementLim;
    incrementLim = increment*(x+2);
    emptyTestArray();

  }
}
void emptyTestArray(){
  Units.selectedUnits.clear();
}