pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

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

    function setTheme(_theme, save = true) {
        theme = _theme;
        m3ThemeChanged();
        if (save)
            saveData();
    }

    function setContrast(_contrast, save = true) {
        contrast = _contrast;
        m3ContrastChanged();
        if (save)
            saveData();
    }

    function getColor(m3color) {
        if (!colorsJson || !(m3color in colorsJson)) {
            return '#60ff00ff';
        }
        let c = colorsJson[m3color.toString()][theme][contrast];
        return c;
    }

    function test() {
        let p = "/home/user/Downloads/Bloom-wallpaper-OLED.jpg";
        // testProc.running = true;
        // wallpaperPathQuery.running = true;
        loadColorsFromImage(p);
    }

    property var colorsJson: null

    FileView {
        id: file
        path: Qt.resolvedUrl("./colors.json")
        watchChanges: true

        onFileChanged: reload()

        // blockLoading: true
        Component.onCompleted: {}
        onLoaded: {
            try {
                let parsed = JSON.parse(file.text());

                console.log(parsed.theme, parsed.theme == null);

                if (parsed.theme != null)
                    root.setTheme(parsed.theme, false);
                if (parsed.contrast != null)
                    root.setContrast(parsed.contrast, false);
                if (parsed.colors != null) {
                    root.colorsJson = parsed.colors;
                } else {
                    wallpaperPathQuery.running = true;
                }
            } catch (e) {
                wallpaperPathQuery.running = true;
            }
        }
        onLoadFailed: {
            wallpaperPathQuery.running = true;
        }
    }

    function saveData() {
        file.setText(JSON.stringify({
            theme: root.theme,
            contrast: root.contrast,
            colors: root.colorsJson
        }));
    }

    function loadColorsFromImage(imagePath, HowMuchYouWantYourCPUNotToSuffer = 100) {
        testProc.exec([`python`, `./generate_colors.py`, imagePath, HowMuchYouWantYourCPUNotToSuffer]);
    }

    Process {
        id: testProc
        running: false
        workingDirectory: Quickshell.shellDir
        stdout: StdioCollector {
            onStreamFinished: {
                root.colorsJson = JSON.parse(this.text);
                root.saveData();
                // console.log(`line read: ${this.text}`);
            }
        }
        stderr: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
    }
    Process {
        id: wallpaperPathQuery
        command: [`hyprctl`, `hyprpaper`, `listactive`]
        running: false
        stdout: StdioCollector {
            onStreamFinished: {
                let splited = this.text.split(" = ");
                let path = splited[splited.length - 1];

                root.loadColorsFromImage(path.trim());
            }
        }
        stderr: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
    }
}
