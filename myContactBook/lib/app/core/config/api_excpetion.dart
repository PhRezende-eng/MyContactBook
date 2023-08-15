class CBApiException implements Exception {
  List<String> messages;
  CBApiException(this.messages);
}
