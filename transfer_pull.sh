#!/bin/bash
cd ${HOME}/mis_programas/transfer_confs/
# timeout 30 git pull --rebase -f
#pulling=$(timeout 30 git pull --rebase -f 2>&1)
pulling=$(timeout 30 git pull --rebase 2>&1)
if [[ $? == 1  ]] || [[ "${pulling,,}" == *conflict* ]] || [[ "${pulling,,}" == *"cannot pull"* ]];then
#    conflicto=true
   kdialog --passivepopup "<font color=red>Ocurrio un conflicto merging $(pwd)" 
fi
