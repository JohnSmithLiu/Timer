import QtQuick 2.12
import QtQuick.Window 2.12

import Myjson 1.0

Window {
    visible: true
    width: 640
    height: 500
    title: qsTr("猫儿儿专用计时器")
    property int font_pix: 30
    property int timer1_val: time1.time1_val
    property var timer1_name: time1.time1_name
    property bool timer1_name_init: false
    property int timer2_val: time2.time1_val
    property var timer2_name: time2.time1_name
    property bool timer2_name_init: false
    property int timer3_val: time3.time1_val
    property var timer3_name: time3.time1_name
    property bool timer3_name_init: false
    property int timer4_val: time4.time1_val
    property var timer4_name: time4.time1_name
    property bool timer4_name_init: false
    property int timer5_val: time5.time1_val
    property var timer5_name: time5.time1_name
    property bool timer5_name_init: false
    property int timer6_val: time6.time1_val
    property var timer6_name: time6.time1_name
    property bool timer6_name_init: false
    property int timer7_val: time7.time1_val
    property var timer7_name: time7.time1_name
    property bool timer7_name_init: false
    property int timer8_val: time8.time1_val
    property var timer8_name: time8.time1_name
    property bool timer8_name_init: false
    property int timer9_val: time9.time1_val
    property var timer9_name: time9.time1_name
    property bool timer9_name_init: false
    property int timer10_val: time10.time1_val
    property var timer10_name: time10.time1_name
    property bool timer10_name_init: false

    onTimer1_valChanged: {
        myjson.saveTimeValToJson(timer1_val, 1)
    }

    onTimer1_nameChanged: {
        if (!timer1_name_init) {
            timer1_name_init = !timer1_name_init
            return
        }
        myjson.saveTimeNameToJson(timer1_name, 1)
    }

    onTimer2_valChanged: {
        myjson.saveTimeValToJson(timer2_val, 2)
    }

    onTimer2_nameChanged: {
        if (!timer2_name_init) {
            timer2_name_init = !timer2_name_init
            return
        }
        myjson.saveTimeNameToJson(timer2_name, 2)
    }

    onTimer3_valChanged: {
        myjson.saveTimeValToJson(timer3_val, 3)
    }

    onTimer3_nameChanged: {
        if (!timer3_name_init) {
            timer3_name_init = !timer3_name_init
            return
        }
        myjson.saveTimeNameToJson(timer3_name, 3)
    }

    onTimer4_valChanged: {
        myjson.saveTimeValToJson(timer4_val, 4)
    }

    onTimer4_nameChanged: {
        if (!timer4_name_init) {
            timer4_name_init = !timer4_name_init
            return
        }
        myjson.saveTimeNameToJson(timer4_name, 4)
    }

    onTimer5_valChanged: {
        myjson.saveTimeValToJson(timer5_val, 5)
    }

    onTimer5_nameChanged: {
        if (!timer5_name_init) {
            timer5_name_init = !timer5_name_init
            return
        }
        myjson.saveTimeNameToJson(timer5_name, 5)
    }

    onTimer6_valChanged: {
        myjson.saveTimeValToJson(timer6_val, 6)
    }

    onTimer6_nameChanged: {
        if (!timer6_name_init) {
            timer6_name_init = !timer6_name_init
            return
        }
        myjson.saveTimeNameToJson(timer6_name, 6)
    }

    onTimer7_valChanged: {
        myjson.saveTimeValToJson(timer7_val, 7)
    }

    onTimer7_nameChanged: {
        if (!timer7_name_init) {
            timer7_name_init = !timer7_name_init
            return
        }
        myjson.saveTimeNameToJson(timer7_name, 7)
    }

    onTimer8_valChanged: {
        myjson.saveTimeValToJson(timer8_val, 8)
    }

    onTimer8_nameChanged: {
        if (!timer8_name_init) {
            timer8_name_init = !timer8_name_init
            return
        }
        myjson.saveTimeNameToJson(timer8_name, 8)
    }

    onTimer9_valChanged: {
        myjson.saveTimeValToJson(timer9_val, 9)
    }

    onTimer9_nameChanged: {
        if (!timer9_name_init) {
            timer9_name_init = !timer9_name_init
            return
        }
        myjson.saveTimeNameToJson(timer9_name, 9)
    }

    onTimer10_valChanged: {
        myjson.saveTimeValToJson(timer10_val, 10)
    }

    onTimer10_nameChanged: {
        if (!timer10_name_init) {
            timer10_name_init = !timer10_name_init
            return
        }
        myjson.saveTimeNameToJson(timer10_name, 10)
    }

    Myjson {
        id: myjson
    }

    MyTimer {
        id: time1
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time2
        y: height
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time3
        y: height * 2
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time4
        y: height * 3
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time5
        y: height * 4
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time6
        x: width
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time7
        x: width
        y: height
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time8
        x: width
        y: height * 2
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time9
        x: width
        y: height * 3
        width: parent.width / 2
        height: parent.height / 5
    }

    MyTimer {
        id: time10
        x: width
        y: height * 4
        width: parent.width / 2
        height: parent.height / 5
    }

    Component.onCompleted: {
        time1.time1_val = myjson.getTimeValFromJson(1);
        time1.time1_name = myjson.getTimeNameFromJson(1);
        time2.time1_val = myjson.getTimeValFromJson(2);
        time2.time1_name = myjson.getTimeNameFromJson(2);
        time3.time1_val = myjson.getTimeValFromJson(3);
        time3.time1_name = myjson.getTimeNameFromJson(3);
        time4.time1_val = myjson.getTimeValFromJson(4);
        time4.time1_name = myjson.getTimeNameFromJson(4);
        time5.time1_val = myjson.getTimeValFromJson(5);
        time5.time1_name = myjson.getTimeNameFromJson(5);
        time6.time1_val = myjson.getTimeValFromJson(6);
        time6.time1_name = myjson.getTimeNameFromJson(6);
        time7.time1_val = myjson.getTimeValFromJson(7);
        time7.time1_name = myjson.getTimeNameFromJson(7);
        time8.time1_val = myjson.getTimeValFromJson(8);
        time8.time1_name = myjson.getTimeNameFromJson(8);
        time9.time1_val = myjson.getTimeValFromJson(9);
        time9.time1_name = myjson.getTimeNameFromJson(9);
        time10.time1_val = myjson.getTimeValFromJson(10);
        time10.time1_name = myjson.getTimeNameFromJson(10);
    }
}
