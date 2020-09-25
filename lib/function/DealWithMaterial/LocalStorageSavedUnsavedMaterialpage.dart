// Functions
import '../localStorage.dart';
import '../DB/DataBaseHelper.dart';
// Screen
import '../../screens/AllMaterial.dart';
  localStorageSavedUnsavedMaterialPage()async{
  // Initialize DB
  DataBaseHelper baseHelper=DataBaseHelper(); // DataBase Helper
  await baseHelper.initializeDB();
  // Read All Saved Material
  var allMaterialFromlocal = await localStorage.getDataStringArray('Material');

  AllMaterial.AllMaterialNum= allMaterialFromlocal.length;
  if(allMaterialFromlocal!=0){
    for (int i = 0; i < allMaterialFromlocal.length; i++) {
      //check if their is DB with the name of the material Saved Material
      if(await baseHelper.isexist(allMaterialFromlocal[i])){
      // Table Exist
        AllMaterial.SavedMaterial[AllMaterial.SavedMaterialNum]=allMaterialFromlocal[i];
        AllMaterial.SavedMaterialNum+=1;
      }else{// Table NOT Exist
        print(i); // TODO Delete
        AllMaterial.NonSavedMaterial[AllMaterial.NonSavedMaterialNum]=allMaterialFromlocal[i];
        AllMaterial.NonSavedMaterialNum+=1;
      }
    }
  }
  AllMaterial.Ready =true;
  return true;
}