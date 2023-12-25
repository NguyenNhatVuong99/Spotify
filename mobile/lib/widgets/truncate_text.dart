String truncateText(String text) {
  if (text.length <= 15) {
    return text;
  } else {
    return text.substring(0, 14) + '...';
  }
}
