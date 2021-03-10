# emacs.d

My emacs configs. You probably don't want to use these. Any attempt to
do so will most certainly result in loss of hair and negative
financial consequences, leading to increased stress levels and
potentially serious psychological trauma, culminating in a downward
spiral, inevitable madness and a lingering, painful demise.

The config is written in a literate programming style using
[org-babel](https://orgmode.org/worg/org-contrib/babel/intro.html) in
the files:

- [early-init.org](./early-init.org)
- [init.org](./init.org)

## Installation

Do not install as `~/.emacs.d`, since that directory tends to get
polluted by various application caches and other files.

Clone this repo anywhere, open these files, and run
`org-babel-tangle`, which will generate `~/.emacs.d/early-init.el` and
`~/.emacs.d/init.el`.
