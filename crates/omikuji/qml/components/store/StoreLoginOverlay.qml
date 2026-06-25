import QtQuick

import "../widgets"

Item {
    id: root

    property string iconName: ""
    property string title: ""
    property string description: ""
    property string loginUrl: ""
    property string toolName: ""
    property bool toolReady: true
    property bool toolInstalling: false

    signal loginRequested(string code)
    signal installToolRequested()

    anchors.fill: parent
    z: 100

    Column {
        anchors.centerIn: parent
        width: 400
        spacing: theme.space.xl

        SvgIcon {
            anchors.horizontalCenter: parent.horizontalCenter
            name: root.iconName
            size: 64
            color: theme.text
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: root.title
            color: theme.text
            font.pixelSize: 20
            font.weight: Font.Bold
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            text: root.description
            color: theme.textMuted
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Open Login Page"
            color: linkMouseArea.containsMouse ? Qt.lighter(theme.accent, 1.1) : theme.accent
            font.pixelSize: 14
            font.weight: Font.DemiBold
            Behavior on color { ColorAnimation { duration: theme.dur.xfast } }

            MouseArea {
                id: linkMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: Qt.openUrlExternally(root.loginUrl)
            }
        }

        M3TextField {
            id: loginCodeField
            width: parent.width
            placeholder: "Paste authorization code here..."
            onTextEdited: (t) => loginCodeField.text = t
        }

        M3Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 160
            height: 44
            text: "Login"
            enabled: root.toolReady && loginCodeField.text.length > 0
            onClicked: {
                root.loginRequested(loginCodeField.text)
                loginCodeField.text = ""
            }
        }

        Column {
            visible: !root.toolReady
            width: parent.width
            spacing: theme.space.sm

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                text: root.toolInstalling
                    ? "Installing " + root.toolName + "..."
                    : "No " + root.toolName + " found. Install it to log in."
                color: theme.textMuted
                font.pixelSize: 13
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
            }

            M3Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                text: "Install " + root.toolName
                variant: "tonal"
                enabled: !root.toolInstalling
                onClicked: root.installToolRequested()
            }
        }
    }
}
