#!/bin/bash
ssh-keygen -t rsa -b 4096 -N '' -C "neusbeer@gmail.com" -f ~/.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -N '' -C "neusbeer@gmail.com" -f ~/.ssh/github_rsa
ssh-keygen -t rsa -b 4096 -N '' -C "neusbeer@gmail.com" -f ~/.ssh/mozilla_rsa
