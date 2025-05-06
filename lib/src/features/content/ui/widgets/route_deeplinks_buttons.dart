import 'package:flutter/material.dart';
import 'package:flutter_travel_app/resources/resources.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class RouteDeeplinksButtons extends StatelessWidget {
  final RouteModel route;

  const RouteDeeplinksButtons({required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    final yandexMapsUrl = route.yandexMapsUrl;
    final doubleGisUrl = route.doubleGisUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DeeplinkButton(
          context.strings.yMapOpenButton,
          url: yandexMapsUrl,
          imagePath: AppImages.yMaps,
        ),
        const SizedBox(
          width: 10,
        ),
        _DeeplinkButton(
          context.strings.doubleGisOpenButton,
          url: doubleGisUrl,
          imagePath: AppImages.doubleGis,
        ),
      ],
    );
  }
}

class _DeeplinkButton extends StatelessWidget {
  final String url;
  final String imagePath;
  final String label;

  const _DeeplinkButton(
    this.label, {
    required this.url,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton.minor(
      child: AppText(label),
      onPressed: () => url_launcher.launchUrl(Uri.parse(url)),
    );
  }
}
