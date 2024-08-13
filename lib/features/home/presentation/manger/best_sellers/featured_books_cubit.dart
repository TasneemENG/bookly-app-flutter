import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  fetchFeaturedBooks ()async{
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((ifLeft) {
      emit(FeaturedBooksFailure(ifLeft.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
