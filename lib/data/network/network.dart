import 'package:dio/dio.dart';
import 'package:zoomit_bloc/theme/constant.dart';

class Network {
  //! آخرین مطالب
  static getApi() async {
    Response response;
    response = await dio.get(
      'https://api2.zoomit.ir/editorial/api/articles/browse?PageNumber=1&PageSize=38&Sort=Newest',
    );
    return response;
  }

  //!راهنمای خرید
  static getBuyGuideApi() async {
    Response response;
    response = await dio.get(
      'https://api2.zoomit.ir/forgecomposer/api/chips/63aae00cce1ac9b6819781e5?page=home',
    );
    return response;
  }

  //! پربازدیدترین های روز
  static getMostVisitedDayApi() async {
    Response response;
    response = await dio.get(
      'https://api2.zoomit.ir/editorial/api/articles/browse?PageNumber=1&PageSize=30&PublishDate=Last24Hours&Sort=MostPopular',
    );
    return response;
  }

  //! محبوب ترین ها
  static getMostVisitedMonthApi() async {
    Response response;
    response = await dio.get(
      'https://api2.zoomit.ir/forgecomposer/api/chips/6381eca1634194c22bb64348?page=home',
    );
    return response;
  }
}
