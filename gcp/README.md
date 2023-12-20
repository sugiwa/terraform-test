# Terraform

### 準備
GCPでプロジェクトを作成してprojectIDとcredentialsを取得してvariables.tfに設定
```
variable "project" {
  default = "terraform-project-408516"
}

variable "credentials_file" {
  default = "/root/gcp-pem/terraform-project-pem.json"
}
```

### インスタンス作成
```
terraform init
terraform apply
```

### ssh接続
```
sh ./ssh_connect.sh
```


### 終了
```
terraform destroy
```
