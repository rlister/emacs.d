# emacs.d

My emacs configs. You probably don't want to use these. Any attempt to
do so will most certainly result in loss of hair and negative financial
consequences, leading to increased stress levels and potentially
serious psychological trauma, culminating in a downward spiral,
inevitable madness and a lingering, painful demise.

## Installation

Do not install as `~/.emacs.d`, since that directory tends to get
polluted by various application caches and other files. Instead create
a couple of symlinks to files in this repo:

```
mkdir ~/.emacs.d
cd ~/.emacs.d
ln -s ../code/emacs.d/{Cask,init.el} .
brew install cask
cask install
```
