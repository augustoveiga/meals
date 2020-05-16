import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged,this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }
  
  Widget _creatSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Filters',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _creatSwitch(
                    'Sem Gluten',
                    'So exibe refeicoes sem gluten',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _creatSwitch(
                    'Sem Lactose',
                    'So exibe refeicoes sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _creatSwitch(
                    'Vegana',
                    'So exibe refeicoes vegana',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                  _creatSwitch(
                    'Vegetarianas',
                    'So exibe refeicoes vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
