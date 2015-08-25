#pudb
python用デバッガ．

##Environment
- Ubuntu 14.04

##Install
```bash
sudo apt-get install python-pudb
```

##Usage
###Run
```bash
pudb talker.py 
```
###Commands
- n: ステップオーバ
- s: ステップイン
- b: ブレークポイント
- Ctrl + x: 対話式コマンドラインへ移動

###Tips
- ローカル変数は勝手にVariables に登録されていく．
- 型しか出ない時は→でエリアを移動して変数を選択，表示モードを切り替える(http://heather.cs.ucdavis.edu/~matloff/pudb.html)．
- 右側に行った後Shift + B でBreakpoints に移動できる．
- エディタ内のカーソル移動はVim 的にできる．
- 対話式コマンドラインに入ったら変数を見たり，変えたり，好き勝手できる．
