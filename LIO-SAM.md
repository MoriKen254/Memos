基本ここに従う。

https://beike-re.hatenablog.com/entry/VTC/LIO-SAM/3d-mapping#LIO-SAM%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97%E3%81%A6%E3%83%9E%E3%83%83%E3%83%97%E3%82%92%E4%BD%9C%E6%88%90

rosbag のコマンドだけ注意。

```bash
$ roslaunch lio_sam run.launch
```

```bash
$ rosbag play --clock rotation_dataset.bag imu_correct:=imu_raw
```

```bash
$ cd ~/Downloads/LOAM
$ ls
CornerMap.pcd  GlobalMap.pcd  SurfMap.pcd  trajectory.pcd  transformations.pcd
```
