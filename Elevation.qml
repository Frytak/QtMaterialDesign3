import Quickshell
import QtQuick.Effects
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    property int level: Elevation.Level.Zero
    required default property Item child

    implicitWidth: childWrapper.implicitWidth
    implicitHeight: childWrapper.implicitHeight

    enum Level {
        Zero,
        One,
        Two,
        Three,
        Four,
        Five
    }

    Item {
        id: childWrapper
        implicitWidth: root.child.implicitWidth
        implicitHeight: root.child.implicitHeight
        children: [root.child]
    }

    MultiEffect {
        visible: root.level != Elevation.Level.Zero
        source: root.child
        anchors.fill: childWrapper
        shadowBlur: 0.2
        shadowEnabled: true
        shadowColor: "black"
        opacity: 0.6
        shadowVerticalOffset: 2
        shadowScale: 0.99
    }
}
