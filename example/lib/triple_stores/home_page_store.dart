import 'package:flutter_triple/flutter_triple.dart';

class HomePageStore extends NotifierStore<Object, String> {
  HomePageStore() : super('') {
    Future.delayed(const Duration(seconds: 4), () {
      setLoading(true);
      // Future.delayed(const Duration(seconds: 4), () {
      //   update(DateTime.now().toString());
      //   setLoading(false);
      // });
      Future.delayed(const Duration(seconds: 4), () {
        setError(Object());
      });
    });
  }
}
