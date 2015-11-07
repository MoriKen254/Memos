##C#でテキスト保存
### ファイルに書き込む
- [ファイルにテキストを書き込むには？［C#、VB］](http://www.atmarkit.co.jp/ait/articles/0711/08/news119.html)
  - `utf`系でエンコードしたら`gnuplot`が読んでくれなかった．んなばかな．
  - しかたなく`Shift_JIS`でエンコードする普通に動く．むむむ．

###エンコード指定方法．
- [目的の文字コードに合ったEncodinオブジェクトを取得する](http://dobon.net/vb/dotnet/string/getencodingobject.html)

### ToString()でフォーマット指定
- [書式を指定して数値を文字列に変換する](http://dobon.net/vb/dotnet/string/inttostring.html)
  - +でも-でも符号を付けたいときは，こんな感じ：`ToString("+0.00000;-0.00000;+0.00000")`
  - [数値書式指定で符号（プラス）を表示したいのですが](http://www.atmarkit.co.jp/bbs/phpBB/viewtopic.php?topic=41571&forum=7)

##C#フォーム上にGNUPLOTで作成したグラフをのせる
### [Visual C# .NET to call GNUPLOT](http://civilyarou.web.fc2.com/WANtaroHP/subgnuplot2-1.html)
- 一回画像で保存して読み込むのがスタンダード
### コードからの`plot`パス区切り指定
- `/`でしたほうが良い．
  - `\`でするとなるとやっかい．
  - まず，`gnuplot`で`\`をエスケープするため`\\`が必要．`plot ".\\data\\test.dat"`．
  - 更に，コード内でも`\`をエスケープするため，更に`\\`が必要．`plot \".\\\\data\\\\test.dat\"`．泣きたい．
  - `/`ならすっきり．`plot \"./data/test.dat\"`
### `gnuplot`を呼び出すときにターミナルを表示させない
- [ウィンドウの状態を最大化、最小化、非表示にして、外部アプリケーションを起動する](http://dobon.net/vb/dotnet/process/processwindowstyle.html)

  ```
  private readonly String kFilePathGnuplotExe = @".\third_parties\gnuplot\bin\gnuplot.exe";
  ProcessStartInfo processStartInfo = new ProcessStartInfo();
  processStartInfo.FileName = kFilePathGnuplotExe;
  processStartInfo.UseShellExecute = false; // コンソールアプリの場合はここをfalseにしないと使えない．
  processStartInfo.RedirectStandardInput = true;
  processStartInfo.CreateNoWindow = true; // 非表示にする．
  Process extPro = Process.Start(processStartInfo); // gnuplot開始
  ```
