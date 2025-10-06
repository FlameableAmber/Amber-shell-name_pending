import Quickshell
import QtQuick
import Quickshell.Services.Mpris
import QtQuick.Layouts
import "../../Components"

Item{
    id: root
    implicitHeight: parent.height
    implicitWidth: childrenRect.width
    property var panel
    readonly property var activePlayer: MprisController.activePlayer
    //makes the mediaplayer non visible when nothing is playing again this should be lazyloaded
    visible: activePlayer === null ? false : true

    Rectangle {
        
        //color: "transparent"
        color: "darkred"
        height: 5
        width: root.width
        MouseArea {
            anchors.fill: parent
            onClicked: { mediabig.visible = true ; console.log("clicked")}
        }
    }
    
    StyledWindow {
        id: mediabig
        visible: false
        winWidth: 700
        winHeight: 300
        posX: (panel.width) / 2 - winWidth / 2
        posY: -root.height
        //anchors.right: true
        windowShape: "custom-top"
        rounding: root.height
        backgroundColor: "#d2ffffff"
        MouseArea{
            hoverEnabled: true
            anchors.fill: parent
            //onExited: {mediabig.visible = false; console.log("exited")}
        }
        MediaPlayer{}
    }

    RowLayout{
        //implicitWidth: childrenRect.width
        Layout.fillHeight: true
        PanelButton{
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/pin-filled-svgrepo-com.svg"
            
        }
        //this is buggy when displaying non latin characters
        Text{
            text: activePlayer?.trackTitle.length > 34 ? activePlayer?.trackTitle.substring(0,35) + "..." : activePlayer?.trackTitle
            font.pointSize: 11
            font.family: "MartianMonoNerdFontMono"
            padding: 1.5
        }
        PanelButton{
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/arrow-left-svgrepo-com.svg"
            onLeftClick: activePlayer.previous
        }
        PanelButton{
            image: activePlayer.isPlaying === true ? "/home/kita/.config/quickshell/Amber_shell/Assets/animation-pause-svgrepo-com.svg" : "/home/kita/.config/quickshell/Amber_shell/Assets/animation-play-svgrepo-com.svg"
            onLeftClick: activePlayer.togglePlaying
            //color: activePlayer.isPlaying === true ? "#e03030" : "#1f9925"
        }
        PanelButton{
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/arrow-right-svgrepo-com.svg"
            onLeftClick: activePlayer.next
        }
    }
}