import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  Map<String, dynamic> _data = {};

  num _maxtick = 0;

  num get maxtick => _maxtick;
  Map<String, dynamic> get data => _data;

  void setmaxtick(num value) {
    _maxtick = value;
    notifyListeners();
  }

  void updateAbility(
      num value1, num value2, num value3, num value4, num value5, num value6) {
    //add index of accounts here
    _data['str'] = value1;
    _data['dex'] = value2;
    _data['con'] = value3;
    _data['int'] = value4;
    _data['wis'] = value5;
    _data['cha'] = value6;
    notifyListeners();
  }

  void updateBasicStats(num value1, num value2, num value3, num value4, num value5, num value6, num value7, num value8){

  }

  void deleteAccount(String key) {
    _data.remove(key);
  }

  void addAccount(String key, String name, String race, String classs, int basic) {
    _data[key] = {
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
      "personality": {"traits": [""], "ideals": [""], "Bonds": [""], "Flaws": [""]},
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
