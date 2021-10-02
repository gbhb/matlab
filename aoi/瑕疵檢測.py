from __future__ import print_function
from PIL import Image
import keras
from keras.models import Sequential
from keras.models import load_model
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.models import load_model
from keras.utils import np_utils
from matplotlib import pyplot as plt
from keras import backend as K
import os
os.environ["CUDA_VISIBLE_DEVICES"]="0"
import random
import numpy as np
from numpy import random
import csv
from numba import cuda
img_size = 128

def data_x_y_preprocess(datapath):
    
    datapath =datapath
    data_x=np.zeros((img_size,img_size)).reshape(1,img_size,img_size)
    pictureCount=0
    data_y=[]
    num_class=6
    for root,dirs,files in os.walk(datapath):
        for f in files:
            label=int(root.split("\\")[1])
            data_y.append(label)
            fullpath=os.path.join(root,f)
            print(fullpath)
            img=Image.open(fullpath)
            img = img.resize((img_size, img_size),Image.LANCZOS)
            img=(np.array(img)/255).reshape(1,img_size,img_size)
            data_x=np.vstack((data_x,img))
            pictureCount +=1
    data_x=np.delete(data_x,[0],0)
    data_x=data_x.reshape(pictureCount,img_size,img_size,1)
    data_y=np_utils.to_categorical(data_y,num_class)
    return data_x,data_y

def data_x_y_preprocessqq(datapath):
    

    datapath =datapath
    data_x=np.zeros((img_size,img_size)).reshape(1,img_size,img_size)
    pictureCount=0
    data_y=[]
    num_class=6
    for root,dirs,files in os.walk(datapath):
        for f in files:
            label=0
            data_y.append(label)
            fullpath=os.path.join(root,f)
            print(fullpath)
            img=Image.open(fullpath)
            img = img.resize((img_size, img_size),Image.LANCZOS)
            img=(np.array(img)/255).reshape(1,img_size,img_size)
            data_x=np.vstack((data_x,img))
            pictureCount +=1
    data_x=np.delete(data_x,[0],0)
    data_x=data_x.reshape(pictureCount,img_size,img_size,1)
    data_y=np_utils.to_categorical(data_y,num_class)
    return data_x,data_y

def generator(features, labels, batch_size):
 # Create empty arrays to contain batch of features and labels#
 batch_features = np.zeros((batch_size, img_size, img_size, 1))
 batch_labels = np.zeros((batch_size, 6))
 while True:
   for i in range(batch_size):
     # choose random index in features
     index= random.choice(len(features),1)
     batch_features[i] = features[index]
     batch_labels[i] = labels[index]
   #batch_labels = np_utils.to_categorical(batch_labels, 6)
   yield batch_features, batch_labels

(x_train,y_train)=data_x_y_preprocess('train_images')
(x_test,y_test)=data_x_y_preprocessqq('test_images')



# 建立簡單的線性執行的模型
model = Sequential()
# 建立卷積層，filter=32,即 output space 的深度, Kernal Size: 3x3, activation function 採用 relu
model.add(Conv2D(8, kernel_size=(3, 3),
                 activation='relu',
                 input_shape=(img_size,img_size,1)))
# 建立卷積層，filter=64,即 output size, Kernal Size: 3x3, activation function 採用 relu
model.add(Conv2D(16, (3, 3), activation='relu'))
#model.add(Conv2D(128, (3, 3), activation='relu'))
# 建立池化層，池化大小=2x2，取最大值
model.add(MaxPooling2D(pool_size=(2, 2)))
# Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.25
model.add(Dropout(0.2))
# Flatten層把多維的輸入一維化，常用在從卷積層到全連接層的過渡。
model.add(Flatten())
# 全連接層: 128個output
model.add(Dense(2048, activation='relu'))
# Dropout層隨機斷開輸入神經元，用於防止過度擬合，斷開比例:0.5
model.add(Dropout(0.2))
# 使用 softmax activation function，將結果分類
model.add(Dense(units=6, activation='softmax'))

# 編譯: 選擇損失函數、優化方法及成效衡量方式
model.compile(loss=keras.losses.categorical_crossentropy,
              optimizer=keras.optimizers.Adadelta(),
              metrics=['accuracy'])

# 進行訓練, 訓練過程會存在 train_history 變數中
train_history = model.fit(x_train, y_train,
          batch_size=32,
          epochs=1000,
          verbose=1,
          validation_split=0.15)

#train_history = model.fit_generator(generator(x_train, y_train, 20), steps_per_epoch=200, epochs=100)

#model.save('my_model.h5')
#(x_test,y_test)=data_x_y_preprocessqq('test_images')
# 顯示損失函數、訓練成果(分數)
score = model.evaluate(x_test, y_test, verbose=1)
print('Test loss:', score[0])
print('Test accuracy:', score[1])# -*- coding: utf-8 -*-
pred=model.predict(x_test)
'''
plt.plot(train_history.history['loss'])
plt.plot(train_history.history['val_loss'])
plt.title('Train History')
plt.ylabel('loss')
plt.ylabel('epochs')
plt.legend(['loss','val_loss'],loc='upper left')
plt.show()
'''
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
K.clear_session()
del model

"""
Created on Thu May 21 02:39:39 2020

@author: gbhb
"""

