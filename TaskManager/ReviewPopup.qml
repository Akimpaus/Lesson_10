import QtQuick 2.0

MainPopup
{
    property int item_index: 0
    Row
    {
        spacing: 5
        x: parent.width / 2 - width / 2
        y: parent.height - height

        MainButton
        {
            text: "Remove"
            color_down: "dark red"
            color_not_down: "red"
            onClicked:
            {
                removeClicked()
            }
        }
        MainButton
        {
            text: "Close"
            onClicked:
            {
                closeClicked()
            }
        }
        MainButton
        {
            text: "Apply"
            color_down: "green"
            color_not_down: "light green"
            onClicked:
            {
                applyClicked()
            }
        }
    }

    signal removeClicked()
    signal closeClicked()
    signal applyClicked()
}
