#!/bin/bash
cd /content/
cp /content/gdrive/My\ Drive/network* stylegan/
cp /content/gdrive/My\ Drive/profiles.tar .
tar -xvf profiles.tar
rm profiles.tar
cd stylegan/
python dataset_tool.py create_from_images datasets/custom-dataset ../profiles/
fname=`ls /content/gdrive/My\ Drive/network*`
sed -i 's/= \"network-snapshot-.*\.pkl/= \"'$fname'/g' training/training_loop.py