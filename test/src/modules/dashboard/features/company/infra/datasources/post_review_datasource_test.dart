import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/post_review_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/post_review_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AppRequesterMock extends Mock implements IAppRequester {}

main() {
  late IAppRequester requester;
  late PostReviewDatasource datasource;

  setUp(() {
    requester = AppRequesterMock();
    datasource = PostReviewDatasource(requester: requester);
  });

  DateTime date = DateTime.now();

  PostReviewModel postReviewModel = const PostReviewModel(
    userId: "userId",
    name: "name",
    description: "description",
    rating: 5,
    image: "image",
    companyId: "companyId",
  );

  test("Should call the PostReview with correct Method", () async {
    when(() async => await requester.post(
          url: any(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {
            "rating": 5,
            "totalReviews": 1,
            "reviews": [
              {
                "id": "id",
                "name": "name",
                "description": "description",
                "rating": 5,
                "image": "image",
                "createdAt": date.toUtc().toIso8601String(),
              }
            ],
          },
          statusCode: 200,
          requestOptions: RequestOptions(data: "id"),
        ));

    await datasource.postReview(postReviewModel);
  });

  test("Should return a Success Message when is successful", () async {
    when(() async => await requester.post(
          url: any(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {""},
          statusCode: 200,
          requestOptions: RequestOptions(data: {""}),
        ));

    dynamic listEventModelsExpected = {""};

    Response response = await datasource.postReview(postReviewModel);

    String result = response.data;
    expect(result, listEventModelsExpected);
  });

  test("Should throw a BadRequestException when the the request is invalid",
      () async {
    var message = "BadRequest Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "BadRequest Error"},
          statusCode: 400,
          requestOptions: RequestOptions(
            data: {"message": "BadRequest Error"},
          ),
        ));

    final result = datasource.postReview(postReviewModel);

    expect(
      () => result,
      throwsA(
        BadRequestException(message: message, statusCode: 400),
      ),
    );
  });

  test("Should throw a ServerException when the server unavaliable", () async {
    var message = "Server Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Server Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Server Error"},
          ),
        ));

    final result = datasource.postReview(postReviewModel);

    expect(
      () => result,
      throwsA(
        ServerException(message: message, statusCode: 500),
      ),
    );
  });

  test("Should throw a RequestException when the Request unavaliable",
      () async {
    var message = "Request Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Request Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Request Error"},
          ),
        ));

    final result = datasource.postReview(postReviewModel);

    expect(
      () => result,
      throwsA(
        RequestException(message: message, statusCode: 500),
      ),
    );
  });

  test("Should throw a GeneralException when get a Excpetion", () async {
    var message = "General Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "General Error"},
          statusCode: 000,
          requestOptions: RequestOptions(
            data: {"message": "General Error"},
          ),
        ));

    final result = datasource.postReview(postReviewModel);

    expect(
      () => result,
      throwsA(
        GeneralException(message: message, statusCode: 000),
      ),
    );
  });

  test("Should throw a UnauthorizedException when the credentials are invalids",
      () async {
    var message = "Unauthorized Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Unauthorized Error"},
          statusCode: 403,
          requestOptions: RequestOptions(
            data: {"message": "Unauthorized Error"},
          ),
        ));

    final result = datasource.postReview(postReviewModel);

    expect(
      () => result,
      throwsA(
        UnauthorizedException(message: message, statusCode: 403),
      ),
    );
  });
}
