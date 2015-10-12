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

  - 接続確認
    - まずは同一ネットワーク内で接続確認する。
    - そこでうまく行くことを確認した後、グローバルIPから接続。
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
  - TCPポート確認ツール。上記ツールでグローバルIPを調べ、1194が開放されているか確認。
    - http://www.cman.jp/network/support/port.html
  - UDPポート確認は別ツールで
    - 確認中 
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
        - traceroute でルータが二重になっていたら、二段階でポート開放しないといけない。 
        - http://www.akakagemaru.info/port/metarugia-ybbhikari.html
      
#積んだ
- ネットワークは、1. アパート ー 2.うちのバッファロー ー 3. PC
- 2 は開放できるが、1 は任意に開放できない！1はアパート側のルータで、ただで使わせてもらっている…。
      
# ATERM (モバイルWifiルータ)
- こっちでやるとつながったよ。
- ポート開放手順
  - http://www.akakagemaru.info/port/mr03ln-portfw.html
- `Incoming packet rejected from ...` が出たら、同じネットワークいるのが原因。サーバとクライアントを別ネットワークにしてから接続すればつながるはず。
- 成功した時のメッセージ
```
2015/10/12 0:35:06 OpenVPN 2.3.7 x86_64-w64-mingw32 [SSL (OpenSSL)] [LZO] [PKCS11] [IPv6] built on Jul  9 2015
2015/10/12 0:35:06 library versions: OpenSSL 1.0.1p 9 Jul 2015, LZO 2.08
2015/10/12 0:35:06 MANAGEMENT: TCP Socket listening on [AF_INET]127.0.0.1:31198
2015/10/12 0:35:06 WARNING: No server certificate verification method has been enabled.  See http://openvpn.net/howto.html#mitm for more info.
2015/10/12 0:35:06 Control Channel Authentication: tls-auth using INLINE static key file
2015/10/12 0:35:06 Outgoing Control Channel Authentication: Using 160 bit message hash 'SHA1' for HMAC authentication
2015/10/12 0:35:06 Incoming Control Channel Authentication: Using 160 bit message hash 'SHA1' for HMAC authentication
2015/10/12 0:35:06 >INFO:OpenVPN Management Interface Version 1 -- type 'help' for more info
2015/10/12 0:35:06 Socket Buffers: R=[8192->65536] S=[8192->65536]
2015/10/12 0:35:06 UDPv4 link local (bound): [undef]
2015/10/12 0:35:06 UDPv4 link remote: [AF_INET]153.250.223.182:1194
2015/10/12 0:35:06 MANAGEMENT: Client connected from [AF_INET]127.0.0.1:31198
2015/10/12 0:35:06 TLS: Initial packet from [AF_INET]153.250.223.182:1194, sid=9c873477 c078e2cc
2015/10/12 0:36:06 TLS Error: TLS key negotiation failed to occur within 60 seconds (check your network connectivity)
2015/10/12 0:36:06 TLS Error: TLS handshake failed
2015/10/12 0:36:06 SIGUSR1[soft,tls-error] received, process restarting
2015/10/12 0:36:06 Restart pause, 2 second(s)
2015/10/12 0:36:08 WARNING: No server certificate verification method has been enabled.  See http://openvpn.net/howto.html#mitm for more info.
2015/10/12 0:36:08 Control Channel Authentication: tls-auth using INLINE static key file
2015/10/12 0:36:08 Outgoing Control Channel Authentication: Using 160 bit message hash 'SHA1' for HMAC authentication
2015/10/12 0:36:08 Incoming Control Channel Authentication: Using 160 bit message hash 'SHA1' for HMAC authentication
2015/10/12 0:36:08 Socket Buffers: R=[8192->65536] S=[8192->65536]
2015/10/12 0:36:08 UDPv4 link local (bound): [undef]
2015/10/12 0:36:08 UDPv4 link remote: [AF_INET]153.250.223.182:1194
2015/10/12 0:36:08 TLS: Initial packet from [AF_INET]153.250.223.182:1194, sid=d73cf2d3 c1ac69ee
2015/10/12 0:36:17 VERIFY OK: depth=1, C=JP, ST=Tokyo, L=Fukuoka, O=CIR^-KIT, OU=Develop, CN=CIR^-KIT CA, name=EasyRSA, emailAddress=p595201@mail.kyutech.jp
2015/10/12 0:36:17 VERIFY OK: depth=0, C=JP, ST=Tokyo, L=Fukuoka, O=CIR^-KIT, OU=Develop, CN=server, name=EasyRSA, emailAddress=p595201@mail.kyutech.jp
2015/10/12 0:36:18 Data Channel Encrypt: Cipher 'AES-128-CBC' initialized with 128 bit key
2015/10/12 0:36:18 Data Channel Encrypt: Using 160 bit message hash 'SHA1' for HMAC authentication
2015/10/12 0:36:18 Data Channel Decrypt: Cipher 'AES-128-CBC' initialized with 128 bit key
2015/10/12 0:36:18 Data Channel Decrypt: Using 160 bit message hash 'SHA1' for HMAC authentication
2015/10/12 0:36:18 Control Channel: TLSv1, cipher TLSv1/SSLv3 DHE-RSA-AES256-SHA, 2048 bit RSA
2015/10/12 0:36:18 [server] Peer Connection Initiated with [AF_INET]153.250.223.182:1194
2015/10/12 0:36:21 SENT CONTROL [server]: 'PUSH_REQUEST' (status=1)
2015/10/12 0:36:21 Authenticate/Decrypt packet error: bad packet ID (may be a replay): [ #81 / time = (1444577767) Mon Oct 12 00:36:07 2015 ] -- see the man page entry for --no-replay and --replay-window for more info or silence this warning with --mute-replay-warnings
2015/10/12 0:36:21 TLS Error: incoming packet authentication failed from [AF_INET]153.250.223.182:1194
2015/10/12 0:36:21 PUSH: Received control message: 'PUSH_REPLY,route 192.168.11.0 255.255.255.0,redirect-gateway def1 bypass-dhcp,dhcp-option DNS 192.168.11.1,route 10.8.0.0 255.255.255.0,topology net30,ping 10,ping-restart 120,ifconfig 10.8.0.6 10.8.0.5'
2015/10/12 0:36:21 OPTIONS IMPORT: timers and/or timeouts modified
2015/10/12 0:36:21 OPTIONS IMPORT: --ifconfig/up options modified
2015/10/12 0:36:21 OPTIONS IMPORT: route options modified
2015/10/12 0:36:21 OPTIONS IMPORT: --ip-win32 and/or --dhcp-option options modified
2015/10/12 0:36:21 do_ifconfig, tt->ipv6=0, tt->did_ifconfig_ipv6_setup=0
2015/10/12 0:36:21 open_tun, tt->ipv6=0
2015/10/12 0:36:21 TAP-WIN32 device [ローカル エリア接綁E3] opened: \\.\Global\{A8A9F787-9860-4180-B420-A04BA71B1358}.tap
2015/10/12 0:36:21 TAP-Windows Driver Version 9.9
2015/10/12 0:36:21 Notified TAP-Windows driver to set a DHCP IP/netmask of 10.8.0.6/255.255.255.252 on interface {A8A9F787-9860-4180-B420-A04BA71B1358} [DHCP-serv: 10.8.0.5, lease-time: 31536000]
2015/10/12 0:36:21 Successful ARP Flush on interface [38] {A8A9F787-9860-4180-B420-A04BA71B1358}
2015/10/12 0:36:26 TEST ROUTES: 3/3 succeeded len=2 ret=1 a=0 u/d=up
2015/10/12 0:36:26 C:\Windows\system32\route.exe ADD 153.250.223.182 MASK 255.255.255.255 192.168.11.1
2015/10/12 0:36:26 ROUTE: CreateIpForwardEntry succeeded with dwForwardMetric1=25 and dwForwardType=4
2015/10/12 0:36:26 Route addition via IPAPI succeeded [adaptive]
2015/10/12 0:36:26 C:\Windows\system32\route.exe ADD 192.168.11.1 MASK 255.255.255.255 192.168.11.1 IF 13
2015/10/12 0:36:26 ROUTE: CreateIpForwardEntry succeeded with dwForwardMetric1=25 and dwForwardType=4
2015/10/12 0:36:26 Route addition via IPAPI succeeded [adaptive]
2015/10/12 0:36:26 C:\Windows\system32\route.exe ADD 0.0.0.0 MASK 128.0.0.0 10.8.0.5
2015/10/12 0:36:26 ROUTE: CreateIpForwardEntry succeeded with dwForwardMetric1=30 and dwForwardType=4
2015/10/12 0:36:26 Route addition via IPAPI succeeded [adaptive]
2015/10/12 0:36:26 C:\Windows\system32\route.exe ADD 128.0.0.0 MASK 128.0.0.0 10.8.0.5
2015/10/12 0:36:26 ROUTE: CreateIpForwardEntry succeeded with dwForwardMetric1=30 and dwForwardType=4
2015/10/12 0:36:26 Route addition via IPAPI succeeded [adaptive]
2015/10/12 0:36:26 C:\Windows\system32\route.exe ADD 192.168.11.0 MASK 255.255.255.0 10.8.0.5
2015/10/12 0:36:26 ROUTE: CreateIpForwardEntry succeeded with dwForwardMetric1=30 and dwForwardType=4
2015/10/12 0:36:26 Route addition via IPAPI succeeded [adaptive]
2015/10/12 0:36:26 C:\Windows\system32\route.exe ADD 10.8.0.0 MASK 255.255.255.0 10.8.0.5
2015/10/12 0:36:26 ROUTE: CreateIpForwardEntry succeeded with dwForwardMetric1=30 and dwForwardType=4
2015/10/12 0:36:26 Route addition via IPAPI succeeded [adaptive]
2015/10/12 0:36:26 Initialization Sequence Completed
```
