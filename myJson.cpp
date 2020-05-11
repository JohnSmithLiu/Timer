#include "myJson.h"
#include <QDebug>

Myjson::Myjson()
{
    QFileInfo fi("timer.json");
    if (!fi.isFile()) {
        createJson();
    }

    QFile myJsonFile("timer.json");

    if (!myJsonFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "could't open projects json";
        return;
    }

    QString value = myJsonFile.readAll();

    myJsonFile.close();

    QJsonParseError parseJsonErr;
    QJsonDocument document = QJsonDocument::fromJson(value.toUtf8(),&parseJsonErr);
    if(!(parseJsonErr.error == QJsonParseError::NoError))
    {
        qDebug()<<tr("解析json文件错误！");
        return;
    }
    QJsonObject jsonObject = document.object();

    if(jsonObject.contains(QStringLiteral("recoveryPrimaryNode")))
    {
        QJsonValue arrayValue = jsonObject.value(QStringLiteral("recoveryPrimaryNode"));
        if(arrayValue.isArray())
        {
            QJsonArray array = arrayValue.toArray();
            for(int i=0;i<array.size();i++)
            {
                QJsonValue iconArray = array.at(i);
                QJsonObject icon = iconArray.toObject();
                int id = icon["id"].toString().toInt();
                timerVal[id-1] = icon["timerVal"].toString().toInt();
                timerName[id-1] = icon["timerName"].toString();
                qDebug()<<"id="<<id<<"iconTxt="<<timerVal[id-1]<<"iconName="<<timerName[id-1];
            }
        }
    }
}

Myjson::~Myjson()
{

}

int Myjson::getTimeValFromJson(int timer_index)
{
    return timerVal[timer_index-1];
}

QString Myjson::getTimeNameFromJson(int timer_index)
{
    return  timerName[timer_index-1];
}

void Myjson::saveTimeValToJson(int timer_val, int timer_index)
{
    timerVal[timer_index-1] = timer_val;

    QJsonObject object;
    QJsonObject subobject;
    QJsonArray jsonArray;

    for(int i=0;i<10;i++)
    {
        subobject.insert("id", QJsonValue(QString::number(i+1)));
        subobject.insert("timerVal", QJsonValue(QString::number(timerVal[i])));
        subobject.insert("timerName", QJsonValue(timerName[i]));
        jsonArray.append(subobject);
    }

    object.insert("recoveryPrimaryNode", QJsonValue(jsonArray));

    QJsonDocument doc(object);

    QByteArray data=doc.toJson();
    QFile myJsonFile("timer.json");

    if (!myJsonFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "could't open projects json";
        return;
    }

    myJsonFile.resize(0);
    myJsonFile.write(data);
    myJsonFile.close();
}

void Myjson::saveTimeNameToJson(QString timer_name, int timer_index)
{
    timerName[timer_index-1] = timer_name;

    QJsonObject object;
    QJsonObject subobject;
    QJsonArray jsonArray;

    for(int i=0;i<10;i++)
    {
        subobject.insert("id", QJsonValue(QString::number(i+1)));
        subobject.insert("timerVal", QJsonValue(QString::number(timerVal[i])));
        subobject.insert("timerName", QJsonValue(timerName[i]));
        jsonArray.append(subobject);
    }

    object.insert("recoveryPrimaryNode", QJsonValue(jsonArray));

    QJsonDocument doc(object);

    QByteArray data=doc.toJson();
    QFile myJsonFile("timer.json");

    if (!myJsonFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "could't open projects json";
        return;
    }

    myJsonFile.resize(0);
    myJsonFile.write(data);
    myJsonFile.close();
}

void Myjson::createJson()
{
    QJsonObject object;
    QJsonObject subobject;
    QJsonArray jsonArray;

    for(int i=0;i<10;i++)
    {
        subobject.insert("id", QJsonValue(QString::number(i+1)));
        subobject.insert("timerVal", QJsonValue(QString::number(0)));
        subobject.insert("timerName", QJsonValue("未命名"));
        jsonArray.append(subobject);
    }

    object.insert("recoveryPrimaryNode", QJsonValue(jsonArray));

    QJsonDocument doc(object);

    QByteArray data=doc.toJson();
    QFile myJsonFile("timer.json");

    if (!myJsonFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "could't open projects json";
        return;
    }

    myJsonFile.resize(0);
    myJsonFile.write(data);
    myJsonFile.close();
}
