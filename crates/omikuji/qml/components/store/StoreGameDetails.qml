import QtQuick
import QtQuick.Layouts
import "../downloads"

ColumnLayout {
    id: root

    property var details: null
    property string kind: "about"

    readonly property var reqs: details && details.reqs ? details.reqs : []
    readonly property string description: details && details.description ? details.description : ""
    readonly property bool hasRec: {
        for (let i = 0; i < reqs.length; i++) {
            if (reqs[i].recommended && reqs[i].recommended !== "") return true
        }
        return false
    }

    spacing: theme.space.md

    CapsLabel {
        text: root.kind === "about" ? qsTr("About") : qsTr("System requirements")
    }

    Text {
        visible: root.kind === "about"
        Layout.fillWidth: true
        text: root.description
        color: theme.textMuted
        font.pixelSize: theme.type.label.size
        wrapMode: Text.WordWrap
        textFormat: Text.PlainText
    }

    GridLayout {
        visible: root.kind === "reqs"
        Layout.fillWidth: true
        flow: GridLayout.TopToBottom
        rows: root.reqs.length + 1
        columnSpacing: theme.space.lg
        rowSpacing: theme.space.sm

        Item { Layout.preferredWidth: 1; Layout.preferredHeight: 1 }

        Repeater {
            model: root.kind === "reqs" ? root.reqs : []

            Text {
                required property var modelData
                Layout.alignment: Qt.AlignTop
                text: modelData.title
                color: theme.textSubtle
                font.pixelSize: theme.type.caption.size
            }
        }

        Text {
            Layout.alignment: Qt.AlignTop
            text: qsTr("Minimum")
            color: theme.text
            font.pixelSize: theme.type.caption.size
            font.weight: Font.Medium
        }

        Repeater {
            model: root.kind === "reqs" ? root.reqs : []

            Text {
                required property var modelData
                Layout.fillWidth: true
                Layout.preferredWidth: 10
                Layout.alignment: Qt.AlignTop
                text: modelData.minimum
                color: theme.textMuted
                font.pixelSize: theme.type.caption.size
                wrapMode: Text.WordWrap
            }
        }

        Text {
            visible: root.hasRec
            Layout.alignment: Qt.AlignTop
            text: qsTr("Recommended")
            color: theme.text
            font.pixelSize: theme.type.caption.size
            font.weight: Font.Medium
        }

        Repeater {
            model: (root.kind === "reqs" && root.hasRec) ? root.reqs : []

            Text {
                required property var modelData
                Layout.fillWidth: true
                Layout.preferredWidth: 10
                Layout.alignment: Qt.AlignTop
                text: modelData.recommended
                color: theme.textMuted
                font.pixelSize: theme.type.caption.size
                wrapMode: Text.WordWrap
            }
        }
    }
}
