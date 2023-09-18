import 'package:dartz/dartz.dart';
import 'package:my_gym_app_v2/core/errors/failure.dart';

// Define a new type with failure or T(Generic type)
typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
