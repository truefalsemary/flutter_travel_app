part of '../content_page.dart';

class _RouteDeeplinksButtons extends StatelessWidget {
  final RouteModel route;

  const _RouteDeeplinksButtons({required this.route});

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
        SizedBox(
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
