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

class data_loader():  ## data_loader
    def __init__(self, data_dir, batch_size=32):
        self.tra_dir = data_dir + "train_images/"
        self.tst_dir = data_dir + "test_images/*"
        self.batch_size = batch_size
        all_path_lst = []
        for dir_idx in range(0, 6):
            dir_path = glob.glob(self.tra_dir+str(dir_idx)+"/*")
            all_path_lst.extend(dir_path)
            
        all_path_lst = list(np.random.permutation(all_path_lst))
        self.read_gen = self.read_img(all_path_lst)
        self.dat_len = len(all_path_lst)
        
        self.all_test_path = glob.glob(self.tst_dir)
        self.tst_len = len(self.all_test_path)
        
        
    def get_dat_len(self):
        return self.dat_len
    
    def get_tst_len(self):
        return self.tst_len
        
    def get_tra_batch(self):
        #print(shufIdx_lst)
        #all_path_lst = [all_path_lst[ran_seed] for ran_seed in shufIdx_lst]
        batch_imgs = []
        batch_labels = []
        for _ in range(self.batch_size):
            img, label = next(self.read_gen)
            batch_imgs.append(img)
            label = np_utils.to_categorical(label, 6)
            batch_labels.append(label)
        batch_imgs = np.array(batch_imgs)
        batch_labels = np.array(batch_labels)
        return batch_imgs, batch_labels
    
    def get_test_batch(self):
        for path in self.all_test_path:
            img = imageio.imread(path, pilmode="RGB")
            yield np.array(img)
        
                
    def read_img(self, all_path_lst):
        for path in all_path_lst:
            img = imageio.imread(path, pilmode="RGB")
            tmp = path.split('\\')[0]
            label = int(tmp.split('/')[-1])
        
            yield img, label
    
            
       
    
        
    


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
                label = np_utils.to_categorical(data_y, 6)
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
            
def build_model():
    # 建立簡單的線性執行的模型
    model = Sequential()
    # 建立卷積層，filter=32,即 output space 的深度, Kernal Size: 3x3, activation function 採用 relu
    model.add(Conv2D(32, kernel_size=(3, 3),
                     activation='relu',
                     input_shape=(512,512,3)))
    # 建立卷積層，filter=64,即 output size, Kernal Size: 3x3, activation function 採用 relu
    model.add(Conv2D(64, (3, 3), activation='relu'))
    
    model.add(MaxPooling2D(pool_size=(2, 2)))
    # 建立池化層，池化大小=2x2，取最大值
    # Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.25
    # Flatten層把多維的輸入一維化，常用在從卷積層到全連接層的過渡。
    model.add(Flatten())
    model.add(Dropout(0.1))
    # 全連接層: 64個output
    model.add(Dense(32, activation='relu'))
    # Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.5
    model.add(Dropout(0.2))
    # 全連接層: 32個output
    model.add(Dense(16, activation='relu'))
    # Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.5
    model.add(Dropout(0.2))
    # 使用 softmax activation function，將結果分類
    model.add(Dense(6, activation='softmax'))
    
    # 編譯: 選擇損失函數、優化方法及成效衡量方式
    model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['acc'])
    return model
    
if __name__ == "__main__":
    data_dir = "./"
    batch_size = 16
    num_class = 6
    dat_ld = data_loader(data_dir, batch_size)
    #dat_ld2 = data_loader2(data_dir)
    
    #gen2 = dat_ld2.get_tst_batch_generator()
    # (x_train,y_train)=data_x_y_preprocess('train_images1')
    
    model = build_model()
    model.summary()
    dat_len = dat_ld.get_dat_len()
    
    # 進行訓練, 訓練過程會存在 train_history 變數中
    quo, mod = divmod(dat_len, batch_size)
    assert(mod == 0)
    
    for _ in range(quo):
        [data, label] = dat_ld.get_tra_batch()
        [loss, acc] = model.train_on_batch(data, label)
        #pred = model.predict(data)
        #print('pred ', pred, ' ; label ', label)
        print('loss : {} ; acc : {}'.format(loss, acc))
    
    model.save_weights('./weight/model_weight.h5')
    
    # model.load_weight('./weight/model_weight.h5')
    ## predicting phase : 
    get_test_batch = dat_ld.get_test_batch()
    tst_len = dat_ld.get_tst_len()
    
    for _ in range(tst_len): 
        [img, label] = next( get_test_batch)     ##  read one image per for loop.
        pred = model.predict(img)     ## Note the pred and label, both of that are numpy.ndarray type data
        print('pred result = { } '.format( pred ) )
    
    # # train_history = model.fit(x_train, y_train,
    # #           batch_size=32,
    # #           epochs=1,
    # #           verbose=1,
    # #           validation_split=0.1)
    # try:
    #     model.fit_generator(gen, steps_per_epoch=32, epochs=5, verbose=1, max_queue_size=1,workers=1)
    # except RuntimeError:
    #         print("end")
    
    # try:
    #     # 顯示損失函數、訓練成果(分數)
    #     score = model.evaluate_generator(gen2, verbose=1)
    # except RuntimeError:
    #         print("end")
        
    # print('Test loss:', score[0])
    # print('Test accuracy:', score[1])# -*- coding: utf-8 -*-

        
        


