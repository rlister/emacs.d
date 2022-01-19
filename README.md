# emacs.d

My emacs configs. You probably don't want to use these. Any attempt to
do so will most certainly result in loss of hair and negative
financial consequences, leading to increased stress levels and
potentially serious psychological trauma, culminating in a downward
spiral, inevitable madness and a lingering, painful demise.

## Installation

Do not install as `~/.emacs.d`, since that directory tends to get
polluted by various application caches and other files.

Clone this repo anywhere, and run `make install`, which will symlink
the following files to `~/.emacs.d`:

- [early-init.el](./early-init.el)
- [init.el](./init.el)

Install packages using `make packages` (this is idempotent). Packages
are listed in `packages.el`.
