import 'package:dio/dio.dart';

class Network {
  static getApi() async {
    final dio = Dio();
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/editorial/api/articles/browse?PageNumber=1&PageSize=38&Sort=Newest'
        );
        return response;

  }
    static getComment() async {
    final dio = Dio();
    Response response;
    response = await dio.get(
        'https://api2.zoomit.ir/discussion/api/feedbacks?topicId=402115&topicType=Article&sortBy=MostLike&offset=1&size=10&commentDepthLevel=5');
    return response;
  }
}
