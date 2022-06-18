#ifndef DATE_H
#define DATE_H

#include <QObject>

class Date : public QObject
{

    Q_OBJECT

public:

    explicit Date(QObject *parent = nullptr);

    Q_INVOKABLE QString getCurrentDate();

signals:

};

#endif // DATE_H
