String formatTimer(Duration duration) {
  final split = duration.toString().split(':');

  var hour = split[0];
  var minute = split[1];
  var seconds = split[2].split('.')[0];

  return (hour == '0' || hour == '00' ? '' : hour.padLeft(2, '0') + ' Jam ') + (minute == '0' || minute == '00' ? '' : minute + ' Menit ');
}
