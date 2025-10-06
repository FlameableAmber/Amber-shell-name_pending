import Quickshell
import QtQuick
import QtQuick.Shapes

PopupWindow{
    id: root
    //functional properties
    required property var ankh
    //visual properties
    property string windowShape: "square"
    property string backgroundColor: "#f8f8f8"
    property string borderColor: "darkred"
    property int rounding: 0
    property int winWidth: 100
    property int winHeight: 30
    property int posX: ankh.width / 2 - implicitWidth / 2
    property int posY: ankh.height
    property int borderWidth: 3

    anchor.window: ankh
    anchor.rect.x: posX
    anchor.rect.y: posY
    implicitHeight: winHeight
    implicitWidth: winWidth
    visible: true
    color: "transparent"
    Rectangle {
        visible: windowShape === "square" ? true: false
        anchors.centerIn: parent
        anchors.fill: parent
        color: backgroundColor
        border.color: borderColor
        border.width: borderWidth
        radius: rounding
    }
    Shape {
        visible: windowShape === "custom-detached" ? true: false
        anchors.centerIn: parent
        anchors.fill: parent
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: "transparent"
            fillColor: backgroundColor

            startX: 0
            startY: 0
            PathLine {x: 0; y: root.height - rounding}
            PathLine {x: 0 + rounding; y: root.height;}
            PathLine {x: root.width; y: root.height}
            PathLine {x: root.width; y: 0  + rounding}
            PathLine {x: root.width - rounding; y: 0}
            PathLine {x: 0; y: 0}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width - rounding
            startY: 0
            PathLine {x: 0; y: 0}
            PathLine {x: 0; y: root.height - rounding}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width
            startY: 0 + rounding
            PathLine {x: root.width; y: root.height}
            PathLine {x: 0 + rounding; y: root.height}
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width - rounding
            startY: 0
            PathLine {x: root.width; y: 0 + rounding }
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: 0
            startY: root.height - rounding
            PathLine {x: rounding; y: root.height }
        }
    }
    Shape {
        visible: windowShape === "custom-top" ? true: false
        anchors.centerIn: parent
        anchors.fill: parent
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: "transparent"
            fillColor: backgroundColor

            startX: 0
            startY: 0
            PathLine{x: 0 ; y: root.height - rounding}
            PathLine{x: rounding ; y: root.height}
            PathLine{x: root.width - rounding ; y: root.height}
            PathLine{x: root.width ; y: root.height - rounding}
            PathLine{x: root.width ; y: 0}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"
            
            startX: 0
            startY: 0
            PathLine{x: 0; y: root.height - rounding}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: rounding
            startY: root.height
            PathLine{x: root.width - rounding; y: root.height}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width
            startY: root.height - rounding
            PathLine{x: root.width; y: 0}
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: 0
            startY: root.height - rounding
            PathLine {x: rounding; y: root.height }
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width - rounding
            startY: root.height
            PathLine {x: root.width; y: root.height - rounding }
        }
    }
    Shape {
        visible: windowShape === "custom-bottom" ? true: false
        anchors.centerIn: parent
        anchors.fill: parent
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: "transparent"
            fillColor: backgroundColor

            startX: 0
            startY: root.height
            PathLine{x: 0 ; y: rounding}
            PathLine{x: rounding ; y: 0}
            PathLine{x: root.width - rounding ; y: 0}
            PathLine{x: root.width ; y: rounding}
            PathLine{x: root.width ; y: root.height}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"
            
            startX: 0
            startY: root.height
            PathLine{x: 0; y: rounding}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: rounding
            startY: 0
            PathLine{x: root.width - rounding; y: 0}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width
            startY: root.height
            PathLine{x: root.width; y: rounding}
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: 0
            startY: rounding
            PathLine {x: rounding; y: 0 }
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width - rounding
            startY: 0
            PathLine {x: root.width; y: rounding }
        }
    }
    Shape {
        visible: windowShape === "custom-top-right" ? true: false
        anchors.centerIn: parent
        anchors.fill: parent
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: "transparent"
            fillColor: backgroundColor

            startX: 0
            startY: 0
            PathLine{x: 0 ; y: root.height - rounding}
            PathLine{x: rounding ; y: root.height}
            PathLine{x: root.width; y: root.height}
            PathLine{x: root.width ; y: 0}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"
            
            startX: 0
            startY: 0
            PathLine{x: 0; y: root.height - rounding}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: rounding
            startY: root.height
            PathLine{x: root.width; y: root.height}
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: 0
            startY: root.height - rounding
            PathLine {x: rounding; y: root.height }
        }
    }
    Shape {
        visible: windowShape === "custom-bottom-left" ? true: false
        anchors.centerIn: parent
        anchors.fill: parent
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: "transparent"
            fillColor: backgroundColor

            startX: 0
            startY: 0
            PathLine{x: root.width - rounding ; y: 0}
            PathLine{x: root.width; y: rounding}
            PathLine{x: root.width; y: root.height}
            PathLine{x: 0 ; y: root.height}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"
            
            startX: root.width
            startY: rounding
            PathLine{x: root.width; y: root.height}
        }
        ShapePath {
            strokeWidth: borderWidth + 3
            strokeColor: borderColor
            fillColor: "transparent"

            startX: 0
            startY: 0
            PathLine{x: root.width - rounding; y: 0}
        }
        ShapePath {
            strokeWidth: borderWidth
            strokeColor: borderColor
            fillColor: "transparent"

            startX: root.width - rounding
            startY: 0
            PathLine {x: root.width; y: rounding }
        }
    }
}
