$NetBSD$
(1)
 To work with emacs-25 or later
 You will get following error if C-s tried for incremental search.
 Symbol's function definition is void: isearch-last-command-char

--- work/tc/lisp/tc-sysdep.el.orig	2013-01-22 22:07:16.000000000 +0900
+++ lisp/tc-sysdep.el	2013-01-22 22:10:14.000000000 +0900
@@ -228,7 +228,7 @@ BODY should be a list of lisp expression
 ;;;
 ;;; Fix incompatibilities between 18 and 19.
 ;;;
-(if (string-match "^\\(19\\|2[01234]\\)" emacs-version)
+(if (string-match "^\\(19\\|2[0-9]\\)" emacs-version)
     (progn
       (defun tcode-redo-command (ch)
 	"���� CH �򸽺ߤΥ����ޥåפǺƼ¹Ԥ���"
