$NetBSD$

* Support Boost 1.46.1

--- include/libtorrent/udp_socket.hpp.orig	2010-07-25 01:26:41.000000000 +0000
+++ include/libtorrent/udp_socket.hpp
@@ -37,6 +37,7 @@ POSSIBILITY OF SUCH DAMAGE.
 #include "libtorrent/buffer.hpp"
 #include "libtorrent/session_settings.hpp"
 
+#include <list>
 #include <vector>
 #include <boost/function.hpp>
 #include <boost/thread/mutex.hpp>
