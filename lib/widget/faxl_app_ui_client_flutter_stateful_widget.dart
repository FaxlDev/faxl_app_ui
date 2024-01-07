import 'package:faxl_app_ui/faxl_client/faxl_client.dart';
import 'package:flutter/material.dart'; 

abstract class FaxlAppUiAppStatefulWidget extends StatefulWidget {
  final FaxlClient faxlClient;
  const FaxlAppUiAppStatefulWidget({
    super.key,
    required this.faxlClient,
  });
}
