import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_spotify/data/data.dart';
// import 'package:flutter_spotify/widgets/searchBar.dart';
import 'package:flutter_spotify/widgets/searchCategoryCard.dart';
import 'package:flutter_spotify/widgets/title.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color.fromARGB(255, 22, 22, 22),
          elevation: 0,
          centerTitle: false,
          //toolbarHeight: screenHeight * 0.11,
          title: const Text(
            'Search',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          pinned: true,
          floating: true,
          snap: true,
          bottom: PreferredSize(
              preferredSize: Size(screenWidth, screenHeight * 0.07),
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.035,
                    right: screenWidth * 0.035,
                    bottom: screenHeight * 0.01),
                // child: const SearchBar(),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: CustomTitle(text: 'Browse All'),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: screenHeight * 0.12,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 200),
            itemBuilder: (context, index) {
              //var data = searchCategories[index];
              return Bounceable(
                onTap: () {},
                child: SearchCategoryCard(
                  imageUrl: searchCategories[index]['image'],
                  title: searchCategories[index]['title'],
                  color: searchCategories[index]['color'],
                ),
              );
            },
            itemCount: searchCategories.length,
          )
        ]))
      ],
    ));
  }
}
