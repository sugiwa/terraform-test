# !/bin/bash

SSH_KEY_NAME=$(terraform output -raw ssh_key_name)
HOST=$(terraform output -raw instance_host)

ssh -i ./.ssh/${SSH_KEY_NAME}.pem ubuntu@${HOST}
