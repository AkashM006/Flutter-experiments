import 'package:fpdart/fpdart.dart';
import 'package:sample/utils/classes/errors.dart';

Future<Either<String, T>> safeExecute<T>(Future<T> Function() callback) async {
  try {
    final result = await callback();
    return right(result);
  } catch (e) {
    final error = e as AppError;
    return left(error.message);
  }
}
