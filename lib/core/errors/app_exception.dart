sealed class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;
}

class DatabaseException extends AppException {
  const DatabaseException([
    super.message = 'حدث خطأ في قاعدة البيانات',
  ]);
}

class ValidationException extends AppException {
  const ValidationException(super.message);
}

class VehicleNotFoundException extends AppException {
  const VehicleNotFoundException([
    super.message = 'السيارة غير موجودة',
  ]);
}

class VehicleInactiveException extends AppException {
  const VehicleInactiveException([
    super.message = 'السيارة موقوفة',
  ]);
}

class DuplicateVehicleException extends AppException {
  const DuplicateVehicleException([
    super.message = 'رقم اللوحة مسجل مسبقًا',
  ]);
}

class FuelTransactionNotFoundException
    extends AppException {
  const FuelTransactionNotFoundException([
    super.message = 'عملية التعبئة غير موجودة',
  ]);
}

class BlockedVehicleException extends AppException {
  final DateTime nextAllowedAt;

  const BlockedVehicleException(
    super.message, {
    required this.nextAllowedAt,
  });
}