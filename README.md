# ergoprog - ergoemacs for programmers

Some modifications to ergoemacs keybindings for programmers.
In the following link you can see the layout and some explanation
how it works:

  http://davidcapello.com/programming/keyboard-layout/

The main change is the replacement of buffer/paragraph movement with
defun/sexp movement.

## How to enable it?

First you have to initialize ergoemacs-mode (an old version of
ergoemacs minor mode created by Xah Lee & me):

    (add-to-list 'load-path "~/.emacs.d/packages/ergoprog/ergoemacs-mode")
    (require ergoemacs-mode)
    (ergoemacs-mode 1)

Then you can enable ergoprog as follows:

    (add-to-list 'load-path "~/.emacs.d/packages/ergoprog")
    (require 'ergoprog)
