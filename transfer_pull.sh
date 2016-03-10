#!/bin/bash
cd ${HOME}/mis_programas/transfer_confs/
# timeout 30 git pull --rebase -f
#pulling=$(timeout 30 git pull --rebase -f 2>&1)
#pulling=$(timeout 30 git pull --rebase 2>&1)
pulling=$(timeout 30 git pull 2>&1)
if [[ $? == 1  ]] || [[ "${pulling,,}" == *conflict* ]] || [[ "${pulling,,}" == *"cannot pull"* ]];then
#    conflicto=true
   kdialog --passivepopup "<font color=red>Ocurrio un conflicto merging $(pwd)" 
fi
STATUS="$(git status -bs)"
if [[ $STATUS != "## master" ]] && [[ $STATUS != "## master...origin/master"  ]] ;then 
   kdialog --title "$(basename $(pwd))" --passivepopup "$STATUS"
fi
if [ "$(git log --oneline |wc -l)" -gt 100 ]
  then
#    echo U > ${HOME}/borra.tabs
#    git reset --soft HEAD~50
#    #con esto conservo un commit previo.
#    git commit -a -m "$(date)"
#    #limpio el repo.
#    git gc
#     kdialog --passivepopup "<font color=red>Es ora de hacer un git rebase -i --autosquash en  $(pwd)"
     kdialog --passivepopup "<font color=red>Es hora de rebaser en $(pwd)"
fi
