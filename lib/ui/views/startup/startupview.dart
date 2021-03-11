import 'package:flutter/material.dart';
import 'package:flutter_course/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: InkWell(onTap: model.nextPage, child: Text('start')),
              ),
            ));
  }
}
