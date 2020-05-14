import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    id: time1
    color: "black"
    property int time1_val: 0
    property var time1_name: ""
    property int time1_hour_val: ( time1_val / 3600 ).toFixed(0)
    property int time1_min_val: ( time1_val - 3600 * time1_hour_val ) / 60
    property int time1_sec_val: time1_val % 60

    Timer {
        id: timer1
        interval: 1000
        repeat: true
        running: false
        onTriggered: time1.time1_val += 1
    }

    Rectangle {
        width: parent.width
        height: parent.height / 2
        color: "transparent"

        Rectangle {
            width: time1_hour.contentWidth + time1_min.contentWidth + time1_sec.contentWidth
            height: time1_hour.contentHeight
            anchors.centerIn: parent
            color: "transparent"

            Text {
                id: time1_hour
                text: {
                    if ( time1.time1_hour_val >= 10 ) {
                        return time1.time1_hour_val + ":"
                    }
                    else if ( time1.time1_hour_val > 0 ) {
                        return "0" + time1.time1_hour_val + ":"
                    }
                    else {
                        return "00" + ":"
                    }
                }
                color: "white"
                font.pixelSize: font_pix
            }

            Text {
                id: time1_min
                anchors.left: time1_hour.right
                text: {
                    if ( time1.time1_min_val >= 10 ) {
                        return time1.time1_min_val + ":"
                    }
                    else if ( time1.time1_min_val > 0 ) {
                        return "0" + time1.time1_min_val + ":"
                    }
                    else {
                        return "00" + ":"
                    }
                }
                color: "white"
                font.pixelSize: font_pix
            }

            Text {
                id: time1_sec
                anchors.left: time1_min.right
                text: {
                    if ( time1.time1_sec_val >= 10 ) {
                        return time1.time1_sec_val
                    }
                    else if ( time1.time1_sec_val > 0 ) {
                        return "0" + time1.time1_sec_val
                    }
                    else {
                        return "00"
                    }
                }
                color: "white"
                font.pixelSize: font_pix
            }
        }

        Rectangle {
            id: time1_name
            anchors.fill: parent
            color: "white"
            visible: false

            Text {
                id: time1_name_txt_old
                width: parent.width / 2
                height: parent.height
                anchors.centerIn: parent
                font.pixelSize: 30
                focus: false
                text: time1.time1_name
                horizontalAlignment: Text.AlignHCenter
                visible: true
            }

            TextInput {
                id: time1_name_txt_new
                width: parent.width / 2
                height: parent.height
                anchors.centerIn: parent
                font.pixelSize: 30
                focus: time1_name_txt_new.visible
                text: ""
                horizontalAlignment: Text.AlignHCenter
                visible: !time1_name_txt_old.visible
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                time1_name.visible = true
                time1_name_txt_new.text = time1_name_txt_old.text
            }
            onExited: {
                time1_name.visible = false
                time1_name_txt_old.visible = true
            }
            onClicked: {
                if (time1_name_txt_new.visible) {
                    time1.time1_name = time1_name_txt_new.text
                }
                time1_name_txt_old.visible = !time1_name_txt_old.visible
            }
        }
    }

    Rectangle {
        y: parent.height / 2
        width: parent.width
        height: parent.height / 2
        color: "transparent"

        Rectangle {
            id: time1_bottom1
            width: parent.width / 4
            height: parent.height / 2
            anchors.top: parent.top
            anchors.topMargin: parent.height / 4
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 16
            color: "gray"

            Text {
                anchors.centerIn: parent
                text: "start"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    parent.color = "white"
                    if ( !timer1.running )
                        timer1.restart()
                }
                onReleased: {
                    parent.color = "gray"
                }
            }
        }

        Rectangle {
            id: time1_bottom2
            width: parent.width / 4
            height: parent.height / 2
            anchors.top: parent.top
            anchors.topMargin: parent.height / 4
            anchors.left: time1_bottom1.right
            anchors.leftMargin: parent.width / 16
            color: "gray"

            Text {
                anchors.centerIn: parent
                text: "stop"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    parent.color = "white"
                    if ( timer1.running )
                        timer1.stop()
                }
                onReleased: {
                    parent.color = "gray"
                }
            }
        }

        Rectangle {
            id: time1_bottom3
            width: parent.width / 4
            height: parent.height / 2
            anchors.top: parent.top
            anchors.topMargin: parent.height / 4
            anchors.left: time1_bottom2.right
            anchors.leftMargin: parent.width / 16
            color: "gray"

            Text {
                anchors.centerIn: parent
                text: "reset"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    parent.color = "white"
                    if ( timer1.running )
                        timer1.stop()
                    time1.time1_val = 0
                }
                onReleased: {
                    parent.color = "gray"
                }
            }
        }
    }
}
