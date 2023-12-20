# !/bin/bash

SSH_KEY_PATH=$(terraform output -raw ssh_key_path)
USER=$(terraform output -raw username)
HOST=$(terraform output -raw ip)


ssh -i ${SSH_KEY_PATH} ${USER}@${HOST}
