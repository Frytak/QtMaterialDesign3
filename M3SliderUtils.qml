pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root
    function getHeight(size) {
        switch (size) {
        case M3Slider.Size.ExtraSmall:
            return M3Size.dp(16);
        case M3Slider.Size.Small:
            return M3Size.dp(24);
        case M3Slider.Size.Medium:
            return M3Size.dp(40);
        case M3Slider.Size.Large:
            return M3Size.dp(56);
        case M3Slider.Size.ExtraLarge:
            return M3Size.dp(96);
        }
    }
    function getHandleHeight(size) {
        switch (size) {
        case M3Slider.Size.ExtraSmall:
            return M3Size.dp(44);
        case M3Slider.Size.Small:
            return M3Size.dp(44);
        case M3Slider.Size.Medium:
            return M3Size.dp(52);
        case M3Slider.Size.Large:
            return M3Size.dp(68);
        case M3Slider.Size.ExtraLarge:
            return M3Size.dp(108);
        }
    }
    function getTrackShape(size) {
        switch (size) {
        case M3Slider.Size.ExtraSmall:
            return M3Size.dp(8);
        case M3Slider.Size.Small:
            return M3Size.dp(8);
        case M3Slider.Size.Medium:
            return M3Size.dp(12);
        case M3Slider.Size.Large:
            return M3Size.dp(16);
        case M3Slider.Size.ExtraLarge:
            return M3Size.dp(28);
        }
    }
    component Handle: Rectangle {
        required property real position
        required property int size

        implicitWidth: M3Size.dp(4)
        height: M3SliderUtils.getHandleHeight(size)
        radius: M3Size.dp(8)
        color: M3Colors.getColor("primary")

        y: parent.topPadding + parent.availableHeight / 2 - height / 2
        x: parent.leftPadding + position * (parent.availableWidth) - width / 2
    }
    component Track: Rectangle {
        id: right
        required property int size
        required property var control
        required property Handle handle
        required property real position
        x: position * (control.availableWidth) + handle.implicitWidth * 2
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitHeight: parent.implicitHeight
        implicitWidth: (1 - position) * parent.width - handle.implicitWidth * 2
        height: implicitHeight
        radius: M3SliderUtils.getTrackShape(size)
        color: M3Colors.getColor("secondaryContainer")
    }
}
