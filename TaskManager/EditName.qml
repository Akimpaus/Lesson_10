import QtQuick 2.15
import QtQuick.Controls 2.15

TextField
{

    function getName()
    {
        return field_name_text_edit.text
    }


    function setName(name)
    {
        field_name_text_edit.text = name
    }


    id: field_name_text_edit

    property string placeholder: "Short name"


    horizontalAlignment: TextEdit.AlignHCenter
    verticalAlignment: TextEdit.AlignVCenter

    color: "white"

    validator: RegularExpressionValidator
    {
        regularExpression: /.{0,30}/
    }

    Text
    {
        anchors.centerIn: parent
        font.family: parent.font
        font.pointSize: parent.font.pixelSize
        text: parent.placeholder
        color: "#aaa"
        visible: !parent.text
    }
}
