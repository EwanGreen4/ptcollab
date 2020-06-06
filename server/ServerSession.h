#ifndef SERVERSESSION_H
#define SERVERSESSION_H

#include <QDataStream>
#include <QFile>
#include <QTcpSocket>

#include "protocol/RemoteAction.h"
class ServerSession : public QObject {
  Q_OBJECT
 public:
  ServerSession(QObject *parent, QTcpSocket *conn, QFile &file,
                const QList<RemoteActionWithUid> &history, qint64 uid);
  bool isConnected();
  void writeRemoteAction(const RemoteActionWithUid &action);
  qint64 uid();

 signals:
  void newRemoteAction(const RemoteActionWithUid &action);
  void disconnected();

 private slots:
  void readRemoteAction();

 private:
  QTcpSocket *m_conn;
  QDataStream m_data_stream;
  qint64 m_uid;
};

#endif  // SERVERSESSION_H
