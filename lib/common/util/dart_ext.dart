void importHelper() {}

extension NullableExt<T> on T {
  R let<R>(R Function(T it) op) => op(this);
}
