import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Effects

Item{
    id: root
    //required properties 
        required property string panel_alignment 
        //the panel alignment is made of a 2 letter sequence with b/t and l/m/r separeted by a "-"
        //the first letter determens the vertical location the second one the horizontal location 
        //Example: "t-m" would make the new StyledPanel appear in the middle of the panelwindow with the styling requried of top panels
    //non required properties
        property int panel_size //gives the minimum width of the panel. defaults to the size of children inside panel unless spesified otherwise
        property string background_color: "#d2ffffff" //background color of the panel
        property string border_color: "darkred" //border color of the panel

    Layout.fillHeight: true //set height to size of PanelWindow
        //set size to panel_size or the minimum reqired to contain children
    Layout.minimumWidth: panel_size
    Layout.preferredWidth: Math.max(panel_size, childrenRect.width)    
        //Wrapperitem gives the reactangle a margin based on orientation 
       
    WrapperItem{
        height: root.height
        width: (root.width - (panel_alignment[2] === "m" ? ((root.height - 1) * 2) : (root.height - 1)))
        rightMargin: (panel_alignment[2] === "m" ? -(root.height - 2.5) * 2 : panel_alignment[2] === "l" ? -root.height + 1 : -root.height - 1)

        //This rectangle determines the main visual of the panel 
        //inside it are 4 shapes for each state the triangles can take on 
        //lastly there's another rectangle to create the bottom border 
        Rectangle {
            id: box
            height: root.height
            width: (root.width - (panel_alignment[2] === "m" ? ((root.height - 1) * 2) : (root.height - 1)))
            x: + (panel_alignment[2] === "l" ? 0 : root.height)
            color: background_color

            Shape {
                visible: panel_alignment[2] === "l" ? false : panel_alignment[0] === "b" ? false : true
                x: -(root.height)
                width: root.height
                height: root.height
                ShapePath {
                    strokeWidth: 3
                    strokeColor: "#00000000"
                    fillColor: background_color

                    startX: 0
                    startY: 0
                    PathLine {x: root.height; y: root.height}
                    PathLine {x: root.height; y: 0}
                }
                Shape {
                    width: root.height
                    height: root.height
                    ShapePath {
                        strokeWidth: 3
                        strokeColor: border_color
                        fillColor: background_color

                        startX: 0
                        startY: 0
                        PathLine {x: root.height; y: root.height}
                    }
                }
            }
            
            Shape {
                visible: panel_alignment[2] === "r" ? false : panel_alignment[0] === "b" ? false : true
                x: parent.width
                width: root.height
                height: root.height
                ShapePath {
                    strokeWidth: 3
                    strokeColor: "#00000000"
                    fillColor: background_color

                    startX: root.height
                    startY: 0
                    PathLine {x: 0; y: root.height}
                    PathLine {x: 0; y: 0}
                }
                Shape {
                    width: root.height
                    height: root.height
                    ShapePath {
                        strokeWidth: 3
                        strokeColor: border_color
                        fillColor: background_color

                        startX: root.height
                        startY: 0
                        PathLine {x: 0; y: root.height}
                    }
                }
            }

            Shape {
                visible: panel_alignment[2] === "l" ? false : panel_alignment[0] === "t" ? false : true
                x: -(root.height)
                width: root.height
                height: root.height
                ShapePath {
                    strokeWidth: 3
                    strokeColor: "#00000000"
                    fillColor: background_color

                    startX: root.height
                    startY: 0
                    PathLine {x: 0; y: root.height}
                    PathLine {x: root.height; y: root.height}
                }
                Shape {
                    width: root.height
                    height: root.height
                    ShapePath {
                        strokeWidth: 3
                        strokeColor: border_color
                        fillColor: background_color

                        startX: root.height
                        startY: 0
                        PathLine {x: 0; y: root.height}
                    }
                }
            }
            
            Shape {
                visible: panel_alignment[2] === "r" ? false : panel_alignment[0] === "t" ? false : true
                x: parent.width
                width: root.height
                height: root.height
                ShapePath {
                    strokeWidth: 3
                    strokeColor: "#00000000"
                    fillColor: background_color

                    startX: 0
                    startY: 0
                    PathLine {x: root.height; y: root.height}
                    PathLine {x: 0; y: root.height}
                }
                Shape {
                    width: root.height
                    height: root.height
                    ShapePath {
                        strokeWidth: 3
                        strokeColor: border_color
                        fillColor: background_color

                        startX: 0
                        startY: 0
                        PathLine {x: root.height; y: root.height}
                    }
                }
            }

            Rectangle{
                color: root.border_color
                height: 3
                anchors {
                    top: panel_alignment[0] === "b" ? parent.top : undefined
                    bottom: panel_alignment[0] === "t" ? parent.bottom : undefined
                    left: parent.left
                    right: parent.right
                }
            }
        }
    }
}
