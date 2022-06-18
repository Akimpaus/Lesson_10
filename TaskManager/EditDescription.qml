import QtQuick 2.0

Flickable
{
    id: flick
    //property real visible_rect_width: 300
    //property real visible_rect_height: 100

    function getDescription()
    {
        return text_edit_description.text
    }

    function setDescription(description)
    {
        text_edit_description.text = description
    }

    Rectangle
    {
        width: flick.parent.width
        height: flick.contentHeight <= flick.parent.height ? flick.parent.height : flick.contentHeight
        color: "black"
        opacity: 0.3
    }

    width: 300;
    height: 100;
    //anchors.centerIn: parent
    contentWidth: text_edit_description.contentWidth
    contentHeight: text_edit_description.contentHeight
    clip: true

    function ensureVisible(r)
    {
     if (contentX >= r.x)
         contentX = r.x;
     else if (contentX+width <= r.x+r.width)
         contentX = r.x+r.width-width;
     if (contentY >= r.y)
         contentY = r.y;
     else if (contentY+height <= r.y+r.height)
         contentY = r.y+r.height-height;
    }


    TextEdit
    {
        id: text_edit_description
        property string placeholder_descriprtion: "Description"
        color: "white"
        width: flick.width
        focus: true
        font.pixelSize: 15
        wrapMode: TextEdit.Wrap
        onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)

        Text
        {
            anchors.centerIn: parent
            font.family: text_edit_description.font
            font.pointSize: text_edit_description.font.pixelSize
            text: text_edit_description.placeholder_descriprtion
            color: "#aaa"
            visible: !text_edit_description.text
        }
    }
}
