import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/app_localization.dart';
import 'package:flutter_localization/cubit/locale_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr(context))),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: BlocListener<LocaleCubit, LocaleState>(
            listener: (context, state) {
              Navigator.of(context).pop();
            },
            child: BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                if (state is ChangeLocaleState) {
                  return DropdownButton<String>(
                    value: state.locale.languageCode,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: ['ar', 'en'].map((String items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        BlocProvider.of<LocaleCubit>(
                          context,
                        ).changeLanguage(newValue);
                      }
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
