class AppError implements Exception {
  final String message;

  const AppError({required this.message});

  @override
  String toString() => message;
}

class DataMigrationError extends AppError {
  final String fields;
  const DataMigrationError({required this.fields})
      : super(
          message:
              "We encountered a problem with your data ($fields). To fix this, please try taking a backup of your data and reinstalling the app.",
        );
}
