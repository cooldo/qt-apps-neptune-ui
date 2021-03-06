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

#ifndef NEPTUNESTYLE_H
#define NEPTUNESTYLE_H

#include <QtGui/QColor>
#include <QtCore/QSharedPointer>
#include <QtCore/QScopedPointer>

QT_FORWARD_DECLARE_CLASS(QSettings)

class StyleData;

#if QT_VERSION >= QT_VERSION_CHECK(5, 10, 0)
#include <QtQuickControls2/private/qquickattachedobject_p.h>

class NeptuneStyle : public QQuickAttachedObject
#else
#include <QtQuickControls2/private/qquickstyleattached_p.h>

class NeptuneStyle : public QQuickStyleAttached
#endif
{
    Q_OBJECT
    Q_PROPERTY(QColor darkColor READ darkColor NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(QColor brightColor READ brightColor NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(QColor accentColor READ accentColor NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(QColor positiveColor READ positiveColor NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(QColor negativeColor READ negativeColor NOTIFY neptuneStyleChanged FINAL)

    Q_PROPERTY(int fontSizeXXS READ fontSizeXXS NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontSizeXS READ fontSizeXS NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontSizeS READ fontSizeS NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontSizeM READ fontSizeM NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontSizeL READ fontSizeL NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontSizeXL READ fontSizeXL NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontSizeXXL READ fontSizeXXL NOTIFY neptuneStyleChanged FINAL)

    Q_PROPERTY(QString fontFamily READ fontFamily NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(int fontFactor READ fontFactor NOTIFY neptuneStyleChanged FINAL)

    Q_PROPERTY(qreal cellWidth READ cellWidth NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(qreal cellHeight READ cellHeight NOTIFY neptuneStyleChanged FINAL)

    Q_PROPERTY(qreal windowWidth READ windowWidth NOTIFY neptuneStyleChanged FINAL)
    Q_PROPERTY(qreal windowHeight READ windowHeight NOTIFY neptuneStyleChanged FINAL)

    Q_PROPERTY(QString backgroundImage READ backgroundImage NOTIFY neptuneStyleChanged)

public:
    explicit NeptuneStyle(QObject *parent = nullptr);
    virtual ~NeptuneStyle();

    static NeptuneStyle *qmlAttachedProperties(QObject *object);

    enum Theme { Light, Dark };
    Q_ENUM(Theme)

    enum SystemColor {
        DarkColor,
        BrightColor,
        AccentColor,
        PositiveColor,
        NegativeColor
    };
    Q_ENUM(SystemColor)

    QColor systemColor(SystemColor role) const;
    QColor darkColor() const;
    QColor brightColor() const;
    QColor accentColor() const;
    QColor positiveColor() const;
    QColor negativeColor() const;

    int fontSizeXXS() const;
    int fontSizeXS() const;
    int fontSizeS() const;
    int fontSizeM() const;
    int fontSizeL() const;
    int fontSizeXL() const;
    int fontSizeXXL() const;

    Q_INVOKABLE QColor lighter25(const QColor& color);
    Q_INVOKABLE QColor lighter50(const QColor& color);
    Q_INVOKABLE QColor lighter75(const QColor& color);
    Q_INVOKABLE QColor darker25(const QColor& color);
    Q_INVOKABLE QColor darker50(const QColor& color);
    Q_INVOKABLE QColor darker75(const QColor& color);

    qreal cellWidth() const;
    qreal cellHeight() const;

    QString backgroundImage() const;

    QString fontFamily() const;
    int fontFactor() const;

    qreal windowWidth() const;

    qreal windowHeight() const;

protected:
    void init();
signals:
    void neptuneStyleChanged();

private:
    QScopedPointer<StyleData> m_data;
    qreal m_windowWidth;

    qreal m_windowHeight;

protected:
#if QT_VERSION >= QT_VERSION_CHECK(5, 10, 0)
    void attachedParentChange(QQuickAttachedObject *newParent, QQuickAttachedObject *oldParent);
#else
    void parentStyleChange(QQuickStyleAttached *newParent, QQuickStyleAttached *oldParent);
#endif
    void inheritStyle(const StyleData &data);
    void propagateStyle(const StyleData &data);
    void resolveGlobalThemeData(const QSharedPointer<QSettings> &settings);
};

QML_DECLARE_TYPEINFO(NeptuneStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif // NEPTUNESTYLE_H
