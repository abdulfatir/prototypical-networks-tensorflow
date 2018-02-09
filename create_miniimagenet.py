from __future__ import print_function
import glob
import os
import numpy as np
import cv2

n_train_classes = 64
n_test_classes = 20
n_examples, width, height, channels = 350, 84, 84, 3

root_path = './data/mini-imagenet/data'
train_path = os.path.join(root_path, 'train')
test_path = os.path.join(root_path, 'test')

train_dirs = [f for f in glob.glob(os.path.join(train_path, '*')) if os.path.isdir(f)]
test_dirs = [f for f in glob.glob(os.path.join(test_path, '*')) if os.path.isdir(f)]

assert len(train_dirs) == n_train_classes
assert len(test_dirs) == n_test_classes

read_and_resize = lambda x: cv2.resize(cv2.imread(x, 1), (width, height))

def sample_dataset(dataset, dirs, name='train'):
    for i, d in enumerate(dirs):
        fs = np.asarray(glob.glob(os.path.join(d, '*.JPEG')))
        fs = fs[np.random.permutation(len(fs))][:n_examples]
        for j, f in enumerate(fs):
            dataset[i, j] = read_and_resize(f)
        print('{}: {} of {}'.format(name, i + 1, len(dirs)))
    return dataset

train_dataset = np.zeros((n_train_classes, n_examples, width, height, channels), dtype=np.uint8)
train_dataset = sample_dataset(train_dataset, train_dirs)
np.save('mini-imagenet-train.npy', train_dataset)
del train_dataset

test_dataset = np.zeros((n_test_classes, n_examples, width, height, channels), dtype=np.uint8)
test_dataset = sample_dataset(test_dataset, test_dirs, name='test')
np.save('mini-imagenet-test.npy', test_dataset)