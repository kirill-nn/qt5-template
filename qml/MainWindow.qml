import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 1400
    height: 900
    title: "Template"
    color: "#0E0E0E"
    font.family: "Inter"
    font.pixelSize: 13

    // ─────────────────────────────────────
    // TOP BAR
    // ─────────────────────────────────────
    Rectangle {
        id: topBar
        height: 56
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#121212"

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 24
            anchors.rightMargin: 24

            Label {
                text: "Template"
                color: "#B0B0B0"
                font.pixelSize: 18
                font.bold: true
            }

            Item { Layout.fillWidth: true }

            RowLayout {
                spacing: 8
                visible: true

                Rectangle {
                    width: 10; height: 10
                    radius: 5
                    color: "#4CAF50"
                }
                Label {
                    text: "Connected"
                    color: "#B0B0B0"
                    font.pixelSize: 12
                }
            }

            Button {
                flat: true
                background: null
                contentItem: RowLayout {
                    spacing: 8
                    Rectangle {
                        width: 32; height: 32
                        radius: 16
                        color: "#3D6DF0"
                        Label {
                            text: "AD"
                            color: "white"
                            anchors.centerIn: parent
                            font.bold: true
                        }
                    }
                    Label { text: "Administrator"; color: "#E0E0E0" }
                }
            }
        }

        Rectangle {
            height: 1
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            color: "#252525"
        }
    }

    // ─────────────────────────────────────
    // BOTTOM NAVIGATION BAR
    // ─────────────────────────────────────
    Rectangle {
        id: bottomNav
        height: 84
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#121212"
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: -4
            radius: 16
            color: "#40000000"
            samples: 25
        }

        property int currentIndex: 0

        RowLayout {
            anchors.centerIn: parent
            spacing: 32

            Repeater {
                model: [
                    { name: "Dashboard",  icon: "dashboard" },
                    { name: "Markets",    icon: "chart" },
                    { name: "Portfolio",  icon: "briefcase" },
                    { name: "Orders",     icon: "list" },
                    { name: "Settings",   icon: "gear" }
                ]

                delegate: MouseArea {
                    width: 80
                    height: 64
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    property bool isActive: bottomNav.currentIndex === index
                    property bool isHovered: false

                    onEntered: isHovered = true
                    onExited: isHovered = false
                    onClicked: bottomNav.currentIndex = index

                    Column {
                        anchors.centerIn: parent
                        spacing: 6

                        Rectangle {
                            width: 44; height: 44
                            radius: 10
                            color: isActive ? "#A0F27C" :
                                isHovered ? "#2A2A2A" : "#1E1E1E"
                            anchors.horizontalCenter: parent.horizontalCenter

                            Behavior on color { ColorAnimation { duration: 180 } }

                            Image {
                                source: Qt.resolvedUrl("qrc:/icons/" + modelData.icon + (isActive ? "-fill" : "") + ".svg")
                                width: 24; height: 24
                                anchors.centerIn: parent
                                sourceSize.width: 48
                                sourceSize.height: 48
                            }
                        }

                        Label {
                            text: modelData.name
                            color: isActive ? "#FFFFFF" :
                                isHovered ? "#AAAAAA" : "#666666"
                            font.pixelSize: 11
                            font.weight: isActive ? Font.Medium : Font.Normal
                            anchors.horizontalCenter: parent.horizontalCenter

                            Behavior on color { ColorAnimation { duration: 180 } }
                        }
                    }
                }
            }
        }
    }

    // ─────────────────────────────────────
    // MAIN CONTENT AREA
    // ─────────────────────────────────────
    Rectangle {
        anchors.top: topBar.bottom
        anchors.bottom: bottomNav.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#0E0E0E"
        anchors.margins: 24

        radius: 16
        layer.enabled: true
        layer.effect: DropShadow {
            radius: 32
            samples: 48
            color: "#40000000"
            verticalOffset: 8
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            radius: parent.radius
            color: "#121212"
        }

        Label {
            text: "Main Content Area"
            color: "#555555"
            font.pixelSize: 28
            font.weight: Font.Light
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
        }
    }
}