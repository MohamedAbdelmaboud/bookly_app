import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewestBooksCubit extends Cubit<NewsetBooksState> {
  final HomeRepo homeRepo;
  NewestBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  Future fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    //Future<Either<Failure, List<BookModel>>> result  = homeRepo.fectchNewestBooks();
    result.fold(
        (failure) =>
            emit(NewsetBooksFailure(errorMessage: failure.errorMessage)),
        (bookModels) => emit(NewsetBooksSuccess(bookModels: bookModels)));
  }
}
