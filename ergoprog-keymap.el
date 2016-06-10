;; -*- coding: utf-8 -*-

;; This configuration is for Spanish qwerty keyboard layout

;; Programming commands
(define-key ergoemacs-keymap ergoemacs-beginning-of-buffer-key 'backward-sexp)
(define-key ergoemacs-keymap ergoemacs-end-of-buffer-key 'forward-sexp)
(define-key ergoemacs-keymap ergoemacs-backward-paragraph-key 'ergoprog-beginning-of-block)
(define-key ergoemacs-keymap ergoemacs-forward-paragraph-key 'ergoprog-end-of-block)
(define-key ergoemacs-keymap (kbd "S-SPC") 'set-mark-command) ; Alternative to Alt+Space (when using Remote Desktop)
(define-key ergoemacs-keymap (kbd "M-S-SPC") 'mark-sexp)
(define-key ergoemacs-keymap (kbd "M-C-SPC") 'mark-paragraph)
(define-key ergoemacs-keymap (kbd "M-m M-SPC") 'mark-paragraph)
(define-key ergoemacs-keymap ergoemacs-move-beginning-of-line-key 'ergoprog-beginning-of-line-and-buffer)
(define-key ergoemacs-keymap ergoemacs-move-end-of-line-key 'ergoprog-end-of-line-and-buffer)
(define-key ergoemacs-keymap (kbd "M-S-<backspace>") 'backward-kill-sexp)
(define-key ergoemacs-keymap (kbd "M-S-<delete>") 'kill-sexp)
(define-key ergoemacs-keymap (kbd "M-D") 'backward-kill-sexp)
(define-key ergoemacs-keymap (kbd "M-F") 'kill-sexp)
(define-key ergoemacs-keymap (kbd "M-;") 'comment-dwim) ; ErgoEmacs problem: M-´ is a dead-key in Spanish keyboard
(define-key ergoemacs-keymap (kbd "M-7") 'complete-symbol)
(define-key ergoemacs-keymap (kbd "M-/") 'dabbrev-expand)
(define-key ergoemacs-keymap (kbd "M-_") 'toggle-camel-case)
(define-key ergoemacs-keymap (kbd "M-?") 'ergoprog-open-and-close-php-tag)
(define-key ergoemacs-keymap (kbd "ESC M-?") 'ergoprog-open-and-close-php-tag-with-echo)

;; Programming symbols. All this makes sense in Spanish keyboard
;; layout because ( and ) are Shift+8 and Shift+9, so we can use Alt+8
;; and Alt+9 to write { and }, or Alt+Shift+8 and Alt+Shift+9 to write
;; [ and ].
(define-key ergoemacs-keymap (kbd "M-8") "{")
(define-key ergoemacs-keymap (kbd "M-9") "}")
(define-key ergoemacs-keymap (kbd "M-(") "[")
(define-key ergoemacs-keymap (kbd "M-)") "]")
(define-key ergoemacs-keymap (kbd "M-,") "<")
(define-key ergoemacs-keymap (kbd "M-.") ">")
(define-key ergoemacs-keymap (kbd "M-:") "->") ; C++ arrow

;; Change isearch key to M-y/Y
(define-key ergoemacs-keymap ergoemacs-isearch-forward-key nil)
(define-key ergoemacs-keymap ergoemacs-isearch-backward-key nil)
(setq ergoemacs-isearch-forward-key (kbd "M-y"))
(setq ergoemacs-isearch-backward-key (kbd "M-Y"))
(define-key ergoemacs-keymap ergoemacs-isearch-forward-key 'isearch-forward)
(define-key ergoemacs-keymap ergoemacs-isearch-backward-key 'isearch-backward)

;; Common commands
(define-key ergoemacs-keymap (kbd "M-b") 'switch-to-buffer)
(define-key ergoemacs-keymap (kbd "M-B") 'ibuffer)
(define-key ergoemacs-keymap (kbd "M-M") 'execute-extended-command)
(define-key ergoemacs-keymap (kbd "M-m s") 'save-buffer)
(define-key ergoemacs-keymap (kbd "M-m M-s") 'save-some-buffers)
(define-key ergoemacs-keymap (kbd "M-m f") 'find-file)
(define-key ergoemacs-keymap (kbd "M-m d") 'ido-dired)
(define-key ergoemacs-keymap (kbd "M-m M-f") 'projectile-find-file)
(define-key ergoemacs-keymap (kbd "M-m M-g") 'grep-find)
(define-key ergoemacs-keymap (kbd "M-m h") 'back-to-indentation)
(define-key ergoemacs-keymap (kbd "M-m t") 'transpose-chars)
(define-key ergoemacs-keymap (kbd "M-m M-t") 'transpose-words)
(define-key ergoemacs-keymap (kbd "M-m M-T") 'transpose-sexps)
(define-key ergoemacs-keymap (kbd "M-m g") 'goto-line)
(define-key ergoemacs-keymap (kbd "M-m o") 'ff-get-other-file)
(define-key ergoemacs-keymap (kbd "M-m C-t") 'transpose-lines)
(define-key ergoemacs-keymap (kbd "M-m c") 'capitalize-word)
(define-key ergoemacs-keymap (kbd "M-m l") 'downcase-word)
(define-key ergoemacs-keymap (kbd "M-m u") 'upcase-word)
(define-key ergoemacs-keymap (kbd "M-m a") 'sort-lines)
(define-key ergoemacs-keymap (kbd "M-m i") 'sort-includes)
(define-key ergoemacs-keymap (kbd "M-m M-i") 'ergoprog-indent)

;; Macros
(define-key ergoemacs-keymap (kbd "M-m m") 'ergoprog-switch-macro-recording) ;; Start/end recording macro
(define-key ergoemacs-keymap (kbd "M-m j") 'ergoprog-switch-macro-editing) ;; Edit macro
(define-key ergoemacs-keymap (kbd "M-m l") 'kmacro-end-and-call-macro)       ;; Run macro

(define-key ergoemacs-keymap (kbd "M-m I") 'kmacro-insert-counter)           ;; Insert counter
(define-key ergoemacs-keymap (kbd "M-m S") 'kmacro-set-counter)              ;; Set counter

;; Registers
(define-key ergoemacs-keymap (kbd "M-m M-k") 'point-to-register) ;; k = Down = Point
(define-key ergoemacs-keymap (kbd "M-m M-i") 'jump-to-register)  ;; i = Up = Jump
(define-key ergoemacs-keymap (kbd "M-m M-c") 'copy-to-register)  ;; c = Copy
(define-key ergoemacs-keymap (kbd "M-m M-v") 'insert-register)   ;; v = Paste
(define-key ergoemacs-keymap (kbd "M-m M-b") 'list-registers)

;; Bookmarks
(define-key ergoemacs-keymap (kbd "M-m k") 'bookmark-set)        ;; k = Down = Set
(define-key ergoemacs-keymap (kbd "M-m i") 'bookmark-jump)       ;; i = Up = Jump
(define-key ergoemacs-keymap (kbd "M-m b") 'bookmark-bmenu-list) ;; b = Switch Buffer = List Bookmarks

