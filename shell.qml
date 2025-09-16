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
                    type: M3Button.Style.Elevated
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
                    type: M3Button.Style.Filled
                    text: "Filled"
                }

                M3Button {
                    type: M3Button.Style.Tonal
                    text: "Tonal"
                }

                M3Button {
                    type: M3Button.Style.Outlined
                    text: "Outlined"
                }

                M3Button {
                    type: M3Button.Style.Text
                    text: "Text"
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3Checkbox { }
                M3Checkbox { error: true }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3TextField {
                    placeholderText: "How are you feeling?"
                    supportingText: "I'm your support"
                }

                M3TextField {
                    placeholderText: "How..."
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter

                M3RadioButton { }
                M3RadioButton { }
                M3RadioButton { }
            }

            Item {
                Layout.fillHeight: true
            }

            M3Button {
                text: "Generate new theme"
                type: M3Button.Style.Tonal

                Layout.alignment: Qt.AlignCenter | Qt.AlignBottom
                Layout.bottomMargin: 40

                onClicked: {
                    process.running = true;
                    console.log("a");
                }

                Process {
                    id: process
                    command: [`python`, `./generate_colors.py`, `/etc/nixos/wallpapers/skeleton_army_1920x1080.png`, `100`]
                    running: false
                    workingDirectory: Quickshell.shellDir
                    onRunningChanged: {
                        console.log("run");
                    }
                    stdout: StdioCollector {
                        onStreamFinished: {
                            M3Colors.a = JSON.parse(this.text);
                            console.log(`line read: ${this.text}`);
                        }
                    }
                    stderr: StdioCollector {
                        onStreamFinished: console.log(`line read: ${this.text}`)
                    }
                }
            }
        }
    }
}
