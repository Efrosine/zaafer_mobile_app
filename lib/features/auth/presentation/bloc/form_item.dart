class FormItem {
  const FormItem({
    this.value = '',
    required this.error,
  });

  final String? error;
  final String value;
}
