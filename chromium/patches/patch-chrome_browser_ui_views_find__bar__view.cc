$NetBSD$

--- chrome/browser/ui/views/find_bar_view.cc.orig	2011-04-13 08:01:42.000000000 +0000
+++ chrome/browser/ui/views/find_bar_view.cc
@@ -85,7 +85,7 @@ static const int kDefaultCharWidth = 43;
 
 FindBarView::FindBarView(FindBarHost* host)
     : DropdownBarView(host),
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_USES_GTK)
       ignore_contents_changed_(false),
 #endif
       find_text_(NULL),
@@ -176,11 +176,11 @@ FindBarView::~FindBarView() {
 }
 
 void FindBarView::SetFindText(const string16& find_text) {
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_USES_GTK)
   ignore_contents_changed_ = true;
 #endif
   find_text_->SetText(find_text);
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_USES_GTK)
   ignore_contents_changed_ = false;
 #endif
 }
@@ -467,7 +467,7 @@ void FindBarView::ButtonPressed(
 
 void FindBarView::ContentsChanged(views::Textfield* sender,
                                   const string16& new_contents) {
-#if defined(OS_LINUX)
+#if defined(TOOLKIT_USES_GTK)
   // On gtk setting the text in the find view causes a notification.
   if (ignore_contents_changed_)
     return;
