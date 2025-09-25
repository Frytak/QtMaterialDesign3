pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Item {
    id: root

    enum Style {
        Plain,
        Rich
    }

    HoverHandler {
        id: hoverHandler
        target: null
        acceptedDevices: PointerDevice.AllDevices
        enabled: popup.opened
    }

    property int style: M3Tooltip.Style.Plain
    property int maxWidth: M3Size.dp(256)
    property Popup popup: popup
    property HoverHandler hoverHandler: hoverHandler

    property string text: ""
    property string header: ""
    property bool loadButtonLeft: false
    property bool loadButtonRight: false
    property Component buttonLeft: M3Button { text: "Accept"; style: M3Button.Style.Text }
    property Component buttonRight: M3Button { text: "Decline"; style: M3Button.Style.Text }

    implicitWidth: popup.implicitWidth
    implicitHeight: popup.implicitHeight

    Popup {
        id: popup

        implicitWidth: Math.min(root.maxWidth, contentItem.implicitWidth + leftPadding + rightPadding)
        implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

        padding: 0
        topPadding: (root.style == M3Tooltip.Style.Plain) ? M3Size.dp(4) : M3Size.dp(12)
        bottomPadding: (root.style == M3Tooltip.Style.Plain) ? M3Size.dp(4) : M3Size.dp(8)
        leftPadding: (root.style == M3Tooltip.Style.Plain) ? M3Size.dp(8) : M3Size.dp(16)
        rightPadding: (root.style == M3Tooltip.Style.Plain) ? M3Size.dp(8) : M3Size.dp(16)

        closePolicy: Popup.NoAutoClose

        contentItem: Loader {
            id: loader
            readonly property Component plain: Text {
                text: root.text
                color: M3Colors.inverseOnSurface
                wrapMode: Text.Wrap
                font.pixelSize: M3Size.pt(12)
                lineHeight: M3Size.pt(16)
                lineHeightMode: Text.FixedHeight
            }

            readonly property Component rich: ColumnLayout {
                spacing: 0

                Loader {
                    active: root.header != ""
                    sourceComponent: Text {
                        Layout.bottomMargin: M3Size.dp(4)
                        text: root.header
                        color: M3Colors.inverseOnSurface
                        font.pixelSize: M3Size.pt(14)
                        font.weight: 500
                        lineHeight: M3Size.pt(20)
                        lineHeightMode: Text.FixedHeight
                    }
                }

                Text {
                    text: root.text
                    Layout.fillWidth: true
                    color: M3Colors.inverseOnSurface
                    wrapMode: Text.Wrap
                    font.pixelSize: M3Size.pt(12)
                    lineHeight: M3Size.pt(16)
                    lineHeightMode: Text.FixedHeight
                }

                Loader {
                    active: root.loadButtonLeft || root.loadButtonRight
                    sourceComponent: RowLayout {
                        Layout.topMargin: M3Size.dp(12)
                        Loader {
                            active: root.loadButtonLeft
                            sourceComponent: root.buttonLeft
                        }
                        Loader {
                            active: root.loadButtonRight
                            sourceComponent: root.buttonRight
                        }
                    }
                }
            }

            sourceComponent: (root.style == M3Tooltip.Style.Plain) ? plain : rich
        }

        background: Rectangle {

            color: M3Colors.inverseSurface
            radius: (root.style == M3Tooltip.Style.Plain) ? M3Size.dp(4) : M3Size.dp(12)
            implicitHeight: Math.max(M3Size.dp(24), popup.implicitHeight)
        }
    }
}
