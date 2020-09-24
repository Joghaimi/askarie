// Function
import '../DB/DataBaseHelper.dart';
//Screens
import '../../screens/units.dart';

Future <void> getQuestion(var materialName , var unitName) async{
  // Initialize DB
  DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
  var allQs = await baseHelper.getAllQS(materialName, unitName); // GetAllQS
//  print(allQs);
  Units.questionNumber = allQs.length;
  for(int i=0;i<allQs.length;i++){
    Units.questionsArray[i]=[
      allQs[i]["QS"],
      allQs[i]["A_Ans"],
      allQs[i]["B_Ans"],
      allQs[i]["C_Ans"],
      allQs[i]["D_Ans"],
      allQs[i]["solution"],
    ];

  }
}