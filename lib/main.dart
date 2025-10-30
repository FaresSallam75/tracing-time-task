import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tracing_time/business_logic/cubit/request_cubit.dart';
import 'package:tracing_time/business_logic/cubit/theme_cubit.dart';
import 'package:tracing_time/business_logic/state/theme_state.dart';
import 'package:tracing_time/presentation/screens/responsive_screen.dart';
import 'package:tracing_time/firebase_options.dart';

Box? myBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  myBox = await Hive.openBox("fares");
  if (!myBox!.containsKey("isDark")) {
    myBox!.put("isDark", false); // Default to light theme
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingsCubit(),
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) => MaterialApp(
          title: 'Tracing Time',
          theme: state.themeData,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          themeAnimationCurve: Curves.fastOutSlowIn,
          themeAnimationDuration: const Duration(milliseconds: 1500),
          home: BlocProvider(
            create: (context) => RequestCubit(),
            child: ResponsiveScreen(),
          ),
        ),
      ),
    );
  }
}
