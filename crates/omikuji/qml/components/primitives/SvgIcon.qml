import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: icon

    property string name: ""
    property color color: "#ffffff"
    property int size: 20
    property bool _fillMissing: false

    onNameChanged: _fillMissing = false

    width: size
    height: size

    // does this even work? im blind, they all look blurry to me wtf
    layer.enabled: true
    layer.smooth: true
    layer.textureSize: Qt.size(size * 2, size * 2)

    Image {
        id: img
        anchors.fill: parent
        source: {
            if (!name) return ""
            let fill = theme.filledIcons && !icon._fillMissing && !name.endsWith("_fill")
            return "qrc:/qt/qml/omikuji/qml/icons/" + name + (fill ? "_fill" : "") + ".svg"
        }
        sourceSize: Qt.size(icon.size * 2, icon.size * 2)
        visible: false
        onStatusChanged: if (status === Image.Error && theme.filledIcons && !icon._fillMissing) Qt.callLater(function() { icon._fillMissing = true })
    }

    ColorOverlay {
        anchors.fill: img
        source: img
        color: icon.color
    }
}
