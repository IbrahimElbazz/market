import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.name,
    required this.comment,
    required this.replay,
  });

  final String name;
  final String comment;
  final String replay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GapH(
          height: 10,
        ),
        Row(
          children: [
            const GapW(width: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const GapH(height: 5),
        Row(
          children: [
            const GapW(width: 20),
            Expanded(
              child: Text(
                comment,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const GapH(height: 5),
        Row(
          children: [
            const GapW(width: 10),
            Text(
              'Replay : ',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const GapH(height: 5),
        Row(
          children: [
            const GapW(width: 20),
            Expanded(
              child: Text(
                replay,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const GapH(
          height: 10,
        ),
        Divider(
          color: Colors.grey.withOpacity(0.2),
          endIndent: 15.w,
          indent: 15.w,
        ),
        const GapH(
          height: 3,
        )
      ],
    );
  }
}
