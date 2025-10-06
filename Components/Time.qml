pragma Singleton

import Quickshell
import QtQuick

//again pretty easy to grasp altough I still have no clue how to set the month to display in hungarian
Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date,"yyyy MMM. dd | hh:mm:ss")
  }
  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}