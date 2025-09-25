import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Basic
import QtQuick.Layouts

Control {
    id: root

    enum Style {
        Filled,
        Outlined
    }

    property alias supportingText: supportingText.text
    property int style: M3TextField.Style.Outlined
    readonly property int margin: M3Size.dp(16)
    property int initialWidth
    property TextField textFieldItem: textField

    function getInitialWidth() {
        return primarySizeReference.width + primarySizeReference.anchors.leftMargin * 2
    }

    state: "DEFAULT_EMPTY"

    implicitHeight: textField.implicitHeight + (supportingArea.implicitHeight + supportingArea.anchors.topMargin) * 2
    implicitWidth: textField.implicitWidth

    TextField {
        id: textField

        width: root.width
        anchors.top: root.top
        implicitHeight: border.implicitHeight
        implicitWidth: {
            placeholderText == "" ? M3Size.dp(160) : root.initialWidth
        }

        font.pixelSize: M3Size.pt(16)
        anchors.topMargin: supportingArea.implicitHeight + supportingArea.anchors.topMargin
        leftPadding: root.margin
        color: M3Colors.onSurface
        placeholderTextColor: "transparent"
        onActiveFocusChanged: {
            if (textField.activeFocus) {
                root.state = "FOCUSED"
            } else {
                if (root.text == "") {
                    root.state = "DEFAULT_EMPTY"
                } else {
                    root.state = "DEFAULT_FILLED"
                }
            }
        }

        background: Item {
            Rectangle {
                id: border
                implicitHeight: M3Size.dp(56)
                anchors.fill: parent
                radius: M3Size.dp(4)
                color: "transparent"
                border.color: state == "FOCUSED" ? M3Colors.primary : M3Colors.outline
            }

            Rectangle {
                visible: root.placeholderText != ""
                id: primary
                implicitWidth: primaryText.implicitWidth + primaryText.anchors.leftMargin + primaryText.anchors.rightMargin
                implicitHeight: primaryText.implicitHeight
                anchors.left: border.left
                anchors.bottom: border.top
                anchors.leftMargin: M3Size.dp(16) - primaryText.anchors.leftMargin
                color: M3Colors.background // TODO: Should be transparent

                Text {
                    id: primaryText
                    text: root.placeholderText
                    anchors.fill: parent
                    anchors.leftMargin: M3Size.dp(4)
                    anchors.rightMargin: M3Size.dp(4)
                    color: M3Colors.primary
                }
            }

            // TODO: Find a better way of calculating the initialWidth (possibly TextMetrics)
            Rectangle {
                visible: root.placeholderText != ""
                id: primarySizeReference
                opacity: 0
                implicitWidth: primaryTextSizeReference.implicitWidth + primaryTextSizeReference.anchors.leftMargin + primaryTextSizeReference.anchors.rightMargin
                implicitHeight: primaryTextSizeReference.implicitHeight
                anchors.left: border.left
                anchors.bottom: border.top
                anchors.leftMargin: M3Size.dp(16) - primaryTextSizeReference.anchors.leftMargin

                Text {
                    id: primaryTextSizeReference
                    text: root.placeholderText
                    onTextChanged: initialWidth = getInitialWidth()
                    anchors.fill: parent
                    anchors.leftMargin: M3Size.dp(4)
                    anchors.rightMargin: M3Size.dp(4)
                    font.pixelSize: M3Size.dp(16)
                }

                Component.onCompleted: initialWidth = getInitialWidth()
            }
        }

    }

    RowLayout {
        id: supportingArea
        spacing: M3Size.dp(16)

        anchors {
            top: textField.bottom
            left: textField.left
            right: textField.right
            topMargin: M3Size.dp(4)
            leftMargin: M3Size.dp(16)
            rightMargin: M3Size.dp(16)
        }

        Text {
            id: supportingText
            color: M3Colors.onSurfaceVariant
            font.pixelSize: M3Size.pt(12)
        }
    }

    states: [
        State {
            name: "DEFAULT_EMPTY"
            PropertyChanges {
                border {
                    border.width: M3Size.dp(1)
                    border.color: M3Colors.outline
                }
                primary {
                    anchors.bottomMargin: -((border.height / 2) + (primary.height / 2))
                }
                primaryText {
                    color: M3Colors.onSurfaceVariant
                    font.pixelSize: M3Size.dp(16)
                }
            }
        },
        State {
            name: "DEFAULT_FILLED"
            PropertyChanges {
                border {
                    border.width: M3Size.dp(1)
                    border.color: M3Colors.outline
                }
                primary {
                    anchors.bottomMargin: -(primary.height / 2)
                }
                primaryText {
                    color: M3Colors.onSurfaceVariant
                    font.pixelSize: M3Size.dp(12)
                }
            }
        },
        State {
            name: "FOCUSED"
            PropertyChanges {
                border {
                    border.width: M3Size.dp(3)
                    border.color: M3Colors.primary
                }
                primary {
                    anchors.bottomMargin: -(primary.height / 2)
                }
                primaryText {
                    color: M3Colors.primary
                    font.pixelSize: M3Size.dp(12)
                }
            }
        }
    ]

    transitions: [
        Transition {
            to: "DEFAULT_FILLED,FOCUSED"
            NumberAnimation {
                target: primary
                properties: "anchors.bottomMargin"
                duration: 100
                to: -(primary.height / 2)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            NumberAnimation {
                target: primaryText
                properties: "font.pixelSize"
                duration: 100
                to: M3Size.dp(12)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            ColorAnimation {
                target: primaryText
                properties: "color"
                duration: 100
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            NumberAnimation {
                target: border
                properties: "border.width"
                duration: 100
                to: M3Size.dp(3)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            ColorAnimation {
                target: border
                properties: "border.color"
                duration: 100
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
        },
        Transition {
            to: "DEFAULT_EMPTY"
            NumberAnimation {
                target: primary
                properties: "anchors.bottomMargin"
                duration: 100
                to: -((border.height / 2) + (primary.height / 2))
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            NumberAnimation {
                target: primaryText
                properties: "font.pixelSize"
                duration: 100
                to: M3Size.dp(16)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            ColorAnimation {
                target: primaryText
                properties: "color"
                duration: 100
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            NumberAnimation {
                target: border
                properties: "border.width"
                duration: 100
                to: M3Size.dp(1)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            ColorAnimation {
                target: border
                properties: "border.color"
                duration: 100
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
        }
    ]

    // Expose all TextField properties via aliases
    // Core TextField properties
    property alias text: textField.text
    property alias placeholderText: textField.placeholderText
    property alias readOnly: textField.readOnly
    property alias validator: textField.validator
    property alias inputMethodHints: textField.inputMethodHints
    property alias echoMode: textField.echoMode
    property alias passwordCharacter: textField.passwordCharacter
    property alias passwordMaskDelay: textField.passwordMaskDelay
    property alias acceptableInput: textField.acceptableInput
    property alias inputMask: textField.inputMask
    property alias cursorPosition: textField.cursorPosition
    property alias maximumLength: textField.maximumLength
    property alias selectedText: textField.selectedText
    property alias selectionStart: textField.selectionStart
    property alias selectionEnd: textField.selectionEnd
    //property alias font: textField.font
    property alias color: textField.color
    property alias placeholderTextColor: textField.placeholderTextColor
    //property alias alignment: textField.alignment
    property alias horizontalAlignment: textField.horizontalAlignment
    property alias verticalAlignment: textField.verticalAlignment
    property alias wrapMode: textField.wrapMode
    property alias selectByMouse: textField.selectByMouse
    property alias mouseSelectionMode: textField.mouseSelectionMode
    property alias persistentSelection: textField.persistentSelection
    property alias cursorDelegate: textField.cursorDelegate
    property alias cursorVisible: textField.cursorVisible
    property alias cursorRectangle: textField.cursorRectangle
    property alias overwriteMode: textField.overwriteMode
    property alias renderType: textField.renderType

    // Focus-related properties
    //property alias activeFocus: textField.activeFocus
    property alias activeFocusOnPress: textField.activeFocusOnPress
    //property alias focusReason: textField.focusReason

    // Signals
    signal accepted() // Connect to TextField's accepted signal
    signal editingFinished() // Connect to TextField's editingFinished signal
    signal textEdited() // Connect to TextField's textEdited signal
    signal returnPressed() // Connect to TextField's returnPressed signal

    // Connect signals
    Component.onCompleted: {
        textField.accepted.connect(root.accepted)
        textField.editingFinished.connect(root.editingFinished)
        textField.textEdited.connect(root.textEdited)
        //textField.returnPressed.connect(root.returnPressed)
    }

    // Expose methods
    function select(start, end) { textField.select(start, end) }
    function selectAll() { textField.selectAll() }
    function selectWord() { textField.selectWord() }
    function deselect() { textField.deselect() }
    function copy() { textField.copy() }
    function paste() { textField.paste() }
    function cut() { textField.cut() }
    function undo() { textField.undo() }
    function redo() { textField.redo() }
    function clear() { textField.clear() }
    function ensureVisible(position) { textField.ensureVisible(position) }
    function forceActiveFocus() { textField.forceActiveFocus() }
}
