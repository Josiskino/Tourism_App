import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories(TemplateParams params);
}