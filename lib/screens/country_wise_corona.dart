import 'package:coronavirusapp/widgets/country_wise_widget.dart';
import 'package:flutter/material.dart';

class CountryWiseCorona extends StatelessWidget {
  static const routeArgs = '/country-wise-corona';

  @override
  Widget build(BuildContext context) {
    final title =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(title['Country']),
      ),
      body: CountryWiseWidget(title),
    );
  }
}
