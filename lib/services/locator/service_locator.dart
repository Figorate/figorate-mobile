import 'package:figorate_mobile/network/dio_client.dart';
import 'package:figorate_mobile/services/api/user_api_service.dart';
import 'package:figorate_mobile/services/navigation/navigation_service.dart';
import 'package:figorate_mobile/services/snackbar.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackbarService>(() => SnackbarService());
  locator.registerLazySingleton<UserApiService>(() => UserApiService(dioClient: locator.get<DioClient>()));
}

NavigationService navigationService = locator.get<NavigationService>();
SnackbarService snackBarService = locator.get<SnackbarService>();
UserApiService userApiService = locator.get<UserApiService>();
