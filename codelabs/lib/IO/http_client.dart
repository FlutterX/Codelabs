import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

/**
 * HttpClient配置
 * 
 * idleTimeout	对应请求头中的keep-alive字段值，为了避免频繁建立连接，httpClient在请求结束后会保持连接一段时间，超过这个阈值后才会关闭连接。
 * connectionTimeout	和服务器建立连接的超时，如果超过这个值则会抛出SocketException异常。
 * maxConnectionsPerHost	同一个host，同时允许建立连接的最大数量。
 * autoUncompress	对应请求头中的Content-Encoding，如果设置为true，则请求头中Content-Encoding的值为当前HttpClient支持的压缩算法列表，目前只有"gzip"
 * userAgent	对应请求头中的User-Agent字段。
 * 
 * 有些属性只是为了更方便的设置请求头，对于这些属性，
 * 你完全可以通过HttpClientRequest直接设置header，
 * 不同的是通过HttpClient设置的对整个httpClient都生效，
 * 而通过HttpClientRequest设置的只对当前请求生效。
 */
class HttpClientPage extends StatefulWidget {
  @override
  _HttpClientPageState createState() => _HttpClientPageState();
}

class _HttpClientPageState extends State<HttpClientPage> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpClient'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('获取百度首页'),
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() {
                          _loading = true;
                          _text = "正在请求";
                        });
                        try {
                          // 创建一个HttpClient
                          HttpClient httpClient = new HttpClient();
                          // 打开Http连接
                          HttpClientRequest request = await httpClient
                              .getUrl(Uri.parse('https://www.baidu.com'));
                          // 使用iPhone的UA
                          request.headers.add('user-agent',
                              "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                          // 等待连接服务器（会将请求信息发送给服务器）
                          HttpClientResponse response = await request.close();
                          // 读取响应内容
                          _text = await response.transform(utf8.decoder).join();
                          // 输出响应头
                          print(response.headers);
                          // 关闭client后，通过该client发起的所有请求都会中止。
                          httpClient.close();
                        } catch (e) {
                          _text = "请求失败：$e";
                        } finally {
                          setState(() {
                            _loading = false;
                          });
                        }
                      },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
