import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'newst_books_state.dart';



class NewstBooksCubit extends Cubit<NewstBooksState> {
  final HomeRepo homeRepo;
  NewstBooksCubit(this.homeRepo) : super(NewstBooksInitial());
  fetchNewstBooks() async{
    emit(NewstBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((ifLeft){
      emit(NewstBooksFaliures(ifLeft.errMessage));

    }, (books){
      emit(NewstBooksSuccess(books));
    });
  }
}
