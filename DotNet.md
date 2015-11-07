##C#フォーム上にGNUPLOTで作成したグラフをのせる
- http://civilyarou.web.fc2.com/WANtaroHP/subgnuplot2-1.html
  - 一回画像で保存して読み込む．
- パス指定は`/`でしたほうが良い．
  - `\`でするとなるとやっかい．
  - まず，`gnuplot`で`\`をエスケープするため`\\`が必要．`plot ".\\data\\test.dat"`．
  - 更に，コード内でも`\`をエスケープするため，更に`\\`が必要．`plot \".\\\\data\\\\test.dat\"`．泣きたい．
  - `/`ならすっきり．`plot \"./data/test.dat\"`
