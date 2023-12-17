# Terraform

awsディレクトリで実行

Terraform実行に必要なポリシーが出力される
手動でこのポリシーを作成して付与
```
docker pull jameswoolfenden/pike
docker run --tty --volume $(pwd):/tf jameswoolfenden/pike scan -d /tf
```
https://github.com/JamesWoolfenden/pike

起動
```
terraform init
terraform apply
```

インスタンス作成
```
sh ./ssh_connect.sh
```


終了
```
terraform destroy
```