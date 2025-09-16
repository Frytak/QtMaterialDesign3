import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Shapes

Item {
    id: root
    height: M3SliderUtils.getHeight(size)

    property alias from: control.from
    property alias to: control.to
    property alias value: control.value
    property alias snapMode: control.snapMode
    property alias orientation: control.orientation

    width: 200

    enum Size {
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge
    }

    enum Type {
        Standard,
        Range
    }

    property int size: M3Slider.Size.Medium
    property int type: M3Slider.Type.Standard

    property var getTrackShape: M3SliderUtils.getTrackShape(size)
    property var getHeight: M3SliderUtils.getHeight(size)
    // property var getTrackShape: M3SliderUtils.getTrackShape(size)

    Slider {
        id: control

        from: 0
        to: 10
        stepSize: 1
        value: 1
        background: Item {
            width: control.availableWidth
            height: implicitHeight
            implicitWidth: root.width
            implicitHeight: M3SliderUtils.getHeight(root.size)
            x: control.leftPadding

            //Right Side
            Rectangle {
                id: right
                x: control.visualPosition * (control.availableWidth) + handle.implicitWidth * 2
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitHeight: parent.implicitHeight
                width: (1 - control.visualPosition) * parent.width - handle.implicitWidth * 2
                height: implicitHeight
                radius: M3SliderUtils.getTrackShape(root.size)
                color: M3Colors.getColor("secondaryContainer")

                topLeftRadius: 3
                bottomLeftRadius: 3
            }

            //Left Side
            Rectangle {
                // x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                width: control.visualPosition * (parent.width) - handle.implicitWidth * 2
                height: parent.height
                color: M3Colors.getColor("primary")
                radius: M3SliderUtils.getTrackShape(root.size)

                topRightRadius: 3
                bottomRightRadius: 3
            }

            // Rectangle {
            //     visible: control.visualPosition * parent.width > M3Size.dp(3) + handle.width * 2
            //     anchors.left: parent.left
            //     anchors.leftMargin: M3Size.dp(3)
            //     // x: control.leftPadding
            //     y: control.topPadding + control.availableHeight / 2 - height / 2
            //     width: M3Size.dp(4)
            //     height: width
            //     color: M3Colors.getColor("onPrimary")
            //     radius: 2
            // }

            Image {
                visible: root.size > M3Slider.Size.Small
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                width: M3Size.dp(24)
                height: width
                source: "https://archives.bulbagarden.net/media/upload/thumb/d/d0/0700Sylveon.png/250px-0700Sylveon.png"
            }

            Rectangle {
                visible: right.width - handle.width * 1.5 > M3Size.dp(3)
                anchors.right: parent.right
                anchors.rightMargin: M3Size.dp(3)
                // x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                width: M3Size.dp(4)
                height: width
                color: M3Colors.getColor("onSecondaryContainer")
                radius: M3Size.dp(4)
            }
        }
        handle: M3SliderUtils.Handle {
            id: handle
            size: root.size
            position: parent.visualPosition
        }
    }
}
