import 'package:rphu_app/presentation/screens/add_order_screen/add_order_screen.dart';

import '../screens/confirmation_screen/confirmation_screen.dart';
import '../screens/detail_order_screen/detail_order_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/order_screen/order_screen.dart';
import 'route_name.dart';

class AppPage {
  static final pages = {
    RouteName.homeScreen: (context) => const HomeScreen(),
    RouteName.addOrderScreen: (context) => const AddOrderScreen(),
    RouteName.confirmationScreen: (context) => const ConfirmationScreen(),
    RouteName.orderScreen: (context) => const OrderScreen(),
    RouteName.detailOrderScreen: (context) => const DetailOrderScreen(),
  };
}
