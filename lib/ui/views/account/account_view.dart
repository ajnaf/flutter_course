import 'package:flutter/material.dart';
import 'package:flutter_course/ui/views/account/account_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
        viewModelBuilder: () => AccountViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: InkWell(onTap: () {}, child: Text('Account View')),
              ),
            ));
  }
}
