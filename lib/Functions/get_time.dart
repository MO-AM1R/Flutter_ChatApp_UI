String getTime(DateTime dateTime) {
  if (dateTime.hour == 0 && dateTime.hour != 12) {
    return '12 : ${dateTime.minute} AM';
  } else if (dateTime.hour == 12 && dateTime.hour != 0) {
    return '12 : ${dateTime.minute} PM';
  } else if (dateTime.hour < 12 && dateTime.hour != 0) {
    return '${dateTime.hour} : ${dateTime.minute} AM';
  } else if (dateTime.hour > 12 && dateTime.hour != 0) {
    return '${dateTime.hour - 11} : ${dateTime.minute} AM';
  }

  return '';
}