abstract class ILocalStorageDriver {
  Future delete({required String key});
  Future getData({required String key});
  Future put({required String key, required dynamic value});

  Future getList({required String key});
  Future putList({required String key, required List list});
}
