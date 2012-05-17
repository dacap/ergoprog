# ErgoProg - ErgoEmacs mod for programming

Some modifications to ErgoEmacs keybindings for programmers.
Here you can see the layout:

  http://dacap.com.ar/programming/keyboard-layout/

Then main change is the defun & sexp movement.

## How to enable it?

First you have to initialize ErgoEmacs:

    (load "~/.emacs.d/packages/ergoemacs-keybindings/ergoemacs-mode.el")
    (ergoemacs-mode 1)

Then you can enable ErgoProg adding its path to load-path and
requiring `ergoprog` feature.

    (add-to-list 'load-path "~/.emacs.d/packages/ergoprog")
    (require 'ergoprog)
