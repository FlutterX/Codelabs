import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

/**
 * PathProvider
 * 
 * 临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 
 *          系统可随时清除的临时目录（缓存）。在iOS上，这对应于NSTemporaryDirectory() 返回的值。
 *          在Android上，这是getCacheDir())返回的值。
 * 文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，
 *          该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。
 *          在iOS上，这对应于NSDocumentDirectory。在Android上，这是AppData目录。
 * 外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如SD卡；
 *            由于iOS不支持外部目录，所以在iOS下调用该方法会抛出UnsupportedError异常，
 *            而在Android下结果是android SDK中getExternalStorageDirectory的返回值。
 */
class FileOperationPage extends StatefulWidget {
  FileOperationPage({Key key}): super(key: key);

  @override
    _FileOperationPageState createState() => _FileOperationPageState();
}

class _FileOperationPageState extends State<FileOperationPage> {
  int _counter;

  @override
    void initState() {
      super.initState();
      // 从文件读取点击次数
      _readCounter().then((int value) {
        setState(() {
          _counter = value;
        });
      });
    }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    //print("dir -- $dir");
    return new File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
     File file = await _getLocalFile();
     // 读取点击次数（字符串） 
     String countents = await file.readAsString();
     return int.parse(countents) ?? 0;
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('FileOperation'),
        ),
        body: Center(
          child: Text('点击了 $_counter 次'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    }
}