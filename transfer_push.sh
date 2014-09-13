#!/bin/bash
#Asumo que el directorio mis_programas está siempre en el mismo sitio.
cd ${HOME}/mis_programas/transfer_confs/
git add --all .
git commit -a -m "fixup! $(date)"
#timeout 20 git push --mirror -f
#Veo cuantos commits hay y si son mas de 50, los vuela
#if [ "$(git log --oneline |wc -l)" -gt 100 ]
#  then 
##    echo U > ${HOME}/borra.tabs
##    git reset --soft HEAD~50
##    #con esto conservo un commit previo.
##    git commit -a -m "$(date)"
##    #limpio el repo.
##    git gc
#     kdialog --passivepopup "<font color=red>Es ora de hacer un git rebase -i --autosquash en  $(pwd)"
#fi
timeout 20 git push --mirror -f

