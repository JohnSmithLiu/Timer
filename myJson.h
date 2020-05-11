#ifndef MYJSON_H
#define MYJSON_H

#include <QObject>

#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>
#include <QFile>
#include <QFileInfo>

class Myjson : public QObject
{
    Q_OBJECT;
public:
    Myjson();
    ~Myjson();
    Q_INVOKABLE int getTimeValFromJson(int timer_index);
    Q_INVOKABLE QString getTimeNameFromJson(int timer_index);
    Q_INVOKABLE void saveTimeValToJson(int timer_val, int timer_index);
    Q_INVOKABLE void saveTimeNameToJson(QString timer_name, int timer_index);

private:
    int timerVal[10];
    QString timerName[10];
    void createJson();
};

#endif // MYJSON_H
