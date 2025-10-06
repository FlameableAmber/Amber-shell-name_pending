import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import "Top_bar"
import "../Components"

PanelWindow {
    id: root
    color: "#00000000"
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 25

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0


        StyledPanel {
            id: left
            panel_alignment: "t-l"
            Layout.alignment: Qt.AlignLeft
            RowLayout{
                height: root.height
                Image{
                    source: "/home/kita/.config/quickshell/Amber_shell/Assets/kde-logo-blue-transparent-source.svg"
                    Layout.preferredHeight: parent.height - 2
                    Layout.preferredWidth: parent.height -2
                    Layout.alignment: Qt.AlignTop
                }
                VolumeOSD {
                    height: root.height - 3
                    Layout.alignment: Qt.AlignTop
                }
            }
        }
        Item{
            implicitWidth: (row.width / 2 - left.width - middle.width / 2)
            Layout.alignment: Qt.AlignTop

            Rectangle{
                color: "darkred"
                height: 3
                anchors {
                    top: parent.top
                }
                x: + 24
                width: parent.width - 46
            }
        }

        StyledPanel {
            id: middle
            panel_alignment: "t-m"
            panel_size: 100
            MediaPlayerSmall {
                panel: root
            }
        }

        Item{
            implicitWidth: (row.width / 2 - right.width - middle.width / 2)
            Layout.alignment: Qt.AlignTop

            Rectangle{
                color: "darkred"
                height: 3
                anchors {
                    top: parent.top
                }
                x: + 20
                width: parent.width - 40
            }
        }

        StyledPanel {
            id:right
            panel_alignment: "t-r"
            width: r.width
            RowLayout {
                id: r
                height: root.height - 2
                anchors{
                    right: parent.right
                }
                SysTray {
                    height: root.height - 4
                    panel: root
                    panelinner: right
                }
                ClockWidget {}
                UserIcon {
                    height: root.height 
                }
                //onWidthChanged: {
                //    console.log("right panel rowlayout:", width)
                //}
            }
               
        //onWidthChanged: {
        //    console.log("right panel:", width)
        //    console.log("right panel imp:", implicitWidth)
        //}
        }
    }
}