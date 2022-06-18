import QtQuick 2.15
import QtQuick.Controls 2.15

ScrollView
{
    id: scroll_view
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

    function clear()
    {
        list_model.clear()
    }

    function add(item)
    {
        list_model.append(item)
    }

    function remove(index)
    {
        list_model.remove(index)
    }

    function set(index, object)
    {
        list_model.set(index, object);
    }

    function get(index)
    {
        return list_model.get(index)
    }

    property int total: list_model.count

    anchors
    {
        left: parent.left
        right: parent.right
        top: parent.top
        bottom: bottom_bar.top
    }

    ListView
    {
        id: list_view
        anchors.fill: parent

        spacing: 3

        delegate: ItemDelegate
        {

            id: item

            text: item_name
            property string text_description: item_description
            property int value_progress: item_progress
            property string text_deadline: item_deadline

            width: scroll_view.width

            ProgressBar
            {
                width: parent.width
                value: value_progress / 100
            }


            Text
            {
                text: item_deadline
                color: "white"
                font.pixelSize: 15
                anchors
                {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    rightMargin: 10
                }
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle
            {
                width: parent.width
                height: parent.height
                color: "black"
                opacity: 0.3

            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    itemClicked(index, item_name, item_description, item_progress, item_deadline)
                }
            }
        }

        model: ListModel
        {
            id: list_model
        }
    }


    signal itemClicked(int index, string name, string description, int progress, string deadline)
}
