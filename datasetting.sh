## 0. Download the dataset
unzip Meichu2023TrainData.zip
mv '2023MCH_TrainData' datasets

## 1. Clone the repository
git clone https://github.com/WongKinYiu/yolov7.git
## 2. Download the pretrained model
cd yolov7
mkdir weights
cd weights
wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt
## 3. Download requirements
cd ../
pip install -r requirements.txt
## 4. Test the model
python detect.py --weights weights/yolov7.pt --source inference/images 
echo "Test the model successfully!"
## 4. Spilt the dataset
cd ../
pip install natsort
python split_dataset.py
mv datasets yolov7/datasets
## 5. change the yaml file
cp xray.yaml yolov7/data
cp yolov7-xray.yaml yolov7/cfg/training
## 6. Train the model
cd yolov7
python train.py --weights weights/yolov7.pt --cfg cfg/training/yolov7-xray.yaml --data data/xray.yaml --device 0 --batch-size 8 --epoch 10