import 'package:get/get.dart';
import 'package:yursayur/model/ad_banner.dart';
import 'package:yursayur/model/category.dart';
import 'package:yursayur/service/remote_service/remote_banner_service.dart';
import 'package:yursayur/service/remote_service/remote_popular_category_service.dart';

class HomeController extends GetxController {
  static HomeController intance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;

  @override
  void onInit() {
    getAdBanners();
    getPopularCategories();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

   void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
      }
    } finally {
      // print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }
}
