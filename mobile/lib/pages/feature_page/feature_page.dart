// ignore_for_file: prefer_final_fields, camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mobile/pages/feature_page/components/list_title_comp.dart';
import 'package:mobile/pages/feature_page/components/play_list.dart';
import 'package:mobile/pages/feature_page/components/thumbnail.dart';
import 'package:mobile/themes/provide_theme.dart';
import 'package:mobile/widgets/contain_textfield.dart';
import 'package:mobile/themes/app_assets.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/widgets/custom_modal.dart';
import "package:flutter_svg/flutter_svg.dart";
import "package:mobile/configs/svg.dart";
import 'package:provider/provider.dart';

class featurePage extends StatefulWidget {
  const featurePage({Key? key}) : super(key: key);

  @override
  State<featurePage> createState() => _featureState();
}

class _featureState extends State<featurePage> {
  TextEditingController _searchController = TextEditingController();
  bool isSearchOpen = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkTheme
          ? AppColor.primaryBackground
          : AppColor.whiteText2Color,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              isSearchOpen = !isSearchOpen;
            });
          },
        ),
        title: isSearchOpen
            ? Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    color: AppColor.activeTextColor,
                    child: CustomTextFieldOutline(
                      label: 'Search...',
                      controller: _searchController,
                    )),
              )
            : Center(child: Image.asset(AppAssets.SpotifyLogo)),
        backgroundColor: AppColor.primaryBackground,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalFromRight(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ThumbnailComponents(),
            listTitleComponent(),
            playListComponents(),
          ],
        ),
      ),
    );
  }
}
