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

import QtQuick 2.0
import QtApplicationManager 1.0

/*!
    \qmltype NotificationInterface
    \inqmlmodule service
    \inherits Notification
    \brief An interface for requesting notifications.

    NotificationInterface inherits \l {Notification} from \l{Qt Application Manager}
    and acts like an adapter for Neptune UI.
    The NotificationInterface properties \c timeout and \c category are adopted
    to match Neptune UI requirements and should not be used. In the Neptune UI
    interaction, notifications should always be dismissed by an end user
    instead of a time-out.

    \section2 Example Usage

    The following example demonstrates the NotificationInterface usage:

    \qml

    NotificationInterface {
        summary: "Notification Prio 9"
        body: "Notification sample"
        priority: 9
        icon: Style.symbolM("maps")
    }
    \endqml

    \c summary defines a notification title. \c body defines a notification
    description. Notifications are queued based on a value in \c priority.
    \c icon must contain an absolute icon path. Otherwise, the icon is not shown.
*/

Notification {
    id: root

    timeout: 0
    category: "notification"
}
