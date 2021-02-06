import keras
from keras import optimizers
from keras.datasets import cifar10
from keras.models import Sequential
from keras.layers import Conv2D, Dense, Flatten, MaxPooling2D
from keras.callbacks import LearningRateScheduler, TensorBoard
import matplotlib.pyplot as plt
import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"

# parameters
#128 0.0005 0.619
#64 0.0005 0.643
batch = 128
epoch = 100
classes = 10
pad = 'valid'     # padding    same
act = 'relu'      # activation function
init = 'he_normal' # kernel_initializer
rate = 0.00055 # learning rate 0.0005
# log_filepath = './lenet'

(x_train, y_train), (x_test, y_test) = cifar10.load_data()

# one-hot & normalization
y_train = keras.utils.to_categorical(y_train, classes)
y_test = keras.utils.to_categorical(y_test, classes)
x_train = x_train.astype('float32')/255.0
x_test = x_test.astype('float32')/255.0


def build_model():
    model = Sequential()
    # Convolution layer 1 3*32*32 to 6*28*28
    model.add(Conv2D(6, (5, 5), padding=pad, activation=act, kernel_initializer=init, input_shape=(32, 32, 3)))
    # Pooling layer1 6*28*28 to 6*14*14
    model.add(MaxPooling2D((2, 2), strides=(2, 2)))
    # Convolution layer 2 6*14*14 to 16*10*10
    model.add(Conv2D(16, (5, 5), padding=pad, activation=act, kernel_initializer=init))
    # Pooling layer2 16*10*10 to 16*5*5
    model.add(MaxPooling2D((2, 2), strides=(2, 2)))
    # Connection to fully connected layer
    model.add(Flatten())
    # Fully connected layer 1
    model.add(Dense(120, activation=act, kernel_initializer=init))
    # Fully connected layer 2
    model.add(Dense(84, activation=act, kernel_initializer=init))
    # Softmax layer
    model.add(Dense(10, activation='softmax', kernel_initializer=init))
    # Optmizer
    opt = optimizers.SGD(lr=rate, momentum=0.9, nesterov=True, decay=1e-6)
    # opt = keras.optimizers.RMSprop(learning_rate=rate, decay=1e-6)
    model.compile(loss='categorical_crossentropy', optimizer=opt, metrics=['accuracy'])
    return model


model = build_model()
# training
document = model.fit(x_train, y_train, batch_size=batch, epochs=epoch, validation_data=(x_test, y_test), shuffle=True)

# visualization
loss = document.history.get('loss')
acc = document.history.get('accuracy')
val_loss = document.history.get('val_loss')
val_acc = document.history.get('val_accuracy')
num = list(range(1, epoch+1))


# Loss
plt.plot(num, loss, linewidth=5, color='b')
plt.title("Loss of training", fontsize=24, color='r')
plt.xlabel("Epoch", fontsize=14, color='g')
plt.ylabel("Loss", fontsize=14, color='g')
plt.tick_params(axis='both', labelsize=14)
plt.show()
# Accuracy
plt.plot(num, acc, linewidth=5, color='b')
plt.title("Accuracy of training", fontsize=24, color='r')
plt.xlabel("Epoch", fontsize=14, color='g')
plt.ylabel("Accuracy", fontsize=14, color='g')
plt.tick_params(axis='both', labelsize=14)
plt.show()
# Loss
plt.plot(num, val_loss, linewidth=5, color='b')
plt.title("Loss of Testing", fontsize=24, color='r')
plt.xlabel("Epoch", fontsize=14, color='g')
plt.ylabel("Loss", fontsize=14, color='g')
plt.tick_params(axis='both', labelsize=14)
plt.show()
# Accuracy
plt.plot(num, val_acc, linewidth=5, color='b')
plt.title("Accuracy of Testing", fontsize=24, color='r')
plt.xlabel("Epoch", fontsize=14, color='g')
plt.ylabel("Accuracy", fontsize=14, color='g')
plt.tick_params(axis='both', labelsize=14)

plt.show()
