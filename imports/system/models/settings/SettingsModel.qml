/****************************************************************************
**
** Copyright (C) 2017 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

pragma Singleton
import QtQuick 2.6
import animations 1.0

QtObject {
    id: root

    property bool settingsPageVisible: false
    property bool clusterVisible: true
    property string unitSystem: "metric"  // "metric" or "imp_us"
    readonly property bool metric: unitSystem === "metric"

    readonly property ListModel profiles: ListModel {
        ListElement { name: "Driver 1" }
        ListElement { name: "Driver 2" }
        ListElement { name: "Driver 3" }
        ListElement { name: "Driver 4" }
    }
    property int currentProfileIndex: 0

    readonly property ListModel languages: ListModel {
        ListElement { name: "en_GB" }
        ListElement { name: "en_US" }
        ListElement { name: "in_ID" }
        ListElement { name: "de_DE" }
    }
    property int currentLanguageIndex: 0

    readonly property ListModel windowTransitions: ListModel {
        ListElement { name: "Zoom" }
        ListElement { name: "Tumble" }
    }

    property Component zoomTransition: Zoom {}
    property Component tumbleTransition: Tumble {}

    property bool appUpdatesEnabled: false
    property bool liveTrafficEnabled: false
    property bool satelliteViewEnabled: false

    property int windowTransitionsIndex: 0

    property ListModel entries: ListModel {
        ListElement { title: "USER PROFILE"; icon: "profile"; checked: true; hasChildren: true; hasCheck: true }
        ListElement { title: "SERVICE & SUPPORT"; icon: "service"; checked: false; hasChildren: false }
        ListElement { title: "TRAFFIC INFORMATION"; icon: "warning"; checked: true; hasChildren: true }
        ListElement { title: "TOLL & CONGESTION FEES"; icon: "toll"; checked: false; hasChildren: true }
        ListElement { title: "METRIC SYSTEM"; icon: "fees"; checked: true; hasChildren: false }
        ListElement { title: "APP UPDATES"; icon: "updates"; checked: true; hasChildren: true }
        ListElement { title: "SYSTEM MONITOR"; icon: "insurance"; checked: false; hasChildren: true }
    }

    property var carSettings: [
        { section: "Units", option: clockOption },
        { section: "Units", option: speedOption },
        { section: "Communication", option: bluetoothOption }
    ]

    property var clockOption: QtObject {
        property string format: active === 0 ? "hh:mm" : "h:mm AP"
        property var options: ['24H', 'AM/PM']
        property string name: "Time"
        property int active: 0

        function setActive(index) { active = index }
    }

    property var speedOption: QtObject {
        property var options: ['KMH', 'MPH']
        property string name: "Speed"
        property int active: 0

        function setActive(index) { active = index }
    }

    property var bluetoothOption: QtObject {

        property string name: "Bluetooth"
        property bool active: false

        function setActive(value) { active = value }
    }

    property ListModel functions: ListModel {
        ListElement {
            description: "hill_descent_control_id"
            icon: "hill_descent_control"
            active: true
        }
        ListElement {
            description: "intelligent_speed_adaptation_id"
            icon: "intelligent_speed_adaptation"
            active: false
        }
        ListElement {
            description: "automatic_beam_switching_id"
            icon: "automatic_beam_switching"
            active: true
        }
        ListElement {
            description: "collision_avoidance_id"
            icon: "collision_avoidance"
            active: false
        }
        ListElement {
            description: "lane_assist_id"
            icon: "lane_keeping_assist"
            active: false
        }
        ListElement {
            description: "traffic_jam_assist_id"
            icon: "traffic_jam_assist"
            active: false
        }
        ListElement {
            description: "driver_drowsiness_alert_id"
            icon: "driver_drownsyness_alert"
            active: true
        }
        ListElement {
            description: "park_assist_id"
            icon: "park_assist"
            active: false
        }
    }
}
