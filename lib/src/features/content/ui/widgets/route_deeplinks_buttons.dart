part of '../content_page.dart';

class _RouteDeeplinksButtons extends StatelessWidget {
  final RouteModel route;

  const _RouteDeeplinksButtons({required this.route});

  @override
  Widget build(BuildContext context) {
    final yandexMapsUrl = route.yandexMapsUrl;
    final doubleGisUrl = route.doubleGisUrl;

    return Row(
      children: [
        _DeeplinkButton(
          context.strings.yMapOpenButton,
          url: yandexMapsUrl,
          imagePath: AppImages.yMaps,
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
    return ElevatedButton.icon(
      label: AppText(label),
      onPressed: () => url_launcher.launchUrl(Uri.parse(url)),
    );
  }
}
