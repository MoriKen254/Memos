# Raspberry Pi 2 & Ubuntu 14.04

## インストール
### 基本手順
- [Raspberry Pi 2にUbuntu 14.04を入れてみた](http://qiita.com/mechamogera/items/2c21b125937b70a80aca)
- [Raspberry Pi 2でUbuntu14.04を使う](http://qiita.com/rytmrt/items/9c4601586479fff6d77c)
- [第2回 Ubuntu 14.04 の Raspberry Pi 2 へのインストール](http://raspi2.hateblo.jp/entry/2015/04/18/190427)
- [RaspberryPiでSDカード容量を最大まで使うようにする](https://blog.hello-world.jp.net/raspberrypi/219/)

### トラブルシュート
- 電源の入れ方が分からない
 - [OpenRTM Raspberry Pi Mouse 活用事例](http://openrtm.org/openrtm/ja/book/export/html/6005)
- Windows10 で DD for Windows を使ったときにSDカードのドライブが表示されない
  - Ver.0.9.9.8 を入れる
  - 右クリック→管理者として実行する
  - [Windowsでも手軽に丸ごとコピー「DD for Windows」](http://qiita.com/sayonari/items/a9721afd92e2bfb34964)
- インストール直後はキーボード配置が英語
  - とりあえず[この対応図](http://www.nagasaki-gaigo.ac.jp/toguchi/pc/multilingual/keyboard_us_jis.htm)を診ながら作業。 
  - [Ubuntu 14.04 betaでキーボードレイアウトを日本語に戻す ibus-mozc編](http://ubuntu.hatenablog.jp/entry/20140403/1396524520)
- キーボード周りで何か設定していたときに[[By default the combination Control + Alt + Backspace does nothing. If you want it can be used to terminate the X server.]と聞かれて困った]
  - [おもいたったがきちじつ キーボード設定](http://namakemono345.com/kichijitsu/RaspberryPi/index/install.html#1)
- `gnome-tweak-tool`を起動しようとしたら`Shell not running`って怒られる。
  - [Add the official Gnome Shell Extensions ppa](http://askubuntu.com/questions/239648/gnome-tweak-tool-wont-start-with-user-themes-in-gnome-shell/239653#239653)
- 日本語が入力できない
  - [Ubuntu 14.04 英語版 (64bit) インストール後に設定したこと](http://www.cs.gunma-u.ac.jp/~nagai/wiki/index.php?Ubuntu%2014.04%20%B1%D1%B8%EC%C8%C7%20(64bit)%20%A5%A4%A5%F3%A5%B9%A5%C8%A1%BC%A5%EB%B8%E5%A4%CB%C0%DF%C4%EA%A4%B7%A4%BF%A4%B3%A4%C8)

## ROS連携

- [RaspberryPi2からTurtleBot2（kobuki）をROSで動かす](http://qiita.com/sayonari/items/a9721afd92e2bfb34964)
  - Ubuntu インストールのところからとてもまとまっている
- [github ryuichiueda/ros_setup_scripts_Ubuntu14.04_server](https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu14.04_server)

