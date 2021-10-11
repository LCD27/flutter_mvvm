// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
//
// ///是否需要弹提示
// const NOT_TIP_KEY = "noTip";
//
// /**
//  * 错误拦截
//  * Created by guoshuyu
//  * on 2019/3/23.
//  */
// class ErrorInterceptors extends InterceptorsWrapper {
//   final Dio _dio;
//
//   ErrorInterceptors(this._dio);
//
//   @override
//   onRequest(RequestOptions options, handler) async {
//     //没有网络
//     var connectivityResult = awaitConnectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       return handler.reject(DioError(
//           requestOptions: options,
//           type: DioErrorType.other,
//           response: Response(
//               requestOptions: options,
//               data: new ResultData(
//                   Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
//                   false,
//                   Code.NETWORK_ERROR))));
//     }
//     return super.onRequest(options, handler);
//   }
// }
