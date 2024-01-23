class Lyric {
  final int startTime;
  final int endTime;
  final String content;
  bool isCurrent; // New property

  Lyric({
    required this.startTime,
    required this.endTime,
    required this.content,
    this.isCurrent = false, // Default value
  });
}
