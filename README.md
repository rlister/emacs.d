# emacs.d

My emacs configs. You probably don't want to use these. Any attempt to
do so will most certainly result in loss of hair and negative financial
consequences, leading to increased stress levels and potentially
serious psychological trauma, culminating in a downward spiral,
inevitable madness and a lingering, painful demise.

## Installation

Do not install as `~/.emacs.d`, since that directory tends to get
polluted by various application caches and other files.

The config is written in a literate programming style using [org-babel](https://orgmode.org/worg/org-contrib/babel/intro.html)
in the file [init.org](./init.org).

Clone this repo anywhere, open `init.org` and run `org-babel-tangle`, which will generate `~/.emacs.d/init.el`.

## Install emacs

### Arch linux

Offical `emacs` package is up to date:

```
pacman -S emacs
```

### macOS

Homebrew broke installation by removing install options, so it is now
better to install from source.

Install dependencies:

```
brew install autoconf texinfo gnutls pkg-config gpg2
```

Install cmdline tools headers (needed if seeing errors on `libxml/tree.h`):

```
cp /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg ~/Desktop
open Desktop/macOS_SDK_headers_for_macOS_10.14.pkg
```

Clone and compile emacs:

```
git clone git://git.savannah.gnu.org/emacs.git
./autogen.sh
./configure
make
sudo make install
```

Symlink cocoa app:

```
cd /Applications/
ln -s ~/src/emacs/nextstep/Emacs.app .
```
