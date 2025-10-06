import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
//import "Bottom_bar"
import "../Components"
//import "../Assets"

PanelWindow {
    color: "#00000000"
    anchors {
        bottom: true
        right: true
        left: true
    }

    Rectangle{
        color: "darkred"
        height: 3
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    implicitHeight: 40

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0


        StyledPanel {
            id: left
            panel_alignment: "b-l"
            Layout.alignment: Qt.AlignLeft
            panel_size: 800
            PanelButton{
                image: "/home/kita/.config/quickshell/Amber_shell/Assets/arch-svgrepo-com.svg"
                color: "#229ed8"
            }
        }

        StyledPanel {
            id: right
            panel_alignment: "b-r"
            Layout.alignment: Qt.AlignRight
            panel_size: 500
        }
    }
}
