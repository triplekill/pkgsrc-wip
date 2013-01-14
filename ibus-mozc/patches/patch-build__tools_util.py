$NetBSD$

--- build_tools/util.py.orig	2012-08-31 05:37:06.000000000 +0000
+++ build_tools/util.py
@@ -56,6 +56,10 @@ def IsLinux():
   """Returns true if the platform is Linux."""
   return os.name == 'posix' and os.uname()[0] == 'Linux'
 
+def IsNetBSD():
+  """Returns true if the platform is Linux."""
+  return os.name == 'posix' and os.uname()[0] == 'NetBSD'
+
 
 def GetNumberOfProcessors():
   """Returns the number of CPU cores available.
