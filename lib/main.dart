import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'presentation/routes/page_route.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/view_model/order_view_model.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RPHU App',
        theme: ThemeData(fontFamily: "Poppins"),
        routes: AppPage.pages,
        home: const HomeScreen(),
      ),
    );
  }
}
