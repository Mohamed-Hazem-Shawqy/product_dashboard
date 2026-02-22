import 'package:flutter/material.dart';
import 'package:product_dashboard/feature/add_product/presentation/views/add_product_view.dart';
import 'package:product_dashboard/feature/dash_board/presentation/views/dash_board_view_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBoardViewPage.routeName:
      return MaterialPageRoute(builder: (context) => DashBoardViewPage());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());

    default:
      return MaterialPageRoute(builder: (context) => DashBoardViewPage());
  }
}
