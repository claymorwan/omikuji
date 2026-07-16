import QtQuick

Text {
    id: root

    property string source: ""
    property var resolver: null

    readonly property bool active: resolver !== null && source.indexOf("${") !== -1

    visible: active
    text: active ? resolver(source) : ""
    color: theme.accent
    font.pixelSize: 11
    font.family: "monospace"
    elide: Text.ElideMiddle
}
