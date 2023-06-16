import 'package:fast_media/colors/colors.dart';
import 'package:flutter/material.dart';

class MovieActionsRow extends StatelessWidget {
  const MovieActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            print('save');
          },
          child: const Icon(
            Icons.bookmark_border,
            color: kWireframe_1,
          ),
        ),
        GestureDetector(
          onTap: () {
            print('share');
          },
          child: const Icon(
            Icons.share_rounded,
            color: kWireframe_1,
          ),
        ),
        GestureDetector(
          onTap: () {
            print('download');
          },
          child: const Icon(
            Icons.file_download_outlined,
            color: kWireframe_1,
          ),
        ),
      ],
    );
  }
}
