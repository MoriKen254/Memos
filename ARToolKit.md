#INSTALL
- 準備
  - ARToolKit-2.72.1.tgz をダウンロード(http://sourceforge.net/projects/artoolkit/files/artoolkit/2.72.1/)
  - パッチをダウンロード（http://staff.aist.go.jp/k.kojima/artoolkit/artk-yuv422-v4l2-2.72.1.20090801.patch）
- ビルド
  - tar zxvf ARToolKit-2.72.1.tgz
  - patch -p0 -d . < artk-yuv422-v4l2-2.72.1.20090801.patch
  - cd ARToolKit
  - ./Config
    - 3: Video4Linux2 を選択
    - n: x86 ではない．すなわちx64である．
    - n
    - n
  - make
- サンプル実行
  - cd bin
  - ./simpleLite
  - ./simpleTest だとコアダンプする．Configで指定したフォーマットと合ってないのだと思う．
  
