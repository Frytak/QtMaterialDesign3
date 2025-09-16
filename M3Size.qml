pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property int baseDensity: 96

    function dp(dp) {
        return Math.round(dpReal(dp))
    }

    function pt(pt) {
        return Math.round(ptReal(pt))
    }

    function dpReal(dp) {
        if (dp == "full") {
            return Infinity
        }
        return dp * (Screen.pixelDensity * 25.4) / baseDensity
    }

    function ptReal(pt) {
        return pt * (Screen.pixelDensity * 25.4) / baseDensity
    }
}
