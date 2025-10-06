import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import "../../Components"

Item {
	id: root
    property var panel
    property var panelinner
    implicitWidth: re.implicitWidth
    //onWidthChanged: {
    //    console.log("sys tray:", width)
    //}
	RowLayout {
        id: re
		spacing: 5
        anchors.fill: parent

        //psuedou sys tray stuff
        PanelButton{
            id: calculator
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/calculator-sharp-svgrepo-com.svg"
            mipmapState: true
        }
        PanelButton{
            id: weather
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/weather-snow-snowman-material-svgrepo-com.svg"
            mipmapState: true
        }
        PanelButton{
            id: mixer
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/mixer-music-3-svgrepo-com.svg"
            mipmapState: true
        }
        PanelButton{
            id: brightness
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/brightness-svgrepo-com(1).svg"
            mipmapState: true
        }
        PanelButton{
            id: devices
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/usb-drive-svgrepo-com.svg"
            mipmapState: true
        }
        PanelButton{
            id: network
            image: "/home/kita/.config/quickshell/Amber_shell/Assets/network-wired-svgrepo-com.svg"
            mipmapState: true
        }


        
        //makes all the real sys tray icons
        //right now they do actually functino 
		Repeater {
			model: SystemTray.items;

            PanelButton{
                id: item
                required property SystemTrayItem modelData;
                image: item.modelData.icon
                mipmapState: true
                onLeftClick:  item.modelData.activate
                onRightClick: menu.open
                QsMenuAnchor {
                    id: menu

                    menu: item.modelData.menu
                    anchor.window: panel
                    anchor.rect.x: panel.width - panelinner.width + item.x
                    anchor.rect.height: root.height
                }
            }
        }
    }
}       