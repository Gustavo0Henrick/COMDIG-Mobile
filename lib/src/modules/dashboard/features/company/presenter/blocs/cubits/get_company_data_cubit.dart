import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_company_data_usecase.dart';

import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_company_data_states.dart';

class GetCompanyDataCubit extends Cubit<GetCompanyDataStates> {
  final GetCompanyDataUsecase usecase;

  GetCompanyDataCubit({required this.usecase})
      : super(GetCompanyDataInitialState());

  Future<void> getCompanyData(String companyId) async {
    emit(GetCompanyDataLoadingState());

    var result = await usecase(companyId);

    result.fold(
      (Failure failure) => emit(GetCompanyDataErrorState(failure: failure)),
      (dynamic success) => emit(
        GetCompanyDataSuccessState(result: success),
      ),
    );
  }
}
