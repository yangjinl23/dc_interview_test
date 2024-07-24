import 'package:dc_interview_test/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../model/language_model.dart';
import '../../../../request/api_request.dart';
import '../../../../utils/color.dart';
import '../views/components/custom_progress_indicator.dart';
import '../views/components/error_placeholder.dart';
import '../views/components/no_result_placeholder.dart';
import '../views/home_view.dart';

class HomeController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();

  ///search box entered value
  final searchText = 'Languages'.obs;

  ///search tag
  final selectedCategory = 'Languages'.obs;
  final isSelected = false.obs;

  /// http request variable
  final ApiService apiService = ApiService();

  final languages = <LanguageModel>[].obs;
  final isLoading = false.obs;
  final isErrorState = false.obs;

  /// Method to determine the current UI state
  Widget getCurrentState() {
    if (isLoading.value) {
      return const Center(
        child: CustomCircularProgressIndicator(
          backgroundColor: MyColor.grayBorderColor,
          progressColor: MyColor.primaryColor,
          strokeWidth: 8.0,
        ),
      );
    } else if (isErrorState.value) {
      return const ErrorPlaceholder();
    } else if (languages.isEmpty) {
      return const NoResultPlaceholder();
    } else {
      return const SearchResultList();
    }
  }

  /// check if the tag button is selected
  bool isCategorySelected(String category) {
    return selectedCategory.value == category;
  }

  /// check if the input search text field value is
  /// matching the tag button
  bool isCategoryMatching(String text) {
    const categories = ['Languages', 'Build', 'Design', 'Cloud'];
    return categories.contains(text);
  }

  /// manage the search text field value event
  void onChangeSearchText(String text) {
    searchText.value = text;
    HiLog.d('current search text value is ${searchText.value}');

    if (!isCategoryMatching(text)) {
      /// unselected all the tag button
      selectedCategory.value = '';
    } else {
      HiLog.d('current changed value is ${selectedCategory.value}');
      selectedCategory.value = text;
    }
  }

  /// clicking the tag button invokes the following action
  void onCategoryClicked(String category) {
    selectedCategory.value = category;
    searchTextController.text = category;
    searchText.value = category;
    HiLog.d("current selected category is $category");
    fetchLanguages(category);
  }

  /// search box clear button action
  void onClearSearchText() {
    searchTextController.clear();
    onChangeSearchText('Languages');
    fetchLanguages('Languages');
  }

  ///http request methods
  Future<void> fetchLanguages(String category) async {
    isLoading.value = true;

    try {
      HiLog.d("requested key word is  ${searchText.value}");
      final result = await apiService.fetchLanguages(searchText.value,
          noThrottling: !isErrorState.value);

      languages.value = result;
      HiLog.d("assigned result is  $languages");
      isErrorState.value = false;
      HiLog.d("success $result");
    } catch (e) {
      HiLog.d("error occured");
      isErrorState.value = true;
    } finally {
      HiLog.d("loading finished");
      isLoading.value = false;
    }
  }

  Future<void> launchURL(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void onInit() {
    searchTextController.text = searchText.value;
    fetchLanguages(searchText.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
