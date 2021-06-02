from __future__ import print_function
from PIL import Image
import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.models import load_model
from keras.utils import np_utils
from matplotlib import pyplot as plt
from keras import backend as K
import os
import random
import numpy as np

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
            label=int(root.split("\\")[1])
            data_y.append(label)
            fullpath=os.path.join(root,f)
            img=Image.open(fullpath)
            img=(np.array(img)/255).reshape(1,128,128)
            data_x=np.vstack((data_x,img))
            pictureCount +=1
    data_x=np.delete(data_x,[0],0)
    data_x=data_x.reshape(pictureCount,img_rows,img_cols,1)
    data_y=np_utils.to_categorical(data_y,num_class)
    return data_x,data_y
def data_x_y_preprocessqq(datapath):
# 定義圖像寬、高
    img_rows, img_cols = 512, 512
    datapath =datapath
    data_x=np.zeros((512,512)).reshape(1,512,512)
    pictureCount=0
    data_y=[]
    num_class=6
    for root,dirs,files in os.walk(datapath):
        for f in files:
            fullpath=os.path.join(root,f)
            img=Image.open(fullpath)
            img=(np.array(img)/255).reshape(1,512,512)
            data_x=np.vstack((data_x,img))
            pictureCount +=1
    data_x=np.delete(data_x,[0],0)
    data_x=data_x.reshape(pictureCount,img_rows,img_cols,1)
    data_y=np_utils.to_categorical(data_y,num_class)
    return data_x,data_y

(x_train,y_train)=data_x_y_preprocess('train_images')
(x_test,y_test)=data_x_y_preprocessqq('test_images')

# 建立簡單的線性執行的模型
model = Sequential()
# 建立卷積層，filter=32,即 output space 的深度, Kernal Size: 3x3, activation function 採用 relu
model.add(Conv2D(32, kernel_size=(3, 3),
                 activation='relu',
                 input_shape=(512,512,1)))
# 建立卷積層，filter=64,即 output size, Kernal Size: 3x3, activation function 採用 relu
model.add(Conv2D(64, (3, 3), activation='relu'))
# 建立池化層，池化大小=2x2，取最大值
model.add(MaxPooling2D(pool_size=(2, 2)))
# Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.25
model.add(Dropout(0.1))
# Flatten層把多維的輸入一維化，常用在從卷積層到全連接層的過渡。
model.add(Flatten())
model.add(Dropout(0.1))
# 全連接層: 1512個output
model.add(Dense(1512, activation='relu'))
# Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.5
model.add(Dropout(0.25))
# 使用 softmax activation function，將結果分類
model.add(Dense(units=6, activation='softmax'))

# 編譯: 選擇損失函數、優化方法及成效衡量方式
model.compile(loss=keras.losses.categorical_crossentropy,
              optimizer=keras.optimizers.Adadelta(),
              metrics=['accuracy'])

# 進行訓練, 訓練過程會存在 train_history 變數中
train_history = model.fit(x_train, y_train,
          batch_size=32,
          epochs=150,
          verbose=1,
          validation_split=0.1)

# 顯示損失函數、訓練成果(分數)
score = model.evaluate(x_test, y_test, verbose=0)
print('Test loss:', score[0])
print('Test accuracy:', score[1])# -*- coding: utf-8 -*-
plt.plot(train_history.history['loss'])
plt.plot(train_history.history['val_loss'])
plt.title('Train History')
plt.ylabel('loss')
plt.ylabel('epochs')
plt.legend(['loss','val_loss'],loc='upper left')
plt.show()


"""
Created on Thu May 21 02:39:39 2020

@author: gbhb
"""


