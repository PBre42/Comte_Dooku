# load and evaluate a saved model
from numpy import loadtxt
from keras.models import load_model
from keras.preprocessing import image
from keras.preprocessing.image import  load_img
import numpy as np 
import cv2


import sys

# example of loading an image with the Keras API
# load the image


def Predict_Number(Img_,model,fichier):
    img = cv2.cvtColor(np.float32(Img_), cv2.COLOR_RGB2GRAY)
    img = np.asarray(img)
    img = img[4:img.shape[0] - 4, 4:img.shape[1] -4]
    img = cv2.resize(img, (32, 32))
    img = img / 255
    img = img.reshape(1, 32, 32, 1)
        # getting predictions and setting the values if probabilities are above 65% 
        
    predictions = model.predict(img)
    classIndex = (model.predict(img) > 0.5).astype("int32")
    #classIndex= model.predict_classes(img)
    probabilityValue = np.amax(predictions)
    if probabilityValue > 0.65:
        result= (classIndex[0].tolist()).index(1)
    else:
        result= 0
    #print (result)
    fichier.write(str(result) + '\n')



if __name__ == '__main__':
    model = load_model('my_model.h5')
    fichier = open("data/data.txt", "w")
    
    for line in range(1,82):
        nom= 'Data/MonNombre' + str(line) + '.png'
        img = load_img(nom)
        Predict_Number(img,model,fichier)
    #img.show()
    fichier.close()
