import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  Map<String, dynamic> _data = {};
  num _maxtick = 0;
  int _numberOfAcc = 0;
  List<String> _daftar = [];
  int _chosen = 0;

  Map<String, dynamic> get data => _data;
  num get maxtick => _maxtick;
  int get numberOfAcc => _numberOfAcc;
  List<String> get daftar => _daftar;
  int get chosen => _chosen;

  getChosenAcc(){
    notifyListeners();
    return _chosen + 1;
  }

  void updateChosenAcc(int value){
    _chosen = value;
    notifyListeners();
  }

  getMaxTick(String kunci){
    _maxtick = _data[kunci]["abilityScores"]["maxtick"];
    notifyListeners();
    return _maxtick;
  }

  getNumberOfAccounts(){
    notifyListeners();
    return _numberOfAcc;
  }

  void updateNumberOfAcc(int value){
    _numberOfAcc = value;
    notifyListeners();
  }

  getDaftarAkun(){
    notifyListeners();
    return _daftar;
  }

  void updateDaftarAkun(String value){
    _daftar.add(value);
    notifyListeners();
  }


  void updateAbility(String kunci, num value1, num value2, num value3, num value4, num value5, num value6, num value7, num value8, num value9, num value10, num value11, String value12) {
    //add index of accounts here
    _data[kunci]['abilityScores']['str'] = value1;
    _data[kunci]['abilityScores']['dex'] = value2;
    _data[kunci]['abilityScores']['con'] = value3;
    _data[kunci]['abilityScores']['int'] = value4;
    _data[kunci]['abilityScores']['wis'] = value5;
    _data[kunci]['abilityScores']['cha'] = value6;
    _data[kunci]['abilityScores']['maxtick'] = value7;
    _data[kunci]['abilityScores']['inspiration'] = value8;
    _data[kunci]['abilityScores']['proficiency'] = value9;
    _data[kunci]['abilityScores']['perception'] = value10;
    _data[kunci]['abilityScores']['savingThrows'] = value11;
    _data[kunci]['abilityScores']['skills'] = value12;
    notifyListeners();
  }

  void updateBasicStats(String kunci, num value1, value2, value3, value4, value5, value6, value7, value8) {
    _data[kunci]['basicStats']['armor'] = value1;
    _data[kunci]['basicStats']['initiative'] = value2;
    _data[kunci]['basicStats']['speed'] = value3;
    _data[kunci]['basicStats']['maxhp'] = value4;
    _data[kunci]['basicStats']['hp'] = value5;
    _data[kunci]['basicStats']['temphp'] = value6;
    _data[kunci]['basicStats']['totalhitdice'] = value7;
    _data[kunci]['basicStats']['deathsaves'] = value8;
    notifyListeners();
  }

  void updatePersonality(String kunci, String value1, String value2, String value3, String value4){
    _data[kunci]['personality']['traits'] = value1;
    _data[kunci]['personality']['ideals'] = value1;
    _data[kunci]['personality']['bonds'] = value1;
    _data[kunci]['personality']['flaws'] = value1;
    notifyListeners();
  }

  void updateEquipment(String kunci, num value1, num value2, num value3, num value4, num value5, String value6){
    _data[kunci]['equipment']['cp'] = value1;
    _data[kunci]['equipment']['sp'] = value2;
    _data[kunci]['equipment']['ep'] = value3;
    _data[kunci]['equipment']['gp'] = value4;
    _data[kunci]['equipment']['pp'] = value5;
    _data[kunci]['equipment']['equipments'] = value6;
    notifyListeners();
  }

  void updateAttacks(String kunci, String value1){
    _data[kunci]['attacks'] = value1;
    notifyListeners();
  }

  void updateFeatures(String kunci, num value1, num value2, num value3, String value4, String value5, String value6, String value7, String value8){
    _data[kunci]['features']['age'] = value1;
    _data[kunci]['features']['height'] = value2;
    _data[kunci]['features']['weight'] = value3;
    _data[kunci]['features']['eyes'] = value4;
    _data[kunci]['features']['skin'] = value5;
    _data[kunci]['features']['hair'] = value6;
    _data[kunci]['features']['additional'] = value7;
    _data[kunci]['features']['backstory'] = value8;
    notifyListeners();
  }

  void updateProficiency(String kunci, String value1, String value2){
    _data[kunci]['proficiencies']['languange'] = value1;
    _data[kunci]['proficiencies']['other'] = value2;
    notifyListeners();
  }

  void updateInventory(String kunci, String value1, String value2){
    _data[kunci]['inventory']['inv'] = value1;
    _data[kunci]['inventory']['treasure'] = value2;
    notifyListeners();
  }

  void updateAllies(String kunci, String value){
    _data[kunci]['allies'] = value;
    notifyListeners();
  }

  void deleteAccount(String kunci) {
    //disini remove account dengan memberi nama account, contoh: deleteAccount('account 1')
    _data.remove(kunci);
  }

  void addAccount(String kunci, String name, String race, String classs) {
    //ketika membuat account baru, semua status dalam akun itu 0 atau kosong(untuk string)
    _data[kunci] = {
      "name": name,
      "race": race,
      "class": classs,
      "abilityScores": {
        "str": 0,
        "dex": 0,
        "con": 0,
        "int": 0,
        "wis": 0,
        "cha": 0,
        "maxtick": 0,
        "inspiration": 0,
        "proficiency": 0,
        "perception": 0,
        "savingThrows": 0,
        "skills": ""
      },
      "basicStats": {
        "armor": 0,
        "initiative": 0,
        "speed": 0,
        "maxhp": 0,
        "hp": 0,
        "temphp": 0,
        "totalhitdice": 0,
        "deathsaves": 0
      },
      "personality": {
        "traits": "",
        "ideals": "",
        "Bonds": "",
        "Flaws": ""
      },
      "equipment": {
        "cp": 0,
        "sp": 0,
        "ep": 0,
        "gp": 0,
        "pp": 0,
        "equipments": ""
      },
      "attacks": "",
      "proficiencies": {
        "languange": "",
        "other": ""
      },
      "features":{
        "age": 0,
        "height": 0,
        "weight": 0,
        "eyes": "",
        "skin": "",
        "hair": "",
        "additional": "",
        "backstory": ""
      },
      "inventory": {
        "inv": "a backpack",
        "treasure": ""
      },
      "allies": ""
    };
  }
}
