import 'package:intl/intl.dart';

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
 
bool _isYesterday(DateTime time) {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  return _isSameDay(time, yesterday);
}
 
String formatRelativeTime(DateTime time) {
  final now = DateTime.now();
  final diff = now.difference(time);
 
  if (diff.inSeconds < 60) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} mins ago';
  if (_isSameDay(time, now)) return DateFormat('h:mm a').format(time);
  if (_isYesterday(time)) {
    return 'Yesterday, ${DateFormat('h:mm a').format(time)}';
  }
  return DateFormat('MMM d, yyyy').format(time);
}
 
String? dateGroupLabel(DateTime time) {
  final now = DateTime.now();
  if (_isSameDay(time, now)) return null;
  if (_isYesterday(time)) return 'YESTERDAY';
  return DateFormat('MMM d, yyyy').format(time).toUpperCase();
}
 