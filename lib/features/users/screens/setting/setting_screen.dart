import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_viewmodel.dart';
import '../profile/notification_settings_screen.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = context.watch<ThemeViewModel>().isDarkMode;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: const Color(0xFF015E53),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Cài đặt ứng dụng',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        children: [
          _buildSettingItem(
            context,
            icon: Icons.dark_mode_outlined,
            title: 'Chế độ tối',
            trailing: Switch(
              activeColor: const Color(0xFF015E53),
              value: isDarkMode,
              onChanged: (value) =>
                  context.read<ThemeViewModel>().toggleTheme(value),
            ),
          ),

          _divider(context),

          _buildSettingItem(
            context,
            icon: Icons.notifications_outlined,
            title: 'Thông báo',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),

          _divider(context),

          _buildSettingItem(
            context,
            icon: Icons.info_outline,
            title: 'Về ứng dụng',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'News App',
                applicationVersion: '1.0.0',
                applicationLegalese:
                    'Ứng dụng cập nhật tin tức thế hệ mới, mang đến dòng chảy thông tin nóng hổi và chính xác được tối ưu hóa theo thời gian thực. Với tốc độ truyền tải chớp nhoáng và giao diện hiện đại, ứng dụng giúp bạn bắt trọn mọi biến động của thế giới để luôn là người dẫn đầu xu hướng',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: const Color(0xFF015E53)),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing:
          trailing ??
          Icon(
            Icons.chevron_right,
            color: theme.iconTheme.color?.withOpacity(0.6),
          ),
      onTap: onTap,
    );
  }

  Widget _divider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Theme.of(context).dividerColor,
    );
  }
}
