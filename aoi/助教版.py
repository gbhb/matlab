from __future__ import print_function
from PIL import Image
import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.models import load_model
from keras.models import Model
from keras.layers import Input, Dense
from keras.utils import np_utils
from matplotlib import pyplot as plt
from keras import backend as K
import os
import random
import numpy as np
import imageio
import glob

class data_loader():
    def __init__(self, data_dir):
        self.tra_dir = data_dir + "train_images1/"
        self.tst_dir = data_dir + "test_images1/*"
            
    def get_tra_batch_generator(self, batch_size=32):
        all_path_lst = []
        for dir_idx in range(0, 5):
            dir_path = glob.glob(self.tra_dir+str(dir_idx)+"/*")
            all_path_lst.extend(dir_path)
            
        all_path_lst = list(np.random.permutation(all_path_lst))
        #print(shufIdx_lst)
        #all_path_lst = [all_path_lst[ran_seed] for ran_seed in shufIdx_lst]
        read_gen = self.read_img(all_path_lst)
        
        while True:
            batch_imgs = []
            batch_labels = []
            for _ in range(batch_size):
                label, img = next(read_gen)
                batch_imgs.append(img)
                batch_labels.append(label)
            yield batch_imgs, batch_labels
                
    def read_img(self, all_path_lst):
        for path in all_path_lst:
            img = imageio.imread(path, pilmode="RGB")
            tmp = path.split('\\')[0]
            label = int(tmp.split('/')[-1])
        
            yield img, label
    
            
       
    def get_test_batch_imgs(self, batch_size=32):
        path_lst = glob.glob(self.tra_dir)
        for path in path_lst:
            img_batch = []
            for idx in range(0, batch_size):
                img = imageio.imread(path, pilmode="RGB")
                img_batch = [img_batch, img]
                
            yield img_batch


class data_loader2():
    def __init__(self, data_dir):
        self.tra_dir = data_dir + "train_images/"
        self.tst_dir = data_dir + "test_images/*"
            
    def get_tst_batch_generator(self, batch_size=10):
        all_path_lst = []
        dir_path = glob.glob(self.tst_dir+"/*")
        all_path_lst.extend(dir_path)
            
        all_path_lst = list(np.random.permutation(all_path_lst))
        #print(shufIdx_lst)
        #all_path_lst = [all_path_lst[ran_seed] for ran_seed in shufIdx_lst]
        read_gen = self.read_img(all_path_lst)
        
        while True:
            batch_imgs = []
            batch_labels = []
            for _ in range(batch_size):
                label, img = next(read_gen)
                batch_imgs.append(img)
                batch_labels.append(label)
            yield batch_imgs, batch_labels
                
    def read_img(self, all_path_lst):
        for path in all_path_lst:
            img = imageio.imread(path, pilmode="RGB")
            tmp = path.split('\\')[0]
            label=0
            yield img, label
    
            
       
    def get_test_batch_imgs(self, batch_size=32):
        path_lst = glob.glob(self.tra_dir)
        for path in path_lst:
            img_batch = []
            for idx in range(0, batch_size):
                img = imageio.imread(path, pilmode="RGB")
                img_batch = [img_batch, img]
                
            yield img_batch
            
            
if __name__ == "__main__":
    data_dir = "./"
    dat_ld1 = data_loader(data_dir)
    dat_ld2 = data_loader2(data_dir)
    gen = dat_ld1.get_tra_batch_generator()
    gen2 = dat_ld2.get_tst_batch_generator()
    
    # Model.train_on_batch(x, y, sample_weight=None, class_weight=None)
    
 
def data_x_y_preprocess(datapath):
# 定義圖像寬、高
    img_rows, img_cols = 512, 512
    datapath =datapath
    data_x=np.zeros((512,512)).reshape(1,512,512)
    pictureCount=0
    data_y=[]
    num_class=6
    for root,dirs,files in os.walk(datapath):
        for f in files:
            label=int(root.split("\\")[-1])
            data_y.append(label)
            fullpath=os.path.join(root,f)
            img=Image.open(fullpath)
            img=(np.array(img)/255).reshape(1,512,512)
            data_x=np.vstack((data_x,img))
            pictureCount +=1
    data_x=np.delete(data_x,[0],0)
    data_x=data_x.reshape(pictureCount,img_rows,img_cols,1)
    data_y=np_utils.to_categorical(data_y,num_class)
    return data_x,data_y

(x_train,y_train)=data_x_y_preprocess('train_images1')

# 建立簡單的線性執行的模型
model = Sequential()
# 建立卷積層，filter=32,即 output space 的深度, Kernal Size: 3x3, activation function 採用 relu
model.add(Conv2D(32, kernel_size=(3, 3),
                 activation='relu',
                 input_shape=(512,512,1)))
# 建立卷積層，filter=64,即 output size, Kernal Size: 3x3, activation function 採用 relu
model.add(Conv2D(32, (3, 3), activation='relu'))
# 建立池化層，池化大小=2x2，取最大值
model.add(MaxPooling2D(pool_size=(2, 2)))
# Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.25
model.add(Dropout(0.1))
# Flatten層把多維的輸入一維化，常用在從卷積層到全連接層的過渡。
model.add(Flatten())
model.add(Dropout(0.1))
# 全連接層: 1512個output
model.add(Dense(32, activation='relu'))
# Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.5
model.add(Dropout(0.25))
# 使用 softmax activation function，將結果分類
model.add(Dense(units=6, activation='softmax'))

# 編譯: 選擇損失函數、優化方法及成效衡量方式
model.compile(loss=keras.losses.categorical_crossentropy,
              optimizer=keras.optimizers.Adadelta(),
              metrics=['accuracy'])




# 進行訓練, 訓練過程會存在 train_history 變數中
# for 
#     x, y = data_loader.get_train_batch_img()
#     model.train_on_batch(x, y)


# train_history = model.fit(x_train, y_train,
#           batch_size=32,
#           epochs=1,
#           verbose=1,
#           validation_split=0.1)
try:
    model.fit_generator(gen, steps_per_epoch=32, epochs=5, verbose=1, max_queue_size=1,workers=1)
except RuntimeError:
        print("end")

try:
    # 顯示損失函數、訓練成果(分數)
    score = model.evaluate_generator(gen2, verbose=1)
except RuntimeError:
        print("end")
    
print('Test loss:', score[0])
print('Test accuracy:', score[1])# -*- coding: utf-8 -*-

        
        


