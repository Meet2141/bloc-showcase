import 'package:bloc_showcase/src/app_state/app_state.dart';

///Created typedef for Map<String, dynamic> (JSON File Type)
typedef JsonPayLoad = Map<String, dynamic>;

/// Global variable for AppState class
AppState appState = AppState();

/// StringConstants contains all constant string used in app.
class StringConstants {
  static const appName = 'Bloc Showcase';
  static const error = 'Error';
  static const details = 'Details';
  static const userDetails = 'User $details';
  static const addDetails = 'Add $details';
  static const save = 'Save';
  static const updateDetails = 'Update $details';
  static const name = 'Name';
  static const email = 'Email';
  static const phone = 'Phone';
}
