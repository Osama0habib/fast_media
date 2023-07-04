import 'package:fast_media/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/widgets/setting_row_button.dart';
import 'package:fast_media/syles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthenticationBloc>().currentUser;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: kBackgroundGrediant,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(children: [
                const SizedBox(
                  height: 46.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).size.width * 0.21,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundImage: NetworkImage(
                      currentUser?.imageUrl ??
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    currentUser?.displayName ?? 'Ahmed Hamdi',
                    style: AppStyles.heading_2,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),

                //edit Profile
                const SettingRowButton(
                  prefix: Icon(Icons.person_outline_sharp),
                  suffix: Icon(
                    Icons.arrow_forward_ios,
                    color: kSeconderyColor,
                    size: 16,
                  ),
                  title: 'Edit Profile',
                ),
                const SettingRowButton(
                  prefix: Icon(Icons.notifications_none_rounded),
                  suffix: Icon(
                    Icons.arrow_forward_ios,
                    color: kSeconderyColor,
                    size: 16,
                  ),
                  title: 'Notifications',
                ),
                const SettingRowButton(
                  prefix: Icon(Icons.file_download_outlined),
                  suffix: Icon(
                    Icons.arrow_forward_ios,
                    color: kSeconderyColor,
                    size: 16,
                  ),
                  title: 'Downloads',
                ),
                const SettingRowButton(
                  prefix: Icon(Icons.language),
                  suffix: Icon(
                    Icons.arrow_forward_ios,
                    color: kSeconderyColor,
                    size: 16,
                  ),
                  title: 'language',
                ),
                const SettingRowButton(
                  prefix: Icon(Icons.headset_mic_outlined),
                  suffix: Icon(
                    Icons.arrow_forward_ios,
                    color: kSeconderyColor,
                    size: 16,
                  ),
                  title: 'Help',
                ),
                SettingRowButton(
                  prefix: const Icon(Icons.dark_mode_outlined),
                  suffix: SizedBox(
                    height: 18,
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeTrackColor: kSeconderyColor,
                      activeColor: Colors.white,
                    ),
                  ),
                  title: 'Dark mode',
                ),
                 SettingRowButton(
                  onTap: (){ context.read<AuthenticationBloc>().add(AuthenticationSignedOut());},
                  prefix: const Icon(Icons.logout_outlined),
                  suffix: const Icon(
                    Icons.arrow_forward_ios,
                    color: kSeconderyColor,
                    size: 16,
                  ),
                  title: 'Log Out',
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
