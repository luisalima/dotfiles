if [ $((`date "+%d"`%5)) -eq 0 ]
then
  echo "Running updates!"
  source ../install/install.sh  
fi
