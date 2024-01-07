import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  final HomeRepo homeRepo;
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  Future fetchFeaturedBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fectchNewestBooks();
    //Future<Either<Failure, List<BookModel>>> result  = homeRepo.fectchNewestBooks();
    result.fold(
        (failure) =>
            emit(NewsetBooksFailure(errorMessage: failure.errorMessage)),
        (bookModels) => emit(NewsetBooksSuccess(bookModels: bookModels)));
  }
}
