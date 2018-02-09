# Prototypical Networks for Few-shot Learning
Tensorflow implementation of NIPS 2017 Paper [Prototypical Networks for Few-shot Learning](http://papers.nips.cc/paper/6996-prototypical-networks-for-few-shot-learning.pdf)<sup>[1]</sup>.    

This code has been ported from the official implementation in PyTorch ([jakesnell/prototypical-networks](https://github.com/jakesnell/prototypical-networks)) and may be buggy.

## Usage
### Omniglot Dataset
* Download the Omniglot dataset by executing `download_omniglot.sh`
* Use the IPython Notebook `ProtoNet-Omniglot.ipynb`
### *mini* ImageNet v2
#### Downloading Images
* Create an account on [image-net.org](http://image-net.org/download-images) with your institutional ID.
* Replace `<username>` and `<accesskey>` in `download_miniimagenet.sh` with the username and accesskey you receive upon registration.
* Run `download_miniimagenet.sh` which will download 84 ImageNet classes from ILSVRC2011. (64 train + 20 test)
#### Testing on miniImageNet 
* Run `create_miniimagenet.py` which will generate `mini-imagenet-train.npy` and `mini-imagenet-test.npy` which are numpy arrays of shapes `64 x 350 x 84 x 84 x 3` and `20 x 350 x 84 x 84 x 3` respectively.
* Use the IPython Notebook `ProtoNet-MiniImageNet-v2.ipynb`.

**NOTE**: This miniImageNet dataset is not identical to the one used by Ravi et. al.<sup>[2]</sup> They have used images from ILSVRC2012 which can be downloaded from [here](http://www.image-net.org/challenges/LSVRC/2012/nonpub-downloads). Ravi et. al. have used 100 classes (64 training + 16 validation + 20 test) with 600 examples from each class. The script provided in this dataset downloads images from [image-net.org](http://www.image-net.org) which currently (Feb, 2018) contains images from ILSVRC2011. Therefore, some of the classes suggested by Ravi et. al. have less than 600 examples. For this reason, the number of examples of each class has been reduced to 350. The scripts provided download images corresponding to 84 classes (64 train + 20 test), the ones suggested by Ravi et. al., and then randomly samples 350 examples for each class.

## References
[1] Jake Snell, Kevin Swersky, and Richard S. Zemel. *Prototypical networks for few-shot learning*.   
[2] Sachin Ravi and Hugo Larochelle. *Optimization as a model for few-shot learning*.
