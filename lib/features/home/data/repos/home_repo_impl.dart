import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utlis/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  ApiService apiService = ApiService();
  @override
  Future<Either<Failure, List<BookModel>>> fectchNewestBooks() async {
    try {
      var jsonData = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest');
      List data = jsonData['items'];
      List<BookModel> bookModels = List.generate(
          data.length, (index) => BookModel.fromJson(data[index]));
      return right(bookModels);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var jsonData = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List data = jsonData['items'];
      List<BookModel> bookModels =
          List.generate(data.length, (index) => data[index]);
      return right(bookModels);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(
        errorMessage: e.toString(),
      ));                                                                        
    }
  }
}
