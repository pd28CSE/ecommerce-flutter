import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../utility/image_assets.dart';
import '../widgets/home/categories.dart';
import '../widgets/home/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/product.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          ImageAssets.craftBayNavSVG,
          width: 120,
        ),
        actions: <Widget>[
          CircularIconButton(
            onTap: () {},
            icon: Icons.person_2_outlined,
          ),
          const SizedBox(width: 5),
          CircularIconButton(
            onTap: () {},
            icon: Icons.call,
          ),
          const SizedBox(width: 5),
          CircularIconButton(
            onTap: () {},
            icon: Icons.notifications_active,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HomeSlider(),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'All Categories',
                onTap: () {},
                theme: theme,
              ),
              const SizedBox(height: 10),
              Categories(theme: theme),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Popular',
                onTap: () {},
                theme: theme,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (cntxt, index) {
                    return Product(theme: theme);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Special',
                onTap: () {},
                theme: theme,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (cntxt, index) {
                    return Product(theme: theme);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'New',
                onTap: () {},
                theme: theme,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (cntxt, index) {
                    return Product(theme: theme);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
