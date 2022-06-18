import QtQml 2.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import Date 1.0
import Qt.labs.settings 1.0


ApplicationWindow
{
    title: qsTr("Task manager")
    id: window
    visible: true

    minimumWidth: 480
    minimumHeight: 640

    width: minimumWidth
    height: minimumHeight


    property string datastore: ""

    Component.onCompleted: {
      if (datastore)
      {
        task_list.clear()
        var datamodel = JSON.parse(datastore)
        for (var i = 0; i < datamodel.length; ++i)
        {
            task_list.add(datamodel[i])
        }
      }
    }

    onClosing:
    {
      var datamodel = []
      for (var i = 0; i < task_list.total; ++i)
      {
          datamodel.push(task_list.get(i))
      }
      datastore = JSON.stringify(datamodel)
    }

    Settings
    {
      property alias datastore: window.datastore
    }



    TaskList
    {
        id: task_list

        onItemClicked:
        {
            review_popup.item_index = index
            review_popup.setName(name)
            review_popup.setDescription(description)
            review_popup.setProgress(progress)
            review_popup.setDedline(deadline)
            review_popup.open()
        }
    }


    AddPopup
    {
        id: add_popup

        onClosed:
        {
            clearEdits()
        }

        onCancelClicked:
        {
            close()
        }

        onApplyClicked:
        {
            var name = getName()
            var deadline = getDeadline()
            if(name && deadline)
            {
                task_list.add({
                                item_name        : name,
                                item_description : getDescription(),
                                item_progress    : getProgress(),
                                item_deadline    : deadline
                              })
                close()
            }
        }
    }

    ReviewPopup
    {
        id: review_popup

        onClosed:
        {
            clearEdits()
        }

        onRemoveClicked:
        {
            task_list.remove(item_index)
            close()
        }

        onCloseClicked:
        {
            close()
        }

        onApplyClicked:
        {
            var name = getName()
            var deadline = getDeadline()

            if(name && deadline)
            {
                task_list.set(item_index,
                              {
                                item_name        : getName(),
                                item_description : getDescription(),
                                item_progress    : getProgress(),
                                item_deadline    : getDeadline()
                              })
                close()
            }
        }

    }

    Date
    {
        id: date
    }

    BottomBar
    {
        id: bottom_bar
        total: task_list.total
        clear_visible: total > 0 ? true : false

        onClearClicked:
        {
            task_list.clear()
        }

        onAddClicked:
        {
            add_popup.setDedline(date.getCurrentDate())
            add_popup.open()
        }
    }

}
