import Quickshell
import QtQuick.Effects
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import QtQuick.Controls

// import qs.Bar
// import qs.MaterialDesign3

Scope {
    FloatingWindow {
        id: root
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
                    style: M3Button.Style.Elevated
                    text: "Elevated"
                    onClicked: {
                        if (M3Colors.theme == M3Colors.Theme.Dark) {
                            M3Colors.setTheme(M3Colors.Theme.Light);
                        } else {
                            M3Colors.setTheme(M3Colors.Theme.Dark);
                        }
                    }
                }

                M3Button {
                    style: M3Button.Style.Filled
                    text: "Filled"
                }

                M3Button {
                    style: M3Button.Style.Tonal
                    text: "Tonal"
                }

                M3Button {
                    style: M3Button.Style.Outlined
                    text: "Outlined"
                    onClicked: {
                        tester.placeholderText = "Well fuck me"
                    }
                }

                M3Button {
                    style: M3Button.Style.Text
                    text: "Text"
                    onClicked: {
                        tester.placeholderText = "Well fuck me twice"
                    }
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3Checkbox { }
                M3Checkbox { error: true }
            }
            ColumnLayout {
                Layout.alignment: Qt.AlignCenter
                spacing: 40
                RowLayout {
                    Layout.alignment: Qt.AlignCenter

                    Repeater {
                        model: 5
                        M3Slider {
                            required property int index
                            size: index
                        }
                    }
                }
                RowLayout {
                    Repeater {
                        model: 5
                        M3RangeSlider {
                            required property int index
                            size: index
                        }
                    }
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3Switch {
                    onCheckedChanged: {
                        M3Colors.setTheme(M3Colors.theme == 0 ? 1 : 0);
                    }
                }
            }

            RowLayout {
                spacing: M3Size.dp(16)
                Layout.alignment: Qt.AlignCenter

                M3TextField {
                    placeholderText: "How are you feeling?"
                    supportingText: "I'm your support"
                }

                M3TextField {
                    id: tester
                    placeholderText: "How..."
                }

                M3TextField { }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3RadioButton {
                    onHoveredChanged: if (this.hovered) {popup1.popup.open()} else {popup1.popup.close()}

                    M3Tooltip {
                        id: popup1
                        anchors.left: parent.right
                        text: "Here we have an example of a pretty long tooltip description that is totally pointless and doesn't explain anything, at least it test the component!"
                    }
                }
                M3RadioButton {
                    onHoveredChanged: if (this.hovered) {popup2.popup.open()} else {popup2.popup.close()}

                    M3Tooltip {
                        id: popup2
                        anchors.left: parent.right
                        text: "Short one ;3"
                    }
                }
                M3RadioButton {
                    onHoveredChanged: if (this.hovered || popup3.hoverHandler.hovered) {popup3.popup.open()} else {popup3.popup.close()}

                    M3Tooltip {
                        id: popup3
                        anchors.left: parent.right
                        style: M3Tooltip.Style.Rich

                        header: "Rich tooltip"
                        text: "Well, well, well, we were finally able to afford a rich tooltip. Looks pretty cozy!"
                        loadButtonLeft: true

                        hoverHandler.onHoveredChanged: if (parent.hovered || popup3.hoverHandler.hovered) {popup3.popup.open()} else {popup3.popup.close()}
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignCenter | Qt.AlignBottom
                Layout.bottomMargin: 40
                spacing: 20

                M3Button {
                    Layout.alignment: Qt.AlignCenter
                    text: "Generate new theme"
                    style: M3Button.Style.Tonal

                    onClicked: {
                        if (specifiedWallpaper.text == "") {
                            currentWallpaper.running = true
                        } else {
                            console.log(specifiedWallpaper.text)
                            M3Colors.loadColorsFromImage(specifiedWallpaper.text);
                        }
                    }

                    Process {
                        id: currentWallpaper
                        command: ["sh", "-c", "hyprctl hyprpaper listloaded"]
                        property string wallpaper
                        stdout: StdioCollector {
                            onStreamFinished: currentWallpaper.wallpaper = this.text.trim()
                        }
                        onExited: {
                            console.log(currentWallpaper.wallpaper)
                            M3Colors.loadColorsFromImage(currentWallpaper.wallpaper);
                        }
                    }
                }

                M3TextField {
                    id: specifiedWallpaper
                    Layout.alignment: Qt.AlignCenter
                    implicitWidth: 400
                    placeholderText: "Image path"
                    supportingText: "If not specified, uses wallpaper"
                }
            }
        }
    }
}
