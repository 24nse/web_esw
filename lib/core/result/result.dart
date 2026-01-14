/// Result type for handling success and failure states
/// 
/// This sealed class provides a type-safe way to handle operations that can fail.
/// It eliminates the need for try-catch blocks and makes error handling explicit.
/// 
/// Benefits:
/// - Type Safety: Compiler ensures all cases are handled
/// - Explicit Error Handling: No hidden exceptions
/// - Functional Programming: Enables railway-oriented programming
/// - Clean Code: Clear success/failure paths
/// 
/// Usage:
/// ```dart
/// Future<Result<User>> getUser(String id) async {
///   try {
///     final user = await api.fetchUser(id);
///     return Success(user);
///   } catch (e) {
///     return Failure('Failed to fetch user', e as Exception);
///   }
/// }
/// 
/// // Using the result
/// final result = await getUser('123');
/// result.when(
///   success: (user) => print('Got user: ${user.name}'),
///   failure: (message) => print('Error: $message'),
/// );
/// ```
sealed class Result<T> {
  const Result();
}

/// Represents a successful operation with data
class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
  
  @override
  String toString() => 'Success(data: $data)';
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> && runtimeType == other.runtimeType && data == other.data;
  
  @override
  int get hashCode => data.hashCode;
}

/// Represents a failed operation with error message
class Failure<T> extends Result<T> {
  final String message;
  final Exception? exception;
  
  const Failure(this.message, [this.exception]);
  
  @override
  String toString() => 'Failure(message: $message, exception: $exception)';
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<T> &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          exception == other.exception;
  
  @override
  int get hashCode => message.hashCode ^ exception.hashCode;
}

/// Extension methods for convenient Result handling
extension ResultExtension<T> on Result<T> {
  /// Pattern matching for Result
  /// 
  /// Usage:
  /// ```dart
  /// final message = result.when(
  ///   success: (data) => 'Success: $data',
  ///   failure: (error) => 'Error: $error',
  /// );
  /// ```
  R when<R>({
    required R Function(T data) success,
    required R Function(String message) failure,
  }) {
    return switch (this) {
      Success(data: final data) => success(data),
      Failure(message: final message) => failure(message),
    };
  }
  
  /// Returns data if Success, null otherwise
  T? get dataOrNull => switch (this) {
    Success(data: final data) => data,
    Failure() => null,
  };
  
  /// Returns data if Success, throws if Failure
  T get dataOrThrow => switch (this) {
    Success(data: final data) => data,
    Failure(message: final message, exception: final exception) => 
      throw exception ?? Exception(message),
  };
  
  /// Returns data if Success, default value otherwise
  T getOrElse(T defaultValue) => switch (this) {
    Success(data: final data) => data,
    Failure() => defaultValue,
  };
  
  /// Returns data if Success, result of function otherwise
  T getOrElseGet(T Function() defaultValue) => switch (this) {
    Success(data: final data) => data,
    Failure() => defaultValue(),
  };
  
  /// Checks if this is a Success
  bool get isSuccess => this is Success<T>;
  
  /// Checks if this is a Failure
  bool get isFailure => this is Failure<T>;
  
  /// Maps the success value to a new type
  /// 
  /// Usage:
  /// ```dart
  /// Result<int> numberResult = Success(42);
  /// Result<String> stringResult = numberResult.map((n) => n.toString());
  /// ```
  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success(data: final data) => Success(transform(data)),
      Failure(message: final message, exception: final exception) => 
        Failure(message, exception),
    };
  }
  
  /// Flat maps the success value to a new Result
  /// 
  /// Usage:
  /// ```dart
  /// Result<User> userResult = Success(user);
  /// Result<Profile> profileResult = userResult.flatMap(
  ///   (user) => getProfile(user.id)
  /// );
  /// ```
  Result<R> flatMap<R>(Result<R> Function(T data) transform) {
    return switch (this) {
      Success(data: final data) => transform(data),
      Failure(message: final message, exception: final exception) => 
        Failure(message, exception),
    };
  }
  
  /// Executes a side effect if Success
  Result<T> onSuccess(void Function(T data) action) {
    if (this is Success<T>) {
      action((this as Success<T>).data);
    }
    return this;
  }
  
  /// Executes a side effect if Failure
  Result<T> onFailure(void Function(String message) action) {
    if (this is Failure<T>) {
      action((this as Failure<T>).message);
    }
    return this;
  }
  
  /// Recovers from failure with a default value
  Result<T> recover(T Function(String message) recovery) {
    return switch (this) {
      Success() => this,
      Failure(message: final message) => Success(recovery(message)),
    };
  }
  
  /// Recovers from failure with another Result
  Result<T> recoverWith(Result<T> Function(String message) recovery) {
    return switch (this) {
      Success() => this,
      Failure(message: final message) => recovery(message),
    };
  }
}

/// Extension for Future<Result<T>>
extension FutureResultExtension<T> on Future<Result<T>> {
  /// Maps the success value asynchronously
  Future<Result<R>> mapAsync<R>(Future<R> Function(T data) transform) async {
    final result = await this;
    return switch (result) {
      Success(data: final data) => Success(await transform(data)),
      Failure(message: final message, exception: final exception) => 
        Failure(message, exception),
    };
  }
  
  /// Flat maps the success value asynchronously
  Future<Result<R>> flatMapAsync<R>(
    Future<Result<R>> Function(T data) transform,
  ) async {
    final result = await this;
    return switch (result) {
      Success(data: final data) => await transform(data),
      Failure(message: final message, exception: final exception) => 
        Failure(message, exception),
    };
  }
}

/// Helper function to wrap a function that might throw
/// 
/// Usage:
/// ```dart
/// final result = await runCatching(() async {
///   return await api.fetchData();
/// });
/// ```
Future<Result<T>> runCatching<T>(Future<T> Function() operation) async {
  try {
    final data = await operation();
    return Success(data);
  } catch (e, stackTrace) {
    return Failure(
      e.toString(),
      e is Exception ? e : Exception('$e\n$stackTrace'),
    );
  }
}

/// Synchronous version of runCatching
Result<T> runCatchingSync<T>(T Function() operation) {
  try {
    final data = operation();
    return Success(data);
  } catch (e, stackTrace) {
    return Failure(
      e.toString(),
      e is Exception ? e : Exception('$e\n$stackTrace'),
    );
  }
}
