$NetBSD$
(1)
 To work with emacs-24.2 or later
 You will get following error if C-s tried for incremental search.
 Symbol's function definition is void: isearch-last-command-char
 
(2) 24.2 or later
 convert inactivate-input-method to deactivate-input-method

--- lisp/tc-sysdep.el.orig	2012-08-17 13:57:57.000000000 +0900
+++ lisp/tc-sysdep.el	2012-08-17 14:14:44.000000000 +0900
@@ -228,7 +228,7 @@
 ;;;
 ;;; Fix incompatibilities between 18 and 19.
 ;;;
-(if (string-match "^\\(19\\|2[0123]\\)" emacs-version)
+(if (string-match "^\\(19\\|2[0-9]\\)" emacs-version)
     (progn
       (defun tcode-redo-command (ch)
 	"���� CH �򸽺ߤΥ����ޥåפǺƼ¹Ԥ���"
@@ -240,13 +240,13 @@
       ;; XEmacs
       (or (fboundp 'isearch-last-command-char)
 	  (defun isearch-last-command-char ()
-	    last-command-char))
+	    last-command-event))
       (or (boundp 'search-upper-case)
 	  (setq search-upper-case 'not-yanks)))
   ;; NEmacs
   (defun tcode-redo-command (ch)
     "���� CH �򸽺ߤΥ����ޥåפǺƼ¹Ԥ���"
-    (setq unread-command-char ch)))
+    (setq unread-command-events ch)))
 
 (if (not (tcode-nemacs-p))
     (progn
@@ -489,10 +489,10 @@
 	(setq slot (cons input-method info))
 	(setq input-method-alist (cons slot input-method-alist))))))
 
-(unless (fboundp 'inactivate-input-method)
-  (defun inactivate-input-method ()
-    (if inactivate-current-input-method-function
-	(funcall inactivate-current-input-method-function))
+(unless (fboundp 'deactivate-input-method)
+  (defun deactivate-input-method ()
+    (if deactivate-current-input-method-function
+	(funcall deactivate-current-input-method-function))
     (setq current-input-method nil)))
 
 (unless (fboundp 'activate-input-method)
@@ -500,13 +500,13 @@
   (make-variable-buffer-local 'default-input-method)
   (defvar current-input-method nil)
   (make-variable-buffer-local 'current-input-method)
-  (defvar inactivate-current-input-method-function nil)
-  (make-variable-buffer-local 'inactivate-current-input-method-function)
+  (defvar deactivate-current-input-method-function nil)
+  (make-variable-buffer-local 'deactivate-current-input-method-function)
 
   (defun activate-input-method (input-method)
     (if (and current-input-method
 	     (not (string= current-input-method input-method)))
-	(inactivate-input-method))
+	(deactivate-input-method))
     (let* ((slot (assoc input-method input-method-alist)))
       (apply (nth 2 slot) input-method (nthcdr 5 slot))
       (setq current-input-method input-method))))
@@ -518,7 +518,7 @@
   (defun toggle-input-method (&optional arg)
     (interactive "P")
     (if (and current-input-method (not arg))
-	(inactivate-input-method)
+	(deactivate-input-method)
       (if (null default-input-method)
 	  (let* ((completion-ignore-case t)
 		 (im (completing-read "Input method: " 
