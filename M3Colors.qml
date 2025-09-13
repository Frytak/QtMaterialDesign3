pragma Singleton

import QtQuick
import Quickshell

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

    signal m3ThemeChanged()
    signal m3ContrastChanged()

    property int theme: M3Colors.Theme.Light
    property int contrast: M3Colors.Contrast.Normal

    function setTheme(_theme) {
        theme = _theme
        m3ThemeChanged()
    }

    function setContrast(_contrast) {
        contrast = _contrast
        m3ContrastChanged()
    }

    function getColor(m3color) {
        let colorSet = theme === M3Colors.Theme.Dark ? m3color.dark : m3color.light

        switch (contrast) {
        case M3Colors.Contrast.High:
            return colorSet.high
        case M3Colors.Contrast.Medium:
            return colorSet.medium
        case M3Colors.Contrast.Normal:
        default:
            return colorSet.normal
        }
    }

    //property color primary 
    //property M3Color _primary: M3Color {
    //    dark: ColorSet {
    //        normal: "#D0BCFF"
    //        medium: "#EADDFF"
    //        high: "#F6EDFF"
    //    }

    //    light: ColorSet {
    //        normal: "#6750A4"
    //        medium: "#4F378B"
    //        high: "#381E72"
    //    }
    //}

property color primary_paletteKeyColor 
property M3Color _primary_paletteKeyColor: M3Color {
    dark: ColorSet {
        normal: "#727C35"
        medium: "#727C35"
        high: "#727C35"
    }

    light: ColorSet {
        normal: "#727C35"
        medium: "#727C35"
        high: "#727C35"
    }
}

property color secondary_paletteKeyColor 
property M3Color _secondary_paletteKeyColor: M3Color {
    dark: ColorSet {
        normal: "#76795C"
        medium: "#76795C"
        high: "#76795C"
    }

    light: ColorSet {
        normal: "#76795C"
        medium: "#76795C"
        high: "#76795C"
    }
}

property color tertiary_paletteKeyColor 
property M3Color _tertiary_paletteKeyColor: M3Color {
    dark: ColorSet {
        normal: "#537F73"
        medium: "#537F73"
        high: "#537F73"
    }

    light: ColorSet {
        normal: "#537F73"
        medium: "#537F73"
        high: "#537F73"
    }
}

property color neutral_paletteKeyColor 
property M3Color _neutral_paletteKeyColor: M3Color {
    dark: ColorSet {
        normal: "#78786D"
        medium: "#78786D"
        high: "#78786D"
    }

    light: ColorSet {
        normal: "#78786D"
        medium: "#78786D"
        high: "#78786D"
    }
}

property color neutral_variant_paletteKeyColor 
property M3Color _neutral_variant_paletteKeyColor: M3Color {
    dark: ColorSet {
        normal: "#77786A"
        medium: "#77786A"
        high: "#77786A"
    }

    light: ColorSet {
        normal: "#77786A"
        medium: "#77786A"
        high: "#77786A"
    }
}

property color background 
property M3Color _background: M3Color {
    dark: ColorSet {
        normal: "#13140D"
        medium: "#13140D"
        high: "#13140D"
    }

    light: ColorSet {
        normal: "#FCFAED"
        medium: "#FCFAED"
        high: "#FCFAED"
    }
}

property color whileOnBackground 
property M3Color _whileOnBackground: M3Color {
    dark: ColorSet {
        normal: "#E4E3D6"
        medium: "#E4E3D6"
        high: "#E4E3D6"
    }

    light: ColorSet {
        normal: "#1B1C14"
        medium: "#1B1C14"
        high: "#1B1C14"
    }
}

property color surface 
property M3Color _surface: M3Color {
    dark: ColorSet {
        normal: "#13140D"
        medium: "#13140D"
        high: "#13140D"
    }

    light: ColorSet {
        normal: "#FCFAED"
        medium: "#FCFAED"
        high: "#FCFAED"
    }
}

property color surfaceDim 
property M3Color _surfaceDim: M3Color {
    dark: ColorSet {
        normal: "#13140D"
        medium: "#13140D"
        high: "#13140D"
    }

    light: ColorSet {
        normal: "#DCDACE"
        medium: "#C8C7BB"
        high: "#BAB9AD"
    }
}

property color surfaceBright 
property M3Color _surfaceBright: M3Color {
    dark: ColorSet {
        normal: "#393A31"
        medium: "#45453C"
        high: "#505147"
    }

    light: ColorSet {
        normal: "#FCFAED"
        medium: "#FCFAED"
        high: "#FCFAED"
    }
}

