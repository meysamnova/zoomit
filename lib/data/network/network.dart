import 'package:dio/dio.dart';

class Network {
  //! آخرین مطالب
  static getApi() async {
    final dio = Dio();
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/articles/browse?PageNumber=1&PageSize=38&Sort=Newest');
    return response;
  }

  //! کامنت
  static getComment() async {
    final dio = Dio();
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/discussion/api/feedbacks?topicId=402115&topicType=Article&sortBy=MostLike&offset=1&size=10&commentDepthLevel=5');
    return response;
  }

  //!راهنمای خرید
  static getBuyGuideApi() async {
    final dio = Dio();
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/chips/6381c78b634194c22bb6433e?v=25&moduleId=6381ed7d634194c22bb6434f');
    return response;
  }

  //!آموزش های کاربردی
  static getMostVisitedMonthApi() async {
    final dio = Dio();
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/chips/6381ec88634194c22bb64345?v=25&moduleId=6381ee2c634194c22bb64355');
    return response;
  }
}
