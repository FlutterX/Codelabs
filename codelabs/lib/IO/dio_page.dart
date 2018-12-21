import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';

void main() async {
  Dio dio = Dio();

  // get
  Response resp1 = await dio.get('/text?id=12&name=lxf');
  Response resp2 = await dio.get('/text', data: {"id":"12", "name":"lxf"});

  // post
  Response resp3 = await dio.post('/test', data:{"id":"12", "name":"lxf"});
  
  // 发起多个并发请求
  List<Response> resps = await Future.wait([dio.post('/info'), dio.get('/token')]);

  // 下载文件
  Response resp4 = await dio.download('https://www.google.com', "");

  // 发起 FormData
  // 如果发送的数据是FormData，则dio会将请求header的contentType设为“multipart/form-data”。
  FormData formData = FormData.from({
    "name":"lxf",
    "age":23
  });
  Response resp5 = await dio.post('/info', data: formData);

  
  FormData.from({
    "name" : "lxf",
    "age" : 23,
    "file1" : new UploadFileInfo(new File('./upload.txt'), 'upload1.txt'),
    "file2" : new UploadFileInfo(new File('./upload.txt'), 'upload2.txt'),
    // 支持文件数组上传
    "files" : [
      new UploadFileInfo(new File('./upload.txt'), 'upload1.txt'),
      new UploadFileInfo(new File('./upload.txt'), 'upload2.txt'),
    ]
  });
  Response resp6 = await dio.post('/info', data: formData);
  
  print(resp1.data.toString());

  // dio内部仍然使用HttpClient发起的请求，所以代理、请求认证、证书校验等和HttpClient是相同的，可以在onHttpClientCreate回调中设置
  dio.onHttpClientCreate = (HttpClient httpClient) {
    // 设置代理
    httpClient.findProxy = (uri) {
      return "PROXY 127.0.0.1:1086";
    };
    // 校验证书
    // httpClient.badCertificateCallback = (X509Certificate cert, String host, int port){
    //   if (cert.pem == PEM) {
    //     return true; // 证书一致，则允许发送数据
    //   }
    //   return false;
    // };
  };
}

