pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property int baseDensity: 96

    function dp(dp) {
        if (dp == "full") {
            return 99999999
        }
        return Math.round(dp * (Screen.pixelDensity * 25.4) / baseDensity)
    }

    function pt(pt) {
        return Math.round(pt * (Screen.pixelDensity * 25.4) / baseDensity)
    }
}