property color surfaceContainerLowest 
property M3Color _surfaceContainerLowest: M3Color {
    dark: ColorSet {
        normal: "#0E0F08"
        medium: "#070803"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#FFFFFF"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color surfaceContainerLow 
property M3Color _surfaceContainerLow: M3Color {
    dark: ColorSet {
        normal: "#1B1C14"
        medium: "#1D1E16"
        high: "#1F2018"
    }

    light: ColorSet {
        normal: "#F6F4E7"
        medium: "#F6F4E7"
        high: "#F3F1E4"
    }
}

property color surfaceContainer 
property M3Color _surfaceContainer: M3Color {
    dark: ColorSet {
        normal: "#1F2018"
        medium: "#282820"
        high: "#303129"
    }

    light: ColorSet {
        normal: "#F0EEE1"
        medium: "#EAE9DC"
        high: "#E4E3D6"
    }
}

property color surfaceContainerHigh 
property M3Color _surfaceContainerHigh: M3Color {
    dark: ColorSet {
        normal: "#2A2B22"
        medium: "#33332B"
        high: "#3C3C33"
    }

    light: ColorSet {
        normal: "#EAE9DC"
        medium: "#DFDDD1"
        high: "#D6D5C8"
    }
}

property color surfaceContainerHighest 
property M3Color _surfaceContainerHighest: M3Color {
    dark: ColorSet {
        normal: "#35352D"
        medium: "#3E3E35"
        high: "#47473E"
    }

    light: ColorSet {
        normal: "#E4E3D6"
        medium: "#D3D2C6"
        high: "#C8C7BB"
    }
}

property color whileOnSurface 
property M3Color _whileOnSurface: M3Color {
    dark: ColorSet {
        normal: "#E4E3D6"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }

    light: ColorSet {
        normal: "#1B1C14"
        medium: "#11120B"
        high: "#000000"
    }
}

property color surfaceVariant 
property M3Color _surfaceVariant: M3Color {
    dark: ColorSet {
        normal: "#47483B"
        medium: "#47483B"
        high: "#47483B"
    }

    light: ColorSet {
        normal: "#E4E3D2"
        medium: "#E4E3D2"
        high: "#E4E3D2"
    }
}

property color whileOnSurfaceVariant 
property M3Color _whileOnSurfaceVariant: M3Color {
    dark: ColorSet {
        normal: "#C8C7B7"
        medium: "#DEDDCC"
        high: "#FFFFFF"
    }

    light: ColorSet {
        normal: "#47483B"
        medium: "#36372B"
        high: "#000000"
    }
}

property color inverseSurface 
property M3Color _inverseSurface: M3Color {
    dark: ColorSet {
        normal: "#E4E3D6"
        medium: "#E4E3D6"
        high: "#E4E3D6"
    }

    light: ColorSet {
        normal: "#303129"
        medium: "#303129"
        high: "#303129"
    }
}

property color inverseOnSurface 
property M3Color _inverseOnSurface: M3Color {
    dark: ColorSet {
        normal: "#303129"
        medium: "#2A2B22"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#F3F1E4"
        medium: "#F3F1E4"
        high: "#FFFFFF"
    }
}

property color outline 
property M3Color _outline: M3Color {
    dark: ColorSet {
        normal: "#919283"
        medium: "#B3B3A3"
        high: "#F2F1DF"
    }

    light: ColorSet {
        normal: "#757567"
        medium: "#525346"
        high: "#2C2D22"
    }
}

property color outlineVariant 
property M3Color _outlineVariant: M3Color {
    dark: ColorSet {
        normal: "#47483B"
        medium: "#919283"
        high: "#C4C3B3"
    }

    light: ColorSet {
        normal: "#C8C7B7"
        medium: "#6D6E60"
        high: "#494A3D"
    }
}

property color shadow 
property M3Color _shadow: M3Color {
    dark: ColorSet {
        normal: "#000000"
        medium: "#000000"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#000000"
        medium: "#000000"
        high: "#000000"
    }
}

property color scrim 
property M3Color _scrim: M3Color {
    dark: ColorSet {
        normal: "#000000"
        medium: "#000000"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#000000"
        medium: "#000000"
        high: "#000000"
    }
}

property color surfaceTint 
property M3Color _surfaceTint: M3Color {
    dark: ColorSet {
        normal: "#C2CD7C"
        medium: "#C2CD7C"
        high: "#C2CD7C"
    }

    light: ColorSet {
        normal: "#5A631F"
        medium: "#5A631F"
        high: "#5A631F"
    }
}

property color primary 
property M3Color _primary: M3Color {
    dark: ColorSet {
        normal: "#C2CD7C"
        medium: "#D8E390"
        high: "#ECF7A2"
    }

    light: ColorSet {
        normal: "#5A631F"
        medium: "#323A00"
        high: "#292F00"
    }
}

property color whileOnPrimary 
property M3Color _whileOnPrimary: M3Color {
    dark: ColorSet {
        normal: "#2D3400"
        medium: "#232800"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#FFFFFF"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color primaryContainer 
property M3Color _primaryContainer: M3Color {
    dark: ColorSet {
        normal: "#434B06"
        medium: "#8C974C"
        high: "#BEC979"
    }

    light: ColorSet {
        normal: "#DEE995"
        medium: "#69722C"
        high: "#454E09"
    }
}

property color whileOnPrimaryContainer 
property M3Color _whileOnPrimaryContainer: M3Color {
    dark: ColorSet {
        normal: "#DEE995"
        medium: "#000000"
        high: "#0A0D00"
    }

    light: ColorSet {
        normal: "#434B06"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color inversePrimary 
property M3Color _inversePrimary: M3Color {
    dark: ColorSet {
        normal: "#5A631F"
        medium: "#444C07"
        high: "#444C07"
    }

    light: ColorSet {
        normal: "#C2CD7C"
        medium: "#C2CD7C"
        high: "#C2CD7C"
    }
}

property color secondary 
property M3Color _secondary: M3Color {
    dark: ColorSet {
        normal: "#C6C9A7"
        medium: "#DCDFBC"
        high: "#F0F3CF"
    }

    light: ColorSet {
        normal: "#5D6145"
        medium: "#35381F"
        high: "#2B2E16"
    }
}

property color whileOnSecondary 
property M3Color _whileOnSecondary: M3Color {
    dark: ColorSet {
        normal: "#2F321A"
        medium: "#242710"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#FFFFFF"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color secondaryContainer 
property M3Color _secondaryContainer: M3Color {
    dark: ColorSet {
        normal: "#484B31"
        medium: "#909374"
        high: "#C2C5A3"
    }

    light: ColorSet {
        normal: "#E0E2BF"
        medium: "#6C6F52"
        high: "#484B31"
    }
}

property color whileOnSecondaryContainer 
property M3Color _whileOnSecondaryContainer: M3Color {
    dark: ColorSet {
        normal: "#E2E5C2"
        medium: "#000000"
        high: "#0A0D00"
    }

    light: ColorSet {
        normal: "#46492F"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color tertiary 
property M3Color _tertiary: M3Color {
    dark: ColorSet {
        normal: "#A2D0C2"
        medium: "#B7E6D8"
        high: "#CBFAEB"
    }

    light: ColorSet {
        normal: "#517D71"
        medium: "#0E3D33"
        high: "#00332A"
    }
}

property color whileOnTertiary 
property M3Color _whileOnTertiary: M3Color {
    dark: ColorSet {
        normal: "#06372E"
        medium: "#002C23"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#FFFFFF"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color tertiaryContainer 
property M3Color _tertiaryContainer: M3Color {
    dark: ColorSet {
        normal: "#6D9A8D"
        medium: "#6D9A8D"
        high: "#9ECCBE"
    }

    light: ColorSet {
        normal: "#517D71"
        medium: "#4A756A"
        high: "#255146"
    }
}

property color whileOnTertiaryContainer 
property M3Color _whileOnTertiaryContainer: M3Color {
    dark: ColorSet {
        normal: "#000000"
        medium: "#000000"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#FFFFFF"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color error 
property M3Color _error: M3Color {
    dark: ColorSet {
        normal: "#FFB4AB"
        medium: "#FFD2CC"
        high: "#FFECE9"
    }

    light: ColorSet {
        normal: "#BA1A1A"
        medium: "#740006"
        high: "#600004"
    }
}

property color whileOnError 
property M3Color _whileOnError: M3Color {
    dark: ColorSet {
        normal: "#690005"
        medium: "#540003"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#FFFFFF"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color errorContainer 
property M3Color _errorContainer: M3Color {
    dark: ColorSet {
        normal: "#93000A"
        medium: "#FF5449"
        high: "#FFAEA4"
    }

    light: ColorSet {
        normal: "#FFDAD6"
        medium: "#CF2C27"
        high: "#98000A"
    }
}

property color whileOnErrorContainer 
property M3Color _whileOnErrorContainer: M3Color {
    dark: ColorSet {
        normal: "#FFDAD6"
        medium: "#000000"
        high: "#220001"
    }

    light: ColorSet {
        normal: "#93000A"
        medium: "#FFFFFF"
        high: "#FFFFFF"
    }
}

property color primaryFixed 
property M3Color _primaryFixed: M3Color {
    dark: ColorSet {
        normal: "#DEE995"
        medium: "#DEE995"
        high: "#DEE995"
    }

    light: ColorSet {
        normal: "#DEE995"
        medium: "#707A33"
        high: "#454E09"
    }
}

property color primaryFixedDim 
property M3Color _primaryFixedDim: M3Color {
    dark: ColorSet {
        normal: "#C2CD7C"
        medium: "#C2CD7C"
        high: "#C2CD7C"
    }

    light: ColorSet {
        normal: "#C2CD7C"
        medium: "#505915"
        high: "#5D6621"
    }
}

property color whileOnPrimaryFixed 
property M3Color _whileOnPrimaryFixed: M3Color {
    dark: ColorSet {
        normal: "#191E00"
        medium: "#0F1300"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#191E00"
        medium: "#000000"
        high: "#000000"
    }
}

property color whileOnPrimaryFixedVariant 
property M3Color _whileOnPrimaryFixedVariant: M3Color {
    dark: ColorSet {
        normal: "#434B06"
        medium: "#323A00"
        high: "#0F1300"
    }

    light: ColorSet {
        normal: "#434B06"
        medium: "#000000"
        high: "#000000"
    }
}

property color secondaryFixed 
property M3Color _secondaryFixed: M3Color {
    dark: ColorSet {
        normal: "#E2E5C2"
        medium: "#E2E5C2"
        high: "#E2E5C2"
    }

    light: ColorSet {
        normal: "#E2E5C2"
        medium: "#747759"
        high: "#484B31"
    }
}

property color secondaryFixedDim 
property M3Color _secondaryFixedDim: M3Color {
    dark: ColorSet {
        normal: "#C6C9A7"
        medium: "#C6C9A7"
        high: "#C6C9A7"
    }

    light: ColorSet {
        normal: "#C6C9A7"
        medium: "#54573C"
        high: "#606347"
    }
}

property color whileOnSecondaryFixed 
property M3Color _whileOnSecondaryFixed: M3Color {
    dark: ColorSet {
        normal: "#1A1D07"
        medium: "#101301"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#1A1D07"
        medium: "#000000"
        high: "#000000"
    }
}

property color whileOnSecondaryFixedVariant 
property M3Color _whileOnSecondaryFixedVariant: M3Color {
    dark: ColorSet {
        normal: "#46492F"
        medium: "#35381F"
        high: "#101301"
    }

    light: ColorSet {
        normal: "#46492F"
        medium: "#000000"
        high: "#000000"
    }
}

property color tertiaryFixed 
property M3Color _tertiaryFixed: M3Color {
    dark: ColorSet {
        normal: "#BDECDE"
        medium: "#BDECDE"
        high: "#BDECDE"
    }

    light: ColorSet {
        normal: "#BDECDE"
        medium: "#517D71"
        high: "#255146"
    }
}

property color tertiaryFixedDim 
property M3Color _tertiaryFixedDim: M3Color {
    dark: ColorSet {
        normal: "#A2D0C2"
        medium: "#A2D0C2"
        high: "#A2D0C2"
    }

    light: ColorSet {
        normal: "#A2D0C2"
        medium: "#315D52"
        high: "#3D695E"
    }
}

property color whileOnTertiaryFixed 
property M3Color _whileOnTertiaryFixed: M3Color {
    dark: ColorSet {
        normal: "#00201A"
        medium: "#001510"
        high: "#000000"
    }

    light: ColorSet {
        normal: "#00201A"
        medium: "#000000"
        high: "#000000"
    }
}

property color whileOnTertiaryFixedVariant 
property M3Color _whileOnTertiaryFixedVariant: M3Color {
    dark: ColorSet {
        normal: "#224E44"
        medium: "#0E3D33"
        high: "#001510"
    }

    light: ColorSet {
        normal: "#224E44"
        medium: "#000000"
        high: "#000000"
    }
}

    Component.onCompleted: {
        primary_paletteKeyColor = Qt.binding(() => getColor(_primary_paletteKeyColor))
        secondary_paletteKeyColor = Qt.binding(() => getColor(_secondary_paletteKeyColor))
        tertiary_paletteKeyColor = Qt.binding(() => getColor(_tertiary_paletteKeyColor))
        neutral_paletteKeyColor = Qt.binding(() => getColor(_neutral_paletteKeyColor))
        neutral_variant_paletteKeyColor = Qt.binding(() => getColor(_neutral_variant_paletteKeyColor))
        background = Qt.binding(() => getColor(_background))
        whileOnBackground = Qt.binding(() => getColor(_whileOnBackground))
        surface = Qt.binding(() => getColor(_surface))
        surfaceDim = Qt.binding(() => getColor(_surfaceDim))
        surfaceBright = Qt.binding(() => getColor(_surfaceBright))
        surfaceContainerLowest = Qt.binding(() => getColor(_surfaceContainerLowest))
        surfaceContainerLow = Qt.binding(() => getColor(_surfaceContainerLow))
        surfaceContainer = Qt.binding(() => getColor(_surfaceContainer))
        surfaceContainerHigh = Qt.binding(() => getColor(_surfaceContainerHigh))
        surfaceContainerHighest = Qt.binding(() => getColor(_surfaceContainerHighest))
        whileOnSurface = Qt.binding(() => getColor(_whileOnSurface))
        surfaceVariant = Qt.binding(() => getColor(_surfaceVariant))
        whileOnSurfaceVariant = Qt.binding(() => getColor(_whileOnSurfaceVariant))
        inverseSurface = Qt.binding(() => getColor(_inverseSurface))
        inverseOnSurface = Qt.binding(() => getColor(_inverseOnSurface))
        outline = Qt.binding(() => getColor(_outline))
        outlineVariant = Qt.binding(() => getColor(_outlineVariant))
        shadow = Qt.binding(() => getColor(_shadow))
        scrim = Qt.binding(() => getColor(_scrim))
        surfaceTint = Qt.binding(() => getColor(_surfaceTint))
        primary = Qt.binding(() => getColor(_primary))
        whileOnPrimary = Qt.binding(() => getColor(_whileOnPrimary))
        primaryContainer = Qt.binding(() => getColor(_primaryContainer))
        whileOnPrimaryContainer = Qt.binding(() => getColor(_whileOnPrimaryContainer))
        inversePrimary = Qt.binding(() => getColor(_inversePrimary))
        secondary = Qt.binding(() => getColor(_secondary))
        whileOnSecondary = Qt.binding(() => getColor(_whileOnSecondary))
        secondaryContainer = Qt.binding(() => getColor(_secondaryContainer))
        whileOnSecondaryContainer = Qt.binding(() => getColor(_whileOnSecondaryContainer))
        tertiary = Qt.binding(() => getColor(_tertiary))
        whileOnTertiary = Qt.binding(() => getColor(_whileOnTertiary))
        tertiaryContainer = Qt.binding(() => getColor(_tertiaryContainer))
        whileOnTertiaryContainer = Qt.binding(() => getColor(_whileOnTertiaryContainer))
        error = Qt.binding(() => getColor(_error))
        whileOnError = Qt.binding(() => getColor(_whileOnError))
        errorContainer = Qt.binding(() => getColor(_errorContainer))
        whileOnErrorContainer = Qt.binding(() => getColor(_whileOnErrorContainer))
        primaryFixed = Qt.binding(() => getColor(_primaryFixed))
        primaryFixedDim = Qt.binding(() => getColor(_primaryFixedDim))
        whileOnPrimaryFixed = Qt.binding(() => getColor(_whileOnPrimaryFixed))
        whileOnPrimaryFixedVariant = Qt.binding(() => getColor(_whileOnPrimaryFixedVariant))
        secondaryFixed = Qt.binding(() => getColor(_secondaryFixed))
        secondaryFixedDim = Qt.binding(() => getColor(_secondaryFixedDim))
        whileOnSecondaryFixed = Qt.binding(() => getColor(_whileOnSecondaryFixed))
        whileOnSecondaryFixedVariant = Qt.binding(() => getColor(_whileOnSecondaryFixedVariant))
        tertiaryFixed = Qt.binding(() => getColor(_tertiaryFixed))
        tertiaryFixedDim = Qt.binding(() => getColor(_tertiaryFixedDim))
        whileOnTertiaryFixed = Qt.binding(() => getColor(_whileOnTertiaryFixed))
        whileOnTertiaryFixedVariant = Qt.binding(() => getColor(_whileOnTertiaryFixedVariant))
    }
}
