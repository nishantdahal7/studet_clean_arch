import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studet_clean_arch/features/auth/Data/model/student_hive_model.dart';
import 'package:studet_clean_arch/features/batch/Data/model/batch_hive_model.dart';
import 'package:studet_clean_arch/features/course/Data/model/course_hive_model.dart';

import '../../config/constants/hive_table_constant.dart';

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(StudentHiveModelAdapter());
    Hive.registerAdapter(BatchHiveModelAdapter());
    Hive.registerAdapter(CourseHiveModelAdapter());

    await addDummyCourse();
    await addDummyBatch();
  }

  //BATCH QUERIES

  Future<void> addBatch(BatchHiveModel batch) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.put(batch.batchId, batch);
    box.close();
  }

  Future<List<BatchHiveModel>> getAllBatches() async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    var batches = box.values.toList();
    box.close();
    return batches;
  }

  //----------CLOSE QUERIES ------------

  Future<void> addCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    await box.put(course.courseId, course);
    box.close();
  }

  Future<List<CourseHiveModel>> getAllCourses() async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    var courses = box.values.toList();
    box.close();
    return courses;
  }

  //----------STUDENT QUERIES ------------
  Future<void> addStudent(StudentHiveModel student) async {
    var box = await Hive.openBox<StudentHiveModel>(HiveTableConstant.studetBox);
    await box.put(student.id, student);
    box.close();
  }

  Future<List<StudentHiveModel>> getAllStudents() async {
    var box = await Hive.openBox<StudentHiveModel>(HiveTableConstant.studetBox);
    var students = box.values.toList();
    box.close();
    return students;
  }

  //-------------------INSERT DUMMY DATA--------------
  //BACTH DUMMY DATA
  Future<void> addDummyBatch() async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    if (box.isEmpty) {
      final batch1 = BatchHiveModel(
        batchName: '29-A',
      );
      final batch2 = BatchHiveModel(
        batchName: '30-A',
      );
      final batch3 = BatchHiveModel(
        batchName: '30-B',
      );
      List<BatchHiveModel> batches = [batch1, batch2, batch3];

      for (var batch in batches) {
        await box.put(batch.batchId, batch);
      }
    }
  }

  // ----------course dummy data
  Future<void> addDummyCourse() async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    if (box.isEmpty) {
      final course1 = CourseHiveModel(
        courseName: 'Flutter',
      );
      final course2 = CourseHiveModel(
        courseName: 'Android',
      );
      final course3 = CourseHiveModel(
        courseName: 'IOS',
      );
      List<CourseHiveModel> courses = [course1, course2, course3];

      for (var course in courses) {
        await box.put(course.courseId, course);
      }
    }
  }
}
