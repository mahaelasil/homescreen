import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:untitled6/presentation/router/app_router.dart';

import 'data/data_source/local/my_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      );
    }
    );
  }
}