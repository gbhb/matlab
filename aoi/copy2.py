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
from keras import optimizers, regularizers, metrics, regularizers, models, layers, utils

import os
import random
import numpy as np
import csv

def data_x_y_preprocess(datapath):
    
# 定義圖像寬、高
    img_rows, img_cols = 128, 128
    datapath =datapath
    data_x=np.zeros((128,128)).reshape(1,128,128)
    pictureCount=0
    data_y=[]
    num_class=6
    for root,dirs,files in os.walk(datapath):
        for f in files:
            label=int(root.split("\\")[1])
            data_y.append(label)
            fullpath=os.path.join(root,f)
            img=Image.open(fullpath)
            img = img.resize((128, 128),Image.BILINEAR)
            img=(np.array(img)/255).reshape(1,128,128)
            data_x=np.vstack((data_x,img))
            pictureCount +=1
    data_x=np.delete(data_x,[0],0)
    data_x=data_x.reshape(pictureCount,img_rows,img_cols,1)
    data_y=np_utils.to_categorical(data_y,num_class)
    return data_x,data_y

def data_x_y_preprocessqq(datapath):
    
# 定義圖像寬、高
    img_rows, img_cols = 128, 128
    datapath =datapath
    data_x=np.zeros((128,128)).reshape(1,128,128)
    pictureCount=0
    data_y=[]
    num_class=6
    for root,dirs,files in os.walk(datapath):
        for f in files:
            label=0
            data_y.append(label)
            fullpath=os.path.join(root,f)
            img=Image.open(fullpath)
            img = img.resize((128, 128),Image.NEAREST)
            img=(np.array(img)/255).reshape(1,128,128)
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
# # 建立卷積層，filter=32,即 output space 的深度, Kernal Size: 3x3, activation function 採用 relu
# model.add(Conv2D(32, kernel_size=(5, 5),
#                  activation='relu',
#                  input_shape=(128,128,1)))

# model.add(MaxPooling2D(pool_size=(2, 2)))
# # 建立卷積層，filter=128,即 output size, Kernal Size: 3x3, activation function 採用 relu
# model.add(Conv2D(32, (3, 3), activation='relu'))
# # 建立池化層，池化大小=2x2，取最大值
# model.add(MaxPooling2D(pool_size=(2, 2)))
# # Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.25
# model.add(Dropout(0.1))
# # Flatten層把多維的輸入一維化，常用在從卷積層到全連接層的過渡。
# model.add(Flatten())
# model.add(Dropout(0.1))
# # 全連接層: 128個output
# model.add(Dense(256, activation='relu'))
# # Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.5
# model.add(Dropout(0.25))
# # 使用 softmax activation function，將結果分類
# model.add(Dense(units=6, activation='softmax'))
# model.summary()        

# # 編譯: 選擇損失函數、優化方法及成效衡量方式
# model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

model.add(Conv2D(32, (1, 1),activation="relu"))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Dropout(0.2))
model.add(Conv2D(64,(3, 3),activation="relu"))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Dropout(0.2))
model.add(Flatten())
model.add(Dense(32))
model.add(Dense(64))

model.add(Dropout(0.2))
model.add(Dense(64))

model.add(Dense(256))
model.add(Dense(512))
model.add(Dense(6,activation='softmax'))

#conv_base.trainable = False #

model.compile(loss='categorical_crossentropy',
              optimizer=optimizers.RMSprop(lr=2e-5),
              metrics=['acc'])
# 進行訓練, 訓練過程會存在 train_history 變數中
train_history = model.fit(x_train, y_train,
          batch_size=32,
          epochs=50,
          verbose=1,
          validation_split=0.1)

# 顯示損失函數、訓練成果(分數)
score = model.evaluate(x_test, y_test, verbose=1)
print('Test loss:', score[0])
print('Test accuracy:', score[1])# -*- coding: utf-8 -*-
pred=model.predict(x_test)
plt.plot(train_history.history['loss'])
plt.plot(train_history.history['val_loss'])
plt.title('Train History')
plt.ylabel('loss')
plt.ylabel('epochs')
plt.legend(['loss','val_loss'],loc='upper left')
plt.show()
i =0 
#f1 = open ("inFile","r") # open input file for reading
with open('output.csv', 'w') as csvfile:
	writer = csv.writer(csvfile)
	writer.writerow(['Label'])
	#print(len(pred))
	while i < len(pred):
		#image, label = test_generator2._get_batches_of_transformed_samples(np.array([i]))
		result=np.where(pred[i] == np.amax(pred[i]))[0][0]
		writer.writerow([result])
		i=i+1
	print(i)
import pandas as pd
data = pd.read_csv('output.csv', sep='\t')
data.dropna()
data.dropna().to_csv('clean.csv')

"""
Created on Thu May 21 02:39:39 2020

@author: gbhb
"""


