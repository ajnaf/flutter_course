import 'package:flutter/material.dart';
import 'package:flutter_course/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter_course/ui/widgets/startup_button.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        onModelReady: (model) async => await model.init(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StartupButton(
                      title: 'next page',
                      onTap: model.navigate,
                    ),
                    StartupButton(
                      title: 'show dialog',
                      onTap: model.showDialog,
                    ),
                    StartupButton(
                      title: 'show snackbar',
                      onTap: model.showSnackbar,
                    ),
                    StartupButton(
                      title: 'show bottom sheet',
                      onTap: model.bottomSheet,
                    ),
                  ],
                ),
              ),
            ));
  }
}
