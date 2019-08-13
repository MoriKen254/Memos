# Tips
## home以下のフォルダ名を英語に
```bash
LANG=C xdg-user-dirs-gtk-update
```
- 出展: [Ubuntuでホームディレクトリの中身を英語にする](https://qiita.com/taiko19xx/items/d1a001bfc25245b91354)

## Terminater 透過
- 参考サイト: http://d.hatena.ne.jp/yohei-a/20140223/1393120021
 
## リソース可視化
- indicator-multiload
  - https://kledgeb.blogspot.com/2012/12/ubuntu-1.html
 
## アプリケーション関連付け
- エクスプローラから対象ファイルを右クリック→プロパティ
- 開き方タブを開き、規定のアプリケーションを選択。
- http://kledgeb.blogspot.jp/2012/07/ubuntu-nautilus-12.html

## 文字入力
- Mozc Fcitxの動作設定を行う（全体の設定の拡張オプション・ホットッキー その1）
  - http://kledgeb.blogspot.jp/2013/12/ubuntu-fcitx-11-fcitx-1.html
- Ctrl, Caps lock swap
  - https://forums.ubuntulinux.jp/viewtopic.php?pid=103155#p103155

## Kindle for Windows
 - Wineをインストールすればok: http://mogi2fruits.net/blog/os-software/linux/ubuntu/3008/
 - 途中'ttf-mscorefonts-installer'がどうのこうのって画面がでるのは←→適当に押して「了解」ボタンまですすんでEnterすれば先に進める。
 - Kindleのインストーラ実行中に足りないパッケージが云々と言われるので、全部インストールをクリック。

## Anki
 - [Ankiの本家サイト](http://ankisrs.net/)から.debパッケージをダウンロード
 - `gdebi`を入れていなければ入れる．ローカルパッケージを依存関係を解決しながらインストールしてくれるスグレモノ．
```bash
sudo apt-get install gdebi
```
 - .deb をインストール
```bash
sudo gdebi anki-2.0.33.deb
```

## Git の状態をpromptで表示
 - http://tm.root-n.com/unix:command:git:bash_prompt

## PyCharm
 - ubuntuにpycharmをインストールする
   - http://ng3rdstmadgke.hatenablog.com/entry/2015/09/06/223832
 - pycharm でVimバインド
   - http://blog3.logosware.com/archives/2477

## 16.06 でPS３コントローラを接続する
 - aptでは入らないのでソースからビルドする
   * https://askubuntu.com/questions/913599/how-to-connect-dualshock-3-controller-ps3-sixaxis-gamepad-on-ubuntu-16-04
