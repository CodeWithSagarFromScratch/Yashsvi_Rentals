import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yashvi_rentals/Services/storage_services.dart';
import 'package:yashvi_rentals/View/Authentication_Section/splash_view.dart';
import 'providerStateManagement/quatationprovider.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageServices.initializeSharedPreferences();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SalesQuatationProvider()),
        // Add other providers here if necessary
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
