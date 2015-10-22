# OpenVPN 設定手順
予め必要なファイルは認証局`easy-rsa`等で作っておく。
## Server
1. サーバ用証明書、鍵、暗号化ハッシュをコピーする
  - `ca.crt`, `server.key`, `server.key`, `dh1024.pem`
1. 設定ファイルを`/etc/openvpn/`にコピーする。かならずこの場所で、かならず拡張は`*.conf`。
  - `server.conf`
1. サーバ側のローカルネットワークドメインを確認し、`server.conf`の該当箇所を編集する
  - 下記の行のxxx.xxx.xxx.xxxをローカルドメインに。例:192.168.179.0
  ```
  push "route xxx.xxx.xxx.xxx 255.255.255.0"
  ```
1. `OpenVPN` を起動する
  - 非同期で実行したい
  ```
  service openvpn start
  ```
  - 設定ファイルを明示的に指定したい（ただし同期）
  ```
  cd /etc/openvpn
  openvpn --config server.conf
  ```
  - 実行状況をコマンドラインで確認しながらやりたい。（`server.conf`でlogファイルの設定をしていれば、出てこない。）
  ```
   sudo /etc/init.d/openvpn start
  ```

## Client
1. クライアント用証明書と鍵をコピーする
  - `ca.crt`, `client1.key`, `client1.key`
1. 設定ファイルを`/etc/openvpn/`にコピーする。かならずこの場所で、かならず拡張は`*.conf`。
  - `client.conf`
  - `client.ovpn`の場合は、拡張子を`*.conf`に変更すればよい。
1. サーバ側のルータのグローバルIPアドレスを確認し、`client.conf`の該当箇所を編集する。
  - 下記の行のxxx.xxx.xxx.xxxをグローバルIPアドレスに。例：153.234.253.68
  ```
  remote yyy.yyy.yyy.yyy 1194
  ```
1. `OpenVPN` を起動する。手順はサーバと同じ。`server.conf`を`client.conf`に変えればよい。

## 相互接続確認
1. 互いに`ping`する。
1. 互いに`netcat`する。
  - http://wiki.ros.org/ja/ROS/NetworkSetup

# ROS接続確認手順
## ROSサーバ
1. 全て(これ大事！)のROS関連シェルで以下のスクリプトを実行
```
export ROS_MASTER_URI=http://10.8.0.1:11311
export ROS_HOST_NAME=10.8.0.1
export ROS_IP=10.8.0.1
```

## ROSクライアント
1. 全て(これ大事！)のROS関連シェルで以下のスクリプトを実行
```
export ROS_MASTER_URI=http://10.8.0.1:11311
export ROS_HOST_NAME=10.8.0.6
export ROS_IP=10.8.0.6
```
1. `rostopic list`で一覧を確認する
1. 同じシェル内（もしくは環境変数設定が完了しているシェルで）`rostopic pub hogehoge`で、サーバ側で`subscribe`できることを確認する。

## ROSサーバに戻る
1. 環境変数設定が完了しているシェルで`rostopic pub hogehoge`をする

## ROSクライアントに戻る
1. 環境変数設定が完了しているシェルで`rostopic echo hogehoge`をする．`subscribe`できることを確認する。

ここまでできれば大丈夫！`rviz`で覗こう！

## 参考
- 具体的な設定例
  - http://ros-users.122217.n3.nabble.com/Best-way-to-view-RViz-remotely-td1853585.html
- ROS_IP, ROS_HOSTNAMEの説明
  - http://wiki.ros.org/ROS/EnvironmentVariables#Node_Environment_Variables
