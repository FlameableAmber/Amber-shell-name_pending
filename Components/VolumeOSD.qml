import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Item{
	id: root
    width: 200

	// Bind the pipewire node so its volume will be tracked
	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	//create a connection so that when the volume changes root.shouldShowOsd is true and it restarts hideTimer
	Connections {
		target: Pipewire.defaultAudioSink?.audio

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}
	
	//create shouldShowOsd and set it to false by default
	property bool shouldShowOsd: false

	//create hideTimer
	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	//bind the OSD being visible to shouldShowOsd
	//this is supposed to be lazyloaded but I couldn't figure out how to use lazyloaders or they aren't supposed to be used for this kind of thing
	visible: shouldShowOsd

	//contains the volume osd
    Rectangle {
		anchors.fill: parent
        color: "transparent"

		RowLayout {
			anchors {
				fill: parent
				rightMargin: 5
			}

			//pulls an icon based on volume
			//this will be changed to fixed ones pulled from assets later on
			IconImage {
				implicitSize: 20
				source: Quickshell.iconPath(Pipewire.defaultAudioSink?.audio.volume < 0.3 ? "audio-volume-low-symbolic" : Pipewire.defaultAudioSink?.audio.volume < 0.8 ? "audio-volume-medium-symbolic" : "audio-volume-high-symbolic")

				//display the volume % over the icon
				Text{
						id: innertext
						anchors.centerIn: parent
						//needs to be rounded cuz by default it returns really weird floats
						text: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100)
					}
					
			}

			//gonna be honest I'm not sure what's going on here
			Rectangle {
				// Stretches to fill all left-over space
				Layout.fillWidth: true

				implicitHeight: 6
				radius: 20
				color: "#50c2c2c2"

				Rectangle {
                    color: "darkred"
					anchors {
						left: parent.left
						top: parent.top
						bottom: parent.bottom
					}

					implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
					radius: parent.radius
				}
			}
		}
	}
}
