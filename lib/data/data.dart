import 'package:todo_pro/models/item_model.dart';
import 'package:todo_pro/models/onboarding_model.dart';

List<String> getSVGs() {
  const String projectSVG00 = 'assets/images/bullseye.svg';
  const String projectSVG01 = 'assets/images/diagonal-stripes.svg';
  const String projectSVG02 = 'assets/images/diamond-sunset.svg';
  const String projectSVG03 = 'assets/images/endless-constellation.svg';
  const String projectSVG04 = 'assets/images/geometric-intersection.svg';
  const String projectSVG05 = 'assets/images/hollowed-boxes.svg';
  const String projectSVG06 = 'assets/images/liquid-cheese.svg';
  const String projectSVG07 = 'assets/images/protruding-squares.svg';
  const String projectSVG08 = 'assets/images/wavey-fingerprint.svg';
  const String projectSVG09 = 'assets/images/wintery-sunburst.svg';
  const String projectSVG10 = 'assets/images/zig-zag.svg';

  const List<String> allSVGs = [
    projectSVG00,
    projectSVG01,
    projectSVG02,
    projectSVG03,
    projectSVG04,
    projectSVG05,
    projectSVG06,
    projectSVG07,
    projectSVG08,
    projectSVG09,
    projectSVG10,
  ];

  return allSVGs;
}

List<OnboardingModel> getOnboardingData() {
  List<OnboardingModel> onboardingData = [
    OnboardingModel(
      title: "Welcome to ToDoPro",
      subTitle: "Manage your tasks with ease and stay productive.",
    ),
    OnboardingModel(
      title: "Create Projects",
      subTitle:
          "Organize your work by creating projects for anything you want.",
    ),
    OnboardingModel(
      title: "Add Items",
      subTitle: "Each project can have items, so you never miss a detail.",
    ),
    OnboardingModel(
      title: "Stay Organized",
      subTitle: "Track your progress and crush your goals with ToDoPro.",
    ),
  ];
  return onboardingData;
}

List<ItemModel> getItemsData() {
  List<ItemModel> items = [
    ItemModel(
      projTitle: "Work Project",
      itemTitle: "Design UI",
      itemDescription: "Complete the home screen design",
      itemDate: DateTime.now().add(const Duration(days: 2)),
    ),
    ItemModel(
      projTitle: "Work Project",
      itemTitle: "Fix Bugs",
      itemDescription: "Resolve critical app crashes",
      itemDate: DateTime.now().add(const Duration(days: 4)),
      isDone: true,
    ),
    ItemModel(
      projTitle: "Work Project",
      itemTitle: "API Integration",
      itemDescription: "Connect backend services",
      itemDate: DateTime.now().add(const Duration(days: 1)),
    ),
  ];
  return items;
}
