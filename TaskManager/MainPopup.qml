import QtQuick 2.15
import QtQuick.Controls 2.15

Popup
{
    id: root_popup
    anchors.centerIn: parent
    width: parent.width / 1.2
    height: parent.height / 1.2
    modal: true
    focus: true
    closePolicy: "NoAutoClose"

    function getName()
    {
        return edit_name.getName()
    }

    function getDescription()
    {
        return edit_description.getDescription()
    }

    function getProgress()
    {
        return edit_progress.value * 100
    }

    function getDeadline()
    {
        return edit_deadline.text
    }

    function setName(name)
    {
        edit_name.setName(name)
    }

    function setDescription(description)
    {
        edit_description.setDescription(description)
    }

    function setProgress(progress)
    {
        edit_progress.value = progress / 100
    }

    function setDedline(deadline)
    {
        edit_deadline.text = deadline
    }

    function clearEdits()
    {
        setName("")
        setDescription("")
        setProgress(0)
        setDedline("")
    }

    Column
    {
        spacing: 5
        anchors.centerIn: parent
        width: parent.width

        EditName
        {
            id: edit_name
            width: parent.width
        }

        EditDescription
        {
            id: edit_description
            width: parent.width
        }


        Text
        {
            text: "Progress: " + parseInt(edit_progress.value * 100) + "%"
            width: parent.width
            font.pixelSize: 20
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Slider
        {
            id: edit_progress
            width: parent.width
            value: 0
        }


        Text
        {
            text: "Deadline: "
            width: parent.width
            font.pixelSize: 20
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        TextField
        {
            id: edit_deadline
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            validator: RegularExpressionValidator
            {
                regularExpression: /[0-3][0-9]\.[0-1][0-9]\.\d{4}/
            }
        }

    }
}
