import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/entities/home_ad_entity.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/usecases/get_home_ads_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_home_ads_states.dart';

class GetHomeAdsCubit extends Cubit<GetHomeAdsStates> {
  final GetHomeAdsUsecase usecase;

  GetHomeAdsCubit({required this.usecase}) : super(GetHomeAdsInitialState());

  Future<void> getHomeAds() async {
    emit(GetHomeAdsLoadingState());

    final result = await usecase(NoParams());

    result.fold(
      (Failure failure) => emit(GetHomeAdsErrorState(failure: failure)),
      (List<HomeAdEntity> success) =>
          emit(GetHomeAdsSuccessState(result: success)),
    );
  }
}
