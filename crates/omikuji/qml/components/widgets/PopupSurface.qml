import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    color: theme.active.window.hslLightness > 0.5
        ? Qt.darker(theme.popup, 1.06)
        : Qt.lighter(theme.popup, 1.3)
    radius: theme.radius.md
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 0
        verticalOffset: 3
        radius: 16
        samples: 33
        color: Qt.rgba(0, 0, 0, 0.35)
    }
}
