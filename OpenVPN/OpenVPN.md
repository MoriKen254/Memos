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
- クライアントパスワードはnishidalab123

- グローバルIPアドレスはここから取得
  - http://www.cman.jp/network/support/go_access.cgi
  
- client.crt が作れない
  - `openssl-1.0.0.cnf`がバグっているらしい。
  - easy-rsa で次のコードを実行して`openssl-1.0.0.cnf` を修復する。
  - `perl -p -i -e 's|^(subjectAltName=)|#$1|;' /etc/openvpn/easy-rsa/openssl-1.0.0.cnf`
  
  - ファイアウォール設定ツール
    - http://sicklylife.at-ninja.jp/memo/ubuntu1404/gufw.html
    
    - ルータから設定
      - http://192.168.11.1/
        - id: admin
        - pass: password
      - ゲーム&アプリから登録。UDPポート1194を許可する。
      - やりかた
        - http://www.akakagemaru.info/port/meruko/whr-300hp2-portfw.html
      - できないとき
        - http://www.akakagemaru.info/port/faq-disableport.html
      - 二重ルータの場合
        - http://www.akakagemaru.info/port/metarugia-ybbhikari.html
      
    - 積んだ
      - ネットワークは、①アパートー②うちのバッファローーP③C
      - ②は開放できるが、①は開任意に放できない！
      - 
      
