import 'package:flutter/material.dart';
import 'package:week4_advance_flutter/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});
  final DownloadController controller;

  // TODO
  void onTapDownload() {
    controller.startDownload();
  }

  String get title => controller.ressource.name;

  IconData get downloadIcon => controller.status == DownloadStatus.downloaded
      ? Icons.folder
      : controller.status == DownloadStatus.downloading
      ? Icons.downloading_sharp
      : Icons.download;

  String get progressText => controller.status == DownloadStatus.downloading
      ? "${controller.progress * 100} % - ${(controller.progress * controller.ressource.size)} of ${controller.ressource.size} MB"
      : controller.status == DownloadStatus.downloaded
      ? "Completed - ${(controller.progress * controller.ressource.size)} of ${controller.ressource.size} MB"
      : "${controller.ressource.size} MB";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            progressText,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.neutralLight,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: IconButton(
            onPressed: controller.status == DownloadStatus.downloaded
                ? null
                : onTapDownload,

            icon: Icon(downloadIcon),
            iconSize: 18,
          ),
        ),
      ),
    );

    // TODO
  }
}
