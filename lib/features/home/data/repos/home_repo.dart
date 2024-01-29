import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';  // 

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks(); // no imp
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks(); // no imp
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(); // no imp
}
