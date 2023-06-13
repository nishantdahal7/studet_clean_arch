import 'package:studet_clean_arch/features/batch/Domain/entity/batch_entity.dart';
import 'package:studet_clean_arch/features/course/Domain/entity/course_entity.dart';

class StudentEntity {
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final BatchEntity? batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  StudentEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    this.batch,
    required this.courses,
    required this.username,
    required this.password,
  });
}
