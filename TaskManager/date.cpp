#include "date.h"
#include <QDate>

Date::Date(QObject *parent) : QObject(parent)
{

}

QString Date::getCurrentDate()
{
    return QDate::currentDate().toString("dd.MM.yyyy");
}
