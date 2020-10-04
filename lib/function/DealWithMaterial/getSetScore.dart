import '../localStorage.dart';
getUnitScore(String materialName , String unitName){
  return localStorage.getData("$materialName.$unitName");
}
setUnitScore(String materialName , String unitName , int unitScore){
  localStorage.saveData("$materialName.$unitName", unitScore);
}