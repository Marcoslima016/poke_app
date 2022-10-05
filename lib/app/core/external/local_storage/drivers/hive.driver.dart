import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../local_storage.imports.dart';

class HiveDriver implements ILocalStorageDriver {
  bool _initialized = false;

  String boxName;

  late Box _box;

  HiveDriver({
    required this.boxName,
  }) {
    initHive();
  }

  //--------------------- INIT ---------------------

  Future initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox(boxName);
    _box = Hive.box(boxName);
    _initialized = true;
  }

  //------------------------------------------ GET LIST -------------------------------------------

  @override
  Future getList({required String key}) async {
    if (_initialized == false) await initHive();

    List resultJson = await _box.get(key, defaultValue: []);

    return resultJson;
  }

  //------------------------------------------ PUT LIST -------------------------------------------

  @override
  Future putList({required String key, required List list}) async {
    if (_initialized == false) await initHive();

    await _box.put(key, list);

    // int id = 0;
    // for (var item in list) {
    //   put(key: id.toString(), value: item);
    //   id++;
    // }
  }

  //-------------------------------------------- GET --------------------------------------------

  @override
  Future getData({required String key}) async {
    if (_initialized == false) await initHive();
  }

  //--------------------------------------------- PUT ---------------------------------------------

  @override
  Future put({required String key, required value}) async {
    if (_initialized == false) await initHive();
    await _box.put(key, value);
  }

  //------------------------------------------- DELETE -------------------------------------------

  @override
  Future delete({required String key}) async {
    if (_initialized == false) await initHive();
    // TODO: implement delete
    throw UnimplementedError();
  }

  //
}
