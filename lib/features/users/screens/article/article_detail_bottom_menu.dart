import 'package:flutter/material.dart';

class ArticleDetailBottomMenu extends StatelessWidget {
  final VoidCallback onSummary;
  final VoidCallback onShare;
  final VoidCallback onSave;

  const ArticleDetailBottomMenu({
    super.key,
    required this.onSummary,
    required this.onShare,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 10),

          ListTile(
            leading: Icon(
              Icons.summarize,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              "Tóm tắt nội dung bằng AI",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            onTap: onSummary,
          ),

          ListTile(
            leading: Icon(
              Icons.share,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              "Chia sẻ bài viết",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            onTap: onShare,
          ),

          ListTile(
            leading: Icon(
              Icons.bookmark_add_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              "Lưu bài",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            onTap: onSave,
          ),
        ],
      ),
    );
  }
}
