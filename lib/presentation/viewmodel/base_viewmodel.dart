import 'package:flutter/foundation.dart';

/// Base ViewModel class providing common functionality
/// Following MVVM pattern for state management
abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  bool _isDisposed = false;

  /// Whether the ViewModel is currently loading data
  bool get isLoading => _isLoading;

  /// Error message if any operation failed
  String? get error => _error;

  /// Whether the ViewModel has an error
  bool get hasError => _error != null;

  /// Whether the ViewModel has been disposed
  bool get isDisposed => _isDisposed;

  /// Sets the loading state
  @protected
  void setLoading(bool loading) {
    if (_isDisposed) return;
    _isLoading = loading;
    notifyListeners();
  }

  /// Sets an error message
  @protected
  void setError(String? error) {
    if (_isDisposed) return;
    _error = error;
    notifyListeners();
  }

  /// Clears the current error
  void clearError() {
    if (_isDisposed) return;
    _error = null;
    notifyListeners();
  }

  /// Executes an async operation with loading and error handling
  @protected
  Future<T?> executeAsync<T>(Future<T> Function() operation) async {
    if (_isDisposed) return null;
    
    setLoading(true);
    setError(null);

    try {
      final result = await operation();
      setLoading(false);
      return result;
    } catch (e) {
      setLoading(false);
      setError(e.toString());
      return null;
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}
