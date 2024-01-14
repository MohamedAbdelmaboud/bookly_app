import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utlis/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService = ApiService();
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var jsonData = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:Flutter&Sorting=newest');
      List data = jsonData['items'];
      List<BookModel> bookModels = List.generate(
          data.length, (index) => BookModel.fromJson(data[index]));
      return right(bookModels);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var jsonData = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List data = jsonData['items'];
      List<BookModel> bookModels = List.generate(
          data.length, (index) => BookModel.fromJson(data[index]));
      return right(bookModels);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks() async {
    try {
      var jsonData = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
      List data = jsonData['items'];
      List<BookModel> bookModels = List.generate(
          data.length, (index) => BookModel.fromJson(data[index]));
      return right(bookModels);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(
        errorMessage: e.toString(),
      ));
    }
  }
}
