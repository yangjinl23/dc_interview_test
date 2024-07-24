import 'package:dc_interview_test/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color.dart';
import '../controllers/home_controller.dart';
import 'components/search_result_item.dart';
import 'components/tag_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: controller.isErrorState.value
              ? MyColor.errorColor
              : MyColor.primaryColor,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                color: controller.isErrorState.value
                    ? MyColor.errorColor
                    : MyColor.primaryColor,
                padding: EdgeInsets.all(16.px),
                child: Column(
                  children: [
                    SizedBox(height: 35.pt),
                    SearchBox(),
                    SizedBox(height: 16.pt),
                    TagRow(),
                  ],
                ),
              ),
              SearchResult(),
            ],
          ),
        ));
  }
}

class SearchResult extends GetView<HomeController> {
  const SearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: Colors.white,
              child: controller.getCurrentState(),
            ),
          ),
        ));
  }
}

class SearchResultList extends GetView<HomeController> {
  const SearchResultList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: controller.isErrorState.value ||
          controller.isLoading.value ||
          controller.languages.isEmpty,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 25.px,
          vertical: 25.px,
        ),
        itemCount: controller.languages.length + 1,
        itemBuilder: (context, index) {
          if (index == controller.languages.length) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  '${controller.languages.length} Items.',
                  style: TextStyle(
                    fontSize: 16.px,
                    color: MyColor.grayTextColor,
                  ),
                ),
              ),
            );
          }
          return SearchResultItem(
            language: controller.languages[index],
          );
        },
        separatorBuilder: (context, index) {
          if (index == controller.languages.length - 1) {
            return const SizedBox.shrink();
          }
          return Divider(
            color: MyColor.grayBorderColor,
            thickness: 1.px,
          );
        },
      ),
    );
  }
}

class SearchBox extends GetView<HomeController> {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.searchTextController,
      onChanged: controller.onChangeSearchText,
      onSubmitted: controller.fetchLanguages,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColor.grayColor,
        hintText: 'Search...',
        hintStyle: TextStyle(
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
          color: MyColor.grayTextColor,
        ),
        prefixIcon: IconButton(
          icon: Image.asset(
            "images/search_icon.png",
            width: 24.px,
            height: 24.px,
          ),
          onPressed: () {},
        ),
        suffixIcon: controller.searchTextController.text.isEmpty
            ? null
            : IconButton(
                icon: Image.asset(
                  "images/close_icon.png",
                  width: 12.px,
                  height: 12.px,
                ),
                onPressed: () {
                  controller.onClearSearchText();
                },
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

class TagRow extends StatelessWidget {
  const TagRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TagButton(
            category: 'Languages',
          ),
          TagButton(
            category: 'Build',
          ),
          TagButton(
            category: 'Design',
          ),
          TagButton(
            category: 'Cloud',
          ),
        ],
      ),
    );
  }
}
