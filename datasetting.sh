## 0. Download the dataset
pip install gdown
gdown https://drive.google.com/uc?id=1nSFa3GjFMnEU3H-09-KMTRxJZrMpIzTg
unzip 2023MCH_TrainData.zip
mv '2023MCH_TrainData' datasets
## 1. Clone the repository
git clone https://github.com/WongKinYiu/yolov7.git
## 2. Download the pretrained model
cd yolov7
mkdir weights
cd weights
gdown https://drive.google.com/uc?id=1bMWnBO49sftpo0BjTZ4XHy9q9TnvhK9a
gdown https://drive.google.com/uc?id=11xxH1XuQDaVvK1YyeGWA2gcj93zWSb4L
## 3. Download requirements
cd ../
# pip install -r requirements.txt

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
# python train.py --weights weights/best.pt --cfg cfg/training/yolov7-xray.yaml --data data/xray.yaml --batch-size 9 --epoch 2
