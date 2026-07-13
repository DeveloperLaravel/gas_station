abstract final class RouteNames {
  static const dashboard = 'dashboard';
  static const vehicleCheck = 'vehicle-check';
  static const transactions = 'transactions';
  static const vehicleTransactions = 'vehicle-transactions';
}

abstract final class RoutePaths {
  static const dashboard = '/';
  static const vehicleCheck = '/vehicle-check';
  static const transactions = '/transactions';

  static const vehicleTransactions =
      '/vehicles/:vehicleId/transactions';
}