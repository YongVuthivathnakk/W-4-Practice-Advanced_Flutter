import 'package:flutter/material.dart';
import 'package:week4_advance_flutter/2_download_app/ui/screens/downloads/widgets/download_tile.dart';
import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widgets/download_controler.dart';

class DownloadsScreen extends StatefulWidget {
  final ThemeColorProvider colorProvider;

  DownloadsScreen({super.key, required this.colorProvider}) {
    // Create a controllers for each ressource
  }

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  // Create the list of fake ressources
  final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image1.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
  ];

  List<DownloadController> controllers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers = ressources.map((r) => DownloadController(r)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: widget.colorProvider.currentColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Downloads",
            style: AppTextStyles.heading.copyWith(
              color: widget.colorProvider.currentColor.color,
            ),
          ),

          SizedBox(height: 50),

          // TODO - Add the Download tiles
          ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: controllers.length,
            itemBuilder: (context, index) => ListenableBuilder(
              listenable: controllers[index],
              builder: (context, child) {
                return DownloadTile(controller: controllers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
