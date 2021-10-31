extension MatchExtensions on RegExpMatch {
  bool isFull() {
    return start == 0 && end == input.length;
  }
}
