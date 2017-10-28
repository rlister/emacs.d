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
mkdir -p ~/.emacs.d && cd ~/.emacs.d
ln -s ../code/emacs.d/init.el .
```

## Install emacs

I install emacs from homebrew:

```
brew install emacs --with-cocoa --devel --srgb
brew linkapps emacs
```

`linkapps` may be problematic with e.g. Spotlight. If you use Alfred
to launch apps, you can probably just let it find `Emacs.app` from
`/usr/local/Cellar/emacs`, or copy `Emacs.app` to `/Applications`.

Emacs should install required packages from Elpa and Melpa on startup.

## Emacs.app

Applications started from finder in OSX will not get shell
environment. Solution is to run homebrew Emacs.app from a wrapper
shell script that sources profile. Install `Emacs.app` to
`/Applications` and run from there.
