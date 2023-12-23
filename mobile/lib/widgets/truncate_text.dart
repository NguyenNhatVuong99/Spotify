String truncateText(String text) {
  if (text.length <= 14) {
    return text;
  } else {
    return '${text.substring(0, 13)}...';
  }
}
