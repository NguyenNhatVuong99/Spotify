import 'package:flutter/material.dart';
import 'package:mobile/configs/svg.dart';
import 'package:mobile/services/getTracks.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionsListComponent extends StatefulWidget {
  const OptionsListComponent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OptionsListState createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsListComponent>
    with SingleTickerProviderStateMixin {
  List tracks = [];

  @override
  void initState() {
    super.initState();
    fetchTracks().then((data) => {
          setState(() {
            tracks = data;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            for (var track in tracks)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColor.favListBackground),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${track['album']['artist']['images']}"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  track['name'],
                                  style: AppTextStyle.artistName,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppSVG.heart),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
