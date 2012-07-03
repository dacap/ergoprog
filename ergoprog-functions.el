;; -*- coding: utf-8 -*-

(defun ergoprog-is-text-mode ()
  (or (eq major-mode 'text-mode)
      (eq major-mode 'markdown-mode)))

(defun ergoprog-beginning-of-block ()
  (interactive)
  (if (ergoprog-is-text-mode)
      (backward-paragraph)
    (beginning-of-defun)))

(defun ergoprog-end-of-block ()
  (interactive)
  (if (ergoprog-is-text-mode)
      (forward-paragraph)
    (end-of-defun)))

(defun ergoprog-switch-macro-recording ()
  (interactive)
  (if (not defining-kbd-macro)
      (kmacro-start-macro 0)
    (kmacro-end-macro 1)))

;; ==================================================
;; Camel Case
;; ==================================================

;; These functions were taken from:
;; http://www.emacswiki.org/emacs/CamelCase

(defun un-camelcase-string (s &optional sep start)
  "Convert CamelCase string S to lower case with word separator SEP.
    Default for SEP is a hyphen \"-\".
    If third argument START is non-nil, convert words after that
    index in STRING."
  (let ((case-fold-search nil))
    (while (string-match "[A-Z]" s (or start 1))
      (setq s (replace-match (concat (or sep "-")
				     (downcase (match-string 0 s)))
			     t nil s)))
    (downcase s)))

(defun mapcar-head (fn-head fn-rest list)
  "Like MAPCAR, but applies a different function to the first element."
  (if list
      (cons (funcall fn-head (car list)) (mapcar fn-rest (cdr list)))))

(defun camelize (s)
  "Convert under_score string S to CamelCase string."
  (mapconcat 'identity (mapcar
			'(lambda (word) (capitalize (downcase word)))
			(split-string s "_")) ""))
(defun camelize-method (s)
  "Convert under_score string S to camelCase string."
  (mapconcat 'identity (mapcar-head
			'(lambda (word) (downcase word))
			'(lambda (word) (capitalize (downcase word)))
			(split-string s "_")) ""))

;; This is my camel-case switcher

(defun toggle-camel-case ()
  (interactive)
  (let* ((bounds (progn (if (= (cdr (bounds-of-thing-at-point 'word))
			       (car (bounds-of-thing-at-point 'sexp)))
			    (backward-char))
			(bounds-of-thing-at-point 'sexp)))
	 (beg (car bounds))
	 (end (cdr bounds))
	 (rgn (filter-buffer-substring beg end))
	 (case-fold-search nil))
    (delete-region beg end)
    (cond
     ((string-match "_" rgn)
      (insert (camelize-method rgn)))
     ((string-match "^[a-z]" rgn)
      (progn (insert (capitalize (substring rgn 0 1)))
	     (insert (substring rgn 1))))
     (t
      (insert (un-camelcase-string rgn "_"))))))

;; ==================================================
;; PHP facilities
;; ==================================================

(defun ergoprog-open-and-close-php-tag ()
  (interactive)
  (insert "<?php  ?>")
  (backward-char 3))

(defun ergoprog-open-and-close-php-tag-with-echo ()
  (interactive)
  (insert "<?php echo ; ?>")
  (backward-char 4))
