

import 'package:get_it/get_it.dart';

import 'dialog_service.dart';
import 'firestoreService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => DialogService());
  locator.registerFactory(() => FireStoreServices());
}