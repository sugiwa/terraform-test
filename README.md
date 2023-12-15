# Terraform

WSLで実行
Terraform実行に必要なポリシーが出力される
手動でこのポリシーを作成して付与
```
docker pull jameswoolfenden/pike
docker run --tty --volume [マウント元]:/tf jameswoolfenden/pike scan -d /tf
```

https://github.com/JamesWoolfenden/pike