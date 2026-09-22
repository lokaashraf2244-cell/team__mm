import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/core/cubit/theme/theme_cubit.dart';
import 'package:mm_2/core/cubit/theme/theme_state.dart';
import 'package:mm_2/features/auth/presentation/screens/loginscreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Theme.of(context).dividerColor,
            height: 1,
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 30,
              bottom: 20,
            ),
            child: Text(
              'Profile Settings',
              style: TextStyle(
                color:  const Color(0xFF0B1F3A),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildSettingItem(
            context,
            title: 'Edit Profile',
          ),

          _buildSettingItem(
            context,
            title: 'Change Password',
          ),

          _buildSwitchItem(
            context,
            title: 'Send Push Notifications',
            value: true,
            onChanged: (value) {},
          ),

          _buildSwitchItem(
            context,
            title: 'Refresh automatically',
            value: false,
            onChanged: (value) {},
          ),

          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return _buildSwitchItem(
                context,
                title: 'Dark Mode',
                value: state.isDark,
                onChanged: (value) {
                  context.read<ThemeCubit>().switchtheme();
                },
              );
            },
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const loginscreen(),
                    ),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
      BuildContext context, {
        required String title,
      }) {
    return Container(
      width: double.infinity,
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildSwitchItem(
      BuildContext context, {
        required String title,
        required bool value,
        required ValueChanged<bool> onChanged,
      }) {
    return Container(
      width: double.infinity,
      height: 68,
      padding: const EdgeInsets.only(left: 25, right: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}