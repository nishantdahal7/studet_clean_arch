import 'package:hive/hive.dart';
import 'package:studet_clean_arch/config/constants/hive_table_constant.dart';
import 'package:studet_clean_arch/features/course/Domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

part 'course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String courseId;

  @HiveField(1)
  final String courseName;

  CourseHiveModel.empty()
      : this(
          courseId: '',
          courseName: '',
        );

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  //Convert hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  //Convert Entity to Hive Object
  CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
        courseId: entity.courseId,
        courseName: entity.courseName,
      );

  //Convert Hive List to Entity List
  List<CourseHiveModel> toHiveModelList(List<CourseEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'CourseModel(courseId: $courseId, courseName: $courseName)';
  }
}
