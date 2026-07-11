import QtQuick

Text {
    property real size: 10

    color: theme.textSubtle
    font.pixelSize: size
    font.weight: Font.DemiBold
    font.capitalization: Font.AllUppercase
    font.letterSpacing: 1
    textFormat: Text.PlainText
}
