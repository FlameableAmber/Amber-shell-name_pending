import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

//this needs to be remade from scratch
//cuz holy shit this is a horrific mess
WrapperItem{
    rightMargin: 3
    Layout.preferredHeight: parent.height - 2
    Layout.preferredWidth: parent.height
                    
    Image{
        height: parent.height
        width: parent.width
        sourceSize: Qt.size(parent.height, parent.height)
        fillMode: Image.PreserveAspectFit
        source: "/var/lib/AccountsService/icons/kita"
        clip: true
        Rectangle{
            x: -5
            y: -5
            width: parent.width + 10
            height: parent.height + 9
            color: "transparent"
            border.color: "white"
            border.width: 5
            radius: 100
        }
    }
}