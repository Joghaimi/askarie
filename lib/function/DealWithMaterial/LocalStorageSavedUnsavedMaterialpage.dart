// Functions
import '../localStorage.dart';
import '../DB/DataBaseHelper.dart';

// Screen
import '../../screens/AllMaterial.dart';

localStorageSavedUnsavedMaterialPage() async {
  // Initialize DB
  print("Int DB");
  DataBaseHelper baseHelper = DataBaseHelper(); // DataBase Helper
  // Read All Saved Material
  print("start get Local Data");
  var allMaterialFromlocal = await localStorage.getDataStringArray('Material');
  print(allMaterialFromlocal);
  print("Finish get Local Data");

  AllMaterial.AllMaterialNum = allMaterialFromlocal!=0?allMaterialFromlocal.length:0;
  if (AllMaterial.AllMaterialNum != 0) {
    for (int i = 0; i < allMaterialFromlocal.length; i++) {
      //check if their is DB with the name of the material Saved Material
      if (await baseHelper.isexist(allMaterialFromlocal[i])) {
        // Table Exist
        AllMaterial.SavedMaterial[AllMaterial.SavedMaterialNum] =
            allMaterialFromlocal[i];
        AllMaterial.SavedMaterialNum += 1;
      } else {
        // Table NOT Exist
        AllMaterial.NonSavedMaterial[AllMaterial.NonSavedMaterialNum] =
            allMaterialFromlocal[i];
        AllMaterial.NonSavedMaterialNum += 1;
      }
    }
  }
  AllMaterial.Ready = true;
  return true;
}
