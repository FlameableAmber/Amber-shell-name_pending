import Quickshell
import QtQuick
import Quickshell.Services.Mpris
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
import "../../Components"

Item {
    id: root
    implicitWidth: 650
    implicitHeight: 275
    readonly property var activePlayer: MprisController.activePlayer
    anchors{
        right: parent.right
        left: parent.left
    }

    Rectangle {
        anchors{
            right: parent.right
            rightMargin: (parent.width - 650) / 2
            left: parent.left
            leftMargin: (parent.width - 650) / 2
            top: parent.top
            bottom: parent.bottom
        }
        color: "transparent"
        RowLayout{
            anchors.fill: parent
            Rectangle{
                width: 260
                height: 260
                radius: 1000
                color: "transparent"
                border.color: "darkred"
                border.width: 10
                Layout.topMargin: (300 - 260) / 2
                ClippingRectangle{
                width: 250
                height: 250
                radius: 1000
                color: "transparent"
                anchors.centerIn: parent
                transform: Rotation {
                    id: rotator
                    origin.x: 125
                    origin.y: 125
                    angle: 0
                }
                Timer{
                    interval: 30; running: activePlayer.playbackState === 1 ? true : false; repeat: true
                    onTriggered: rotator.angle += 1
                }
                Image {
                    source: activePlayer?.trackArtUrl
                    sourceSize.width: 250
                    sourceSize.height: 250
                    width: 250
                    height: 250
                    fillMode: Image.PreserveAspectCrop
                    mipmap: true
                }}
            }
            ColumnLayout{
                Text {
                    text: activePlayer?.trackTitle.length > 34 ? activePlayer?.trackTitle.substring(0,18) + "..." : activePlayer?.trackTitle
                    font.pointSize: 16
                    padding: 1.5        
                    Layout.rightMargin: 20
                }
                Text{
                    text: " " + activePlayer?.trackArtist
                    font.pointSize: 10
                }

                Slider{
                    from: 0
                    value: activePlayer.position
                    to: activePlayer.length
                    onMoved: activePlayer.position = value
                    implicitWidth: 250
                    Timer {
                        // only emit the signal when the position is actually changing.
                        running: activePlayer.playbackState == MprisPlaybackState.Playing
                        // Make sure the position updates at least once per second.
                        interval: 1000
                        repeat: true
                        // emit the positionChanged signal every second.
                        onTriggered: activePlayer.positionChanged()
                    }
                    Layout.alignment:Qt.AlignHCenter
                }
            RowLayout{
                implicitHeight: 40
                Layout.alignment:Qt.AlignHCenter
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
                    image: activePlayer.shuffle === false ? "/home/kita/.config/quickshell/Amber_shell/Assets/arrow-right-svgrepo-com2.svg" : "/home/kita/.config/quickshell/Amber_shell/Assets/shuffle-svgrepo-com.svg"
                    function shuffleSet(){
                            if (activePlayer.shuffle == true) {
                                activePlayer.shuffle = false
                            } else {
                                activePlayer.shuffle = true
                            }
                    }
                    onLeftClick: shuffleSet
                    //color: activePlayer.isPlaying === true ? "#e03030" : "#1f9925"
                }
                PanelButton{
                    image: activePlayer.loopState === 0 ? "/home/kita/.config/quickshell/Amber_shell/Assets/no-entry-svgrepo-com.svg" : activePlayer.loopState === 1 ? "/home/kita/.config/quickshell/Amber_shell/Assets/loop-1-svgrepo-com.svg" : "/home/kita/.config/quickshell/Amber_shell/Assets/loop-svgrepo-com.svg"
                    function changeLoop() {
                        if (activePlayer.loopState < 2) {
                            activePlayer.loopState += 1
                        } else {
                            activePlayer.loopState = 0
                        }
                    }
                    onLeftClick: changeLoop
                    //color: activePlayer.isPlaying === true ? "#e03030" : "#1f9925"
                }
                PanelButton{
                    image: "/home/kita/.config/quickshell/Amber_shell/Assets/arrow-right-svgrepo-com.svg"
                    onLeftClick: activePlayer.next
                }
                
                }            
            }
        }
    }
}
