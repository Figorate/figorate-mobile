import 'package:figorate_mobile/services/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}

NavigationService navigationService = locator.get<NavigationService>();
