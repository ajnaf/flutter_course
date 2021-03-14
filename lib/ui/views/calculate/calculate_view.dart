import 'package:flutter/material.dart';
import 'package:flutter_course/ui/views/calculate/calculate_viewmodel.dart';
import 'package:flutter_course/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CalculateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculateViewModel>.reactive(
        viewModelBuilder: () => CalculateViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text('calculate view')),
            ));
  }
}
