// Function
import '../DB/DataBaseHelper.dart';
//Screens
import '../../screens/units.dart';

Future <void> getQuestion(var materialName , var unitName) async{
  // Initialize DB
  DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
  var allQs = await baseHelper.getAllQS(materialName, unitName); // GetAllQS
  var i =0;
  for(var qs in allQs){
    Units.questionsArray[i]=[
      qs[2],
      qs[3],
      qs[4],
      qs[5],
      qs[6]
    ];
    i++;
  }
}