import QtQuick 2.0
import QtQuick.Controls 2.15


Item
{
    property int total: 0
    property bool clear_visible: true

    height: 45
    anchors
    {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    Rectangle
    {
        id: background_rect
        height: parent.height

        anchors
        {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: "#171717"
    }

    Text
    {
        text: "Total: " + total
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 25
        color: "white"

    }

    Row
    {
        spacing: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 10
        MainButton
        {
            id: button_clear
            visible: clear_visible
            text: "Clear"
            color_down: "dark red"
            color_not_down: "red"
            anchors.verticalCenter: parent.verticalCenter

            onClicked:
            {
                clearClicked()
            }

        }
        MainButton
        {
            id: button_add
            text: "Add"
            color_down: "green"
            color_not_down: "light green"
            anchors.verticalCenter: parent.verticalCenter

            onClicked:
            {
                addClicked()
            }
        }
    }



    signal clearClicked()
    signal addClicked()

}
