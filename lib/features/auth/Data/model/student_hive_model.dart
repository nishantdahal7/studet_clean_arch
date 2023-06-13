import 'package:hive/hive.dart';
import 'package:studet_clean_arch/config/constants/hive_table_constant.dart';
import 'package:studet_clean_arch/features/auth/Domain/entity/student_entity.dart';
import 'package:studet_clean_arch/features/batch/Data/model/batch_hive_model.dart';
import 'package:studet_clean_arch/features/course/Data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

// dart run build_runner build --delete-conflicting-outputs
part 'student_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class StudentHiveModel {
  // HiveObject is a mixin that provides the ability to use Hive objects as keys
  // Which helps in serialization and deserialization
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? fname;

  @HiveField(2)
  final String? lname;

  @HiveField(3)
  final BatchHiveModel? batch;

  @HiveField(4)
  final List<CourseHiveModel>? course;

  @HiveField(5)
  final String? phone;

  @HiveField(6)
  final String? username;

  @HiveField(7)
  final String? password;

  //empty constructor
  StudentHiveModel.empty()
      : this(
          id: "",
          fname: "",
          lname: "",
          batch: BatchHiveModel.empty(),
          course: [],
          phone: "",
          username: "",
          password: "",
        );

  StudentHiveModel({
    String? id,
    this.fname,
    this.lname,
    this.batch,
    this.course = const [],
    this.phone,
    this.username,
    this.password,
  }) : id = id ?? const Uuid().v4();

  //Convert hive Object to Entity
  StudentEntity toEntiry() => StudentEntity(
        fname: fname!,
        lname: lname!,
        phone: phone!,
        batch: BatchHiveModel.empty().toEntity(),
        courses: CourseHiveModel.empty().toEntityList(course!),
        username: username!,
        password: password!,
      );

  //Convert entity to hive object
  StudentHiveModel toHiveModel(StudentEntity entity) => StudentHiveModel(
        fname: entity.fname,
        lname: entity.lname,
        phone: entity.phone,
        batch: BatchHiveModel.empty().toHiveModel(entity.batch!),
        course: CourseHiveModel.empty().toHiveModelList(entity.courses),
        username: entity.username,
        password: entity.password,
      );

  //Convert Entity List to Hive List
  List<StudentHiveModel> toHiveModelList(List<StudentEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();
  @override
  String toString() {
    return 'Student(id: $id, fname: $fname, lname: $lname, batch: $batch, course: $course, phone: $phone, username: $username, password: $password)';
  }
}
