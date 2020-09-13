import 'dart:core';

class Material{
  int _id;
  String TableName;
  String _UnitName;
  String _QS;
  String _A_Ans;
  String _B_Ans;
  String _C_Ans;
  String _D_Ans;
  int _solution;
  Material(this.TableName, this._UnitName, this._QS,this._A_Ans,this._B_Ans,this._C_Ans,this._D_Ans,this._solution);
  Material.withId(this._id,this.TableName, this._UnitName, this._QS,this._A_Ans,this._B_Ans,this._C_Ans,this._D_Ans,this._solution);
  // Save Data
   void saveData(String tableName, String unitName, String _qs,String a_Ans,String B_Ans
      ,String C_Ans,String D_Ans,int solution){
     this._UnitName   = unitName;
     this._QS         = _qs;
     this._A_Ans      = a_Ans;
     this._B_Ans      = B_Ans;
     this._C_Ans      = C_Ans;
     this._D_Ans      = D_Ans;
     this._solution   = solution;
  }

  // Convert Material Object To A Map Object
  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map ['UnitName']    =  this._UnitName;
    map ['QS']          =  this._QS;
    map ['A_Ans']       =  this._A_Ans;
    map ['B_Ans']       =  this._B_Ans;
    map ['C_Ans']       =  this._C_Ans;
    map ['D_Ans']       =  this._D_Ans;
    map ['solution']    =  this._solution;
    return map;
  }

  // Convert A Map Object to Material Object
  Material.fromMapObject(Map<String,dynamic> map){
    this._UnitName   = map ['UnitName'];
    this._QS         = map ['QS'] ;
    this._A_Ans      = map ['A_Ans'];
    this._B_Ans      = map ['B_Ans'];
    this._C_Ans      = map ['C_Ans'];
    this._D_Ans      = map ['D_Ans'];
    this._solution   = map ['solution'];

  }

}