import QtQuick 2.6
import QtQuick.Controls 2.1

Button
{

    property color color_down: "gray"
    property color color_not_down: "white"

    height: 40
    width: 75

    contentItem: Text
    {
        text: parent.text
        font: parent.font
        opacity: enabled ? 1.0 : 0.3
        color: parent.down ? color_down : color_not_down
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

}
