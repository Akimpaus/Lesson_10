import QtQuick 2.0

MainPopup
{
    Row
    {
        spacing: 5
        x: parent.width / 2 - width / 2
        y: parent.height - height

        MainButton
        {
            text: "Cancel"
            onClicked:
            {
                cancelClicked()
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

    signal cancelClicked()
    signal applyClicked()
}
