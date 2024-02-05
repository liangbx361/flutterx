import 'package:hive/hive.dart';

part 'user_lm.g.dart';

@HiveType(typeId: 0)
class UserLm {
  @HiveField(0)
  int id;

  UserLm({
    required this.id,
  });
}
