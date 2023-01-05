import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  Map<String, dynamic> _data = {};
  num _maxtick = 0;
  int _numberOfAcc = 0;

  Map<String, dynamic> get data => _data;
  num get maxtick => _maxtick;
  int get numberOfAcc => _numberOfAcc;

  getMaxTick(String kunci){
    _maxtick = _data[kunci]['abilityScores']['maxtick'];
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


  void updateAbility(String kunci, num value1, num value2, num value3, num value4, num value5, num value6, num value7) {
    //add index of accounts here
    _data[kunci]['abilityScores']['str'] = value1;
    _data[kunci]['abilityScores']['dex'] = value2;
    _data[kunci]['abilityScores']['con'] = value3;
    _data[kunci]['abilityScores']['int'] = value4;
    _data[kunci]['abilityScores']['wis'] = value5;
    _data[kunci]['abilityScores']['cha'] = value6;
    _data[kunci]['abilityScores']['maxtick'] = value7;
    notifyListeners();
  }

  void updateBasicStats(String kunci, num value1, num value2, num value3, num value4, num value5, num value6, num value7, num value8){

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
        "maxhp": 0,
        "hp": 0,
        "temphp": 0,
        "totalhitdice": 0,
        "hitdice": 0,
        "deathsaves": 0
      },
      "personality": {
        "traits": [""],
        "ideals": [""],
        "Bonds": [""],
        "Flaws": [""]
      },
      "equipment": {
        "cp": 0,
        "sp": 0,
        "ep": 0,
        "gp": 0,
        "pp": 0,
        "equipments": [""]
      },
      "attacks": {
        "name": [""],
        "atk": [""],
        "damage": [""],
        "type": [""]
      },
      "proficiency": {
        "languange": [""],
        "other": [""]
      },
      "inventory": {
        "inv": [""],
        "treasure": [""]
      },
      "allies": {
        "list": [""]
      }
    };
  }
}
