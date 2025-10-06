import Quickshell
import Quickshell.Widgets
import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

Item{
    //visible: false
    id: buttonRoot
    implicitHeight: parent.height
    implicitWidth: height
    
    //looks related properties
    property string image: undefiend
    property string color: "#00000000"
    property string highlightType: "none"
    property string highlightColor: "#00000000"
    property string onPressedHighlightType: "none"
    property bool mipmapState: false

    //action related properties
    property var onLeftClick 
    property var onRightClick 
    property var onMiddleClick 
    property var onScroolUp 
    property var onScroolDown 
    property var onHover 
    
    MouseArea{
        id: mice
        hoverEnabled: true
        anchors.centerIn: parent
        width: buttonRoot.height + 2
        height: buttonRoot.height + 2
        //change this to use IconImage
        Image{
            id: img
            anchors.centerIn: parent
            height: buttonRoot.height  
            width: buttonRoot.height 
            source: buttonRoot.image
            mipmap: mipmapState
            ColorOverlay{
                visible: buttonRoot.color === "#00000000" ? false : true
                anchors.fill: img
                source: img
                color: buttonRoot.color
            }
        }
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        onClicked: (mouse)=> {
            if (mouse.button == Qt.LeftButton)
                onLeftClick();
            else if (mouse.button == Qt.RightButton)
                onRightClick();
            else
                onMiddleClick();
        }
        //make a popup window sometime
        //not really important as I wouldn't use it but it'll be nice later
        //Timer {
        //    interval: 500; running: mice.containsMouse
        //    onTriggered: { console.log("u gay >:3")}
        //}
    }

}