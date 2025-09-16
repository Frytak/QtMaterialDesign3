import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Shapes

Item {
    id: root
    height: M3SliderUtils.getHeight(size)

    property alias firstValue: controlRange.first.value
    property alias secondValue: controlRange.second.value

    property int size: M3Slider.Size.Medium

    width: 200
    RangeSlider {
        id: controlRange
        first.value: 0.25
        second.value: 0.75
        first.handle: M3SliderUtils.Handle {
            size: root.size
            position: parent.first.visualPosition
        }
        second.handle: M3SliderUtils.Handle {
            size: root.size
            position: parent.second.visualPosition
        }

        background: Item {
            width: controlRange.availableWidth
            height: implicitHeight
            implicitWidth: root.width
            implicitHeight: M3SliderUtils.getHeight(root.size)
            x: controlRange.leftPadding

            M3SliderUtils.Track {
                size: root.size
                control: controlRange
                handle: controlRange.first.handle
                position: controlRange.first.visualPosition
                width: (controlRange.second.visualPosition - this.position) * parent.width - handle.implicitWidth * 4
                radius: 3
                color: M3Colors.getColor("primary")
            }
            M3SliderUtils.Track {
                size: root.size
                x: 0
                control: controlRange
                handle: controlRange.first.handle
                position: controlRange.first.visualPosition
                width: (this.position) * parent.width - handle.implicitWidth * 2
                radius: 10
                topRightRadius: 3
                bottomRightRadius: 3
            }
            M3SliderUtils.Track {
                id: rangeRight
                size: root.size
                control: controlRange
                handle: controlRange.second.handle
                position: controlRange.second.visualPosition
                radius: 10
                topLeftRadius: 3
                bottomLeftRadius: 3
            }

            Rectangle {
                visible: rangeRight.width - controlRange.second.handle.width * 1.5 > M3Size.dp(3)
                anchors.right: parent.right
                anchors.rightMargin: M3Size.dp(3)
                // x: control.leftPadding
                y: controlRange.topPadding + controlRange.availableHeight / 2 - height / 2
                width: M3Size.dp(4)
                height: width
                color: M3Colors.getColor("onSecondaryContainer")
                radius: M3Size.dp(4)
            }
            Rectangle {
                visible: controlRange.first.visualPosition * parent.width > M3Size.dp(3) + controlRange.first.handle.width * 2
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: M3Size.dp(3)
                // x: control.leftPadding
                // y: control.topPadding + control.availableHeight / 2 - height / 2
                width: M3Size.dp(4)
                height: width
                color: M3Colors.getColor("onSecondaryContainer")
                radius: 2
            }
        }
    }
}
