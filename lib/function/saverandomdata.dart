import 'DB/material.dart';
import 'DB/DataBaseHelper.dart';

saveRandomData()async{
  // Create DataBase
  DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
  baseHelper.createDBTable('Ahmad'); // this will create the DB if Not Exist and create table with name 5RA
  // material
  Material material = Material('Ahmad', 'UnitName1', 'QS','A_Ans','B_Ans','C_Ans','D_Ans',5);
  print (await baseHelper.insertMaterial(material));
  print ("Who KwNOS");
}