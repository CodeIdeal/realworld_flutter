/// just for auto import
void importHelper() {}

extension NullableExt<T> on T {
  R let<R>(R Function(T it) op) => op(this);
}

extension NullableStringExt on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
