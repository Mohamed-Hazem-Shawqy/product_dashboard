import 'package:flutter/material.dart';
import 'package:product_dashboard/feature/dash_board/presentation/widgets/dash_board_view_body.dart';

class DashBoardViewPage extends StatelessWidget {
  const DashBoardViewPage({super.key});
  static const routeName = 'dashBoard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const DashBoardViewBody());
  }
}
