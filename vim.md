#Vim Tips

##WindowsでVim
- インストール
  - http://ylgbk.hatenablog.com/entry/2015/01/07/120000 
  - molokai.vim の場所注意
- メニューが文字化けする対策
  - http://kaworu.jpn.org/kaworu/2013-05-08-1.php

##俺様チートシート
- 

##プラグイン使い方
- neobundle: http://qiita.com/kazu0620/items/819679ef006d973c6c22
- unite.vim: http://d.hatena.ne.jp/osyo-manga/20130307/1362621589
- vimfiler.vim: http://www.karakaram.com/vimfiler
- vimshell:http://qiita.com/cuminseed/items/162730d678b18adcec67
  - なぜかNeoBundleでさっぱり入らない。手で入れたほうが速い。
  - 見つかった！http://qiita.com/himinato/items/caf5a0b19ce893a75363
  - NeoBundleLazy で登録しないとダメらしい。
  - エイリアス:http://qiita.com/yamao2253/items/ebba00da9d76ae380fbc
  - let g:VimShell_EnableInteractive = 1　を忘れずに。→自力で入れた場合
  - 対話型:http://nauthiz.hatenablog.com/entry/20101107/1289140518
- lightline:http://itchyny.hatenablog.com/entry/20130828/1377653592
  - .vimrcと.gvimrcの両方でNeoBundleしないとうまく動かない。
- seiya.vim:http://h-miyako.hatenablog.com/entry/2014/12/25/004638
  - vim透過。seiya.vimを~/.vim/plugin にコピー。vimからSeiyaEnable。 
##リモート通信時のログイン情報入力省略
- ~/.netrc にユーザ名/パスワードを書く
```bash
machine github.com
login syokenz
password xxxxxxx
```

