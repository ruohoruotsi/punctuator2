echo "Français - Francés - French - Francese"
echo " "
echo "Step 1/3"
mkdir ./out
grep -v " '[^ ]" ./europarl-v7.fr | \
grep -v \'\ s\   | \
grep -v \'\ ll\  | \
grep -v \'\ ve\  | \
grep -v \'\ m\   > step1.txt

echo " "
echo "Step 2/3"
python make_data.py step1.txt step2.txt

echo "Step 3/3"
head -n 400000 step2.txt > ./out/ep.train.txt
tail -n 400000 step2.txt > step3.txt
head -n 200000 step3.txt > ./out/ep.dev.txt
tail -n 200000 step3.txt > ./out/ep.test.txt

echo " "
echo "Cleaning up..."
rm -f step1.txt step2.txt step3.txt
echo " "
echo "Preprocessing done. Now you can give the produced ./out dir as <data_dir> argument"
echo "to data.py script for conversion and continue as described in the main README.md"
