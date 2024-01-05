String? validateField(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  return null;
}

String? validatePassword(String? value, password) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }

  if (value != password) {
    return 'Passwords do not match';
  }

  return null;
}
