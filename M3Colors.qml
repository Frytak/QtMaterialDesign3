pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    enum Theme {
        Light,
        Dark
    }

    enum Contrast {
        Normal,
        Medium,
        High
    }

    signal m3ThemeChanged
    signal m3ContrastChanged

    property int theme: M3Colors.Theme.Dark
    property int contrast: M3Colors.Contrast.Normal

    function setTheme(_theme) {
        theme = _theme;
        m3ThemeChanged();
    }

    function setContrast(_contrast) {
        contrast = _contrast;
        m3ContrastChanged();
    }

    function getColor(m3color) {
        let c = a[m3color.toString()][theme][contrast];
        return c;
    }

    property var a: null

    FileView {
        id: file
        path: Qt.resolvedUrl("./colors.json")
        watchChanges: true

        onFileChanged: reload()

        blockLoading: true
        Component.onCompleted: {
            console.log(file.text());
            a = JSON.parse(file.text());
        }

        onDataChanged: {
            a = JSON.parse(file.text());
        }
    }
}
