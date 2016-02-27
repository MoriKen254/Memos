#Vim Tips

##WindowsでVim
- インストール
  - http://ylgbk.hatenablog.com/entry/2015/01/07/120000 
  - molokai.vim の場所注意
- メニューが文字化けする対策
  - http://kaworu.jpn.org/kaworu/2013-05-08-1.php
- neobundleのセットアップ、make 等ははgit-bashでやる必要がある
  `-` ~が`C:\Users\ユーザ名`として作業できる
- 32bit と64bit で手順が違う
  - 64bit: http://qiita.com/akase244/items/ce5e2e18ad5883e98a77
  - 32bit: http://qiita.com/akase244/items/08f35b2973fdd4937852
- vimprocはビルドが必要
  - `C:\Users\ユーザ名\.vim\bundle\vimproc.vim\autoload` に`vimproc_win32.dll` または `vimproc_win64.dll` があればよい。
  - OSのビット数によって違う。両方突っ込んでおけばとりあえず問題は無かろうかと。
- neobundleの記述は_vimrcと_gvimrcの両方に書かないといけない。どちらか一方だけだと挙動不良となる。

##関数定義ジャンプ
- ctags: http://qiita.com/soramugi/items/7014c866b705e2cd0b95

##GVimを透過したい
- ubuntu: ccsmをインストール
  - インストール手順: http://qiita.com/mayami/items/2635d24c6f67c8277308
  - 動いた設定: https://forums.ubuntulinux.jp/viewtopic.php?id=13514
- windows
  - `_gvimrcに追記`:`set transparency=220`

##拡張子毎の強調表示設定を追加したい
- `/usr/share/vim/vim74/filetype.vim`を編集する: http://www.mazn.net/blog/2009/08/03/230.html

##プラグイン使い方
- neobundle
  - http://qiita.com/kazu0620/items/819679ef006d973c6c22
  - http://qiita.com/himinato/items/caf5a0b19ce893a75363
  - http://qiita.com/upamune/items/ba0fe3b24ceebb764629
- NeoBundleLazy
  - 一部プラグインはこっちじゃないとだめっぽい（VimShellとか）。NeoBundleがダメだったら試してみる。
  - http://qiita.com/rbtnn/items/600ac451ebb43b2c9c13
- unite.vim: http://d.hatena.ne.jp/osyo-manga/20130307/1362621589
 - http://www.karakaram.com/vimfiler
 - http://qiita.com/knt45/items/6f16c6b041ce309076d6
 - http://qiita.com/hide/items/77b9c1b0f29577d60397
- vimfiler.vim: http://www.karakaram.com/vimfiler
- vimshell:http://qiita.com/cuminseed/items/162730d678b18adcec67
  - なぜかNeoBundleでさっぱり入らない。手で入れたほうが速い。
  - 見つかった！http://qiita.com/himinato/items/caf5a0b19ce893a75363
  - NeoBundleLazy で登録しないとダメらしい。
  - エイリアス:http://qiita.com/yamao2253/items/ebba00da9d76ae380fbc
  - let g:VimShell_EnableInteractive = 1　を忘れずに。→自力で入れた場合
  - 対話型:http://nauthiz.hatenablog.com/entry/20101107/1289140518
  - http://d.hatena.ne.jp/pcmaster/20090505/p1
- lightline:http://itchyny.hatenablog.com/entry/20130828/1377653592
  - .vimrcと.gvimrcの両方でNeoBundleしないとうまく動かない。
  - 以下の二行は.vimrcに必ず記載する
    - set laststatus=2
    - set t_Co=256
  - ステータスラインをかっこよくする:http://d.hatena.ne.jp/akishin999/20130928/1380373262 
    - Ritcy は~/tools に、その他は~/tmp/ に入れる。
    - vim-powerline の方の設定を行う。
- seiya.vim:http://h-miyako.hatenablog.com/entry/2014/12/25/004638
  - vim透過。seiya.vimを~/.vim/plugin にコピー。vimからSeiyaEnable。 
- vimgutter: http://kazuph.hateblo.jp/entry/2013/04/17/145339 
- vim-indent-guide: http://www.absolute-keitarou.net/blog/?p=1127
  - インデントの範囲をビジュアライズする。
- vim-easymotion: http://haya14busa.com/mastering-vim-easymotion/
  - 行きたい画面内の任意の文字に簡単にジャンプ
  - 矯正トレーニング: http://at-grandpa.hatenablog.jp/entry/2015/02/06/093705
  - vimrc設定：http://qiita.com/himinato/items/5fcdb3ad2885f0bc1ce6

## Git連携
- 概要
  - http://d.hatena.ne.jp/Ox8000ffff/20131225/1387978376
- Gitv
  - http://cohama.hateblo.jp/entry/20120417/1334679297
- fugitive
  - http://yuku-tech.hatenablog.com/entry/20110427/1303868482

##リモート通信時のログイン情報入力省略
- ~/.netrc にユーザ名/パスワードを書く
```bash
machine github.com
login syokenz
password xxxxxxx
```

