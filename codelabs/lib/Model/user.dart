import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  User(this.name, this.email, this.registrationDateMillis);

  String name;
  String email;

  // 自定义命名
  // json 中的 registration_date_millis 对应着 Model 中的 registrationDateMillis
  @JsonKey(name: 'registration_date_millis')
  final int registrationDateMillis;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/**
 * 一次性生成
 * 
 * 在控制台输入  flutter packages pub run build_runner build
 * 会自动生成 user.g.dart
 */

/**
 * 持续生成
 * 
 * flutter packages pub run build_runner watch
 * 
 * 只需启动一次观察器，然后它就会在后台运行，这是安全的。
 * 它会监视我们项目中文件的变化，并在需要时自动构建必要的文件
 */