#手順
- 基本はコレ。
  - http://felis-silvestris-catus.hatenablog.com/entry/2015/05/27/222434
- Tips
  - `su -i` で入った後迷子になる。一回`cd /`でてっぺんに行くといい。
  - `./build-dh` はちと時間食う。
  - ` openvpn --genkey --secret`は` openvpn --genkey --secret ta.key` が正しい。
  - `/etc/openvpn/easy-rsa/keys# cp ca.crt server.crt server.key dh2048.pem ta.key /etc/openvpn/
` が正しい。

  - クライアントがubuntuの場合は`;comp-lzo`は有効にしてみること
    - パスワードはとりあえずnishidalab123

  - グローバルIPアドレスはここから取得
    - http://www.cman.jp/network/support/go_access.cgi

#トラブル究明
- `failed to update database TXT_DB error number 2` でclient.crt が作れない
  - とりあえずこのコマンド
    - `KEY_CN=someuniqueclientcn ./pkitool client`
  - 今度は`Error Loading extension section usr_cert` で作れねー。
    - `openssl-1.0.0.cnf`がバグっているらしい。
    - easy-rsa で次のコードを実行して`openssl-1.0.0.cnf` を修復する。
      - `perl -p -i -e 's|^(subjectAltName=)|#$1|;' /etc/openvpn/easy-rsa/openssl-1.0.0.cnf`

- クライアント側で`TLS Error: TLS key negotiation failed to occur within 60 seconds (check your network connectivity)`が出る
  - https://www.gsais.kyoto-u.ac.jp/staff/liang/oss/ovpn2_howto_ja.html#start
  - グローバルIP調査ツール
    - http://www.cman.jp/network/support/go_access.cgi
  - ポート確認ツール。上記ツールでグローバルIPを調べ、1194が開放されているか確認。
    - http://www.cman.jp/network/support/port.html
  - ルータ、サーバ、クライアント全てのFireWallをUDPで1194開放する。
    - Ubuntu ファイアウォール設定ツール
      - http://sicklylife.at-ninja.jp/memo/ubuntu1404/gufw.html
    - 我が家でのルータ設定
      - http://192.168.11.1/
        - id(デフォ): admin
        - pass(デフォ): password
      - ゲーム&アプリから登録。UDPポート1194を許可する。
      - やりかた
        - http://www.akakagemaru.info/port/meruko/whr-300hp2-portfw.html
      - できないとき
        - http://www.akakagemaru.info/port/faq-disableport.html
      - 二重ルータの場合
        - http://www.akakagemaru.info/port/metarugia-ybbhikari.html
      
#積んだ
- ネットワークは、1. アパート ー 2.うちのバッファロー ー 3. PC
- 2 は開放できるが、1 は任意に開放できない！1はアパート側のルータで、ただで使わせてもらっている…。
      
