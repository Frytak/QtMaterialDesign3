import Quickshell
import QtQuick.Effects
import QtQuick
import QtQuick.Layouts

// import qs.Bar
// import qs.MaterialDesign3

Scope {
    FloatingWindow {
        implicitWidth: 400
        implicitHeight: 400
        color: M3Colors.getColor("background")

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 40
            spacing: 20
            uniformCellSizes: false

            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                implicitWidth: M3Size.dp(550)
                implicitHeight: M3Size.dp(100)
                radius: 10
                color: M3Colors.getColor("primary")

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 0
                    uniformCellSizes: false

                    Text {
                        font.pixelSize: M3Size.pt(20)
                        color: M3Colors.getColor("onPrimary")
                        text: "Painful death for lactoose intorelant"
                    }

                    Text {
                        font.pixelSize: M3Size.pt(14)
                        color: M3Colors.getColor("onPrimary")
                        text: "~ me, today"
                    }
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3Button {
                    type: M3Button.Type.Elevated
                    text: "Elevated"
                }

                M3Button {
                    type: M3Button.Type.Filled
                    text: "Filled"
                }

                M3Button {
                    type: M3Button.Type.Tonal
                    text: "Tonal"
                }

                M3Button {
                    type: M3Button.Type.Outlined
                    text: "Outlined"
                }

                M3Button {
                    type: M3Button.Type.Text
                    text: "Text"
                }
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }
}
