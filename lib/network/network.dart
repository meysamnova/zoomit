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
}
