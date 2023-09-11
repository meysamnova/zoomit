import 'package:dio/dio.dart';
import 'package:zoomit_bloc/constant.dart';

class Network {
  //! آخرین مطالب
  static getApi() async {
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/articles/browse?PageNumber=1&PageSize=38&Sort=Newest');
    return response;
  }

  //!راهنمای خرید
  static getBuyGuideApi() async {
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/chips/6381c78b634194c22bb6433e?v=25&moduleId=6381ed7d634194c22bb6434f');
    return response;
  }

  //! پربازدیدترین های روز
  static getMostVisitedDayApi() async {
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/articles/browse?PageNumber=1&PageSize=30&PublishDate=Last24Hours&Sort=MostPopular');
    return response;
  }

  //! پربازدیدترین های ماه
  static getMostVisitedMonthApi() async {
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/chips/6381ec88634194c22bb64345?v=25&moduleId=6381ee2c634194c22bb64355');
    return response;
  }
}
