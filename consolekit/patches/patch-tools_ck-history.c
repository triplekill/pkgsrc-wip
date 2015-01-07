$NetBSD$

Fix uninitialised variable.

64-bit time_t
GLib's struct GTimeVal declares tv_sec as glong (will break around 2038).
Our struct timeval declares tv_sec as time_t...
warning: passing argument 1 of 'ctime' from incompatible pointer type

--- tools/ck-history.c.orig	2010-09-03 13:54:31.000000000 +0000
+++ tools/ck-history.c
@@ -511,9 +511,10 @@ print_last_report_record (GList      *li
         char                       *session_type;
         char                       *session_id;
         char                       *seat_id;
-        CkLogSeatSessionAddedEvent *e;
+        CkLogSeatSessionAddedEvent *e = NULL;
         CkLogEvent                 *remove_event;
         RecordStatus                status;
+        time_t                      added_t, removed_t;
 
         if (event->type != CK_LOG_EVENT_SEAT_SESSION_ADDED
             && event->type != CK_LOG_EVENT_SYSTEM_START) {
@@ -546,7 +547,8 @@ print_last_report_record (GList      *li
         utline = get_utline_for_event (event);
         host = get_host_for_event (event);
 
-        addedtime = g_strndup (ctime (&event->timestamp.tv_sec), 16);
+        added_t = &event->timestamp.tv_sec;
+        addedtime = g_strndup (ctime (&added_t), 16);
 
         if (legacy_compat) {
                 g_string_printf (str,
@@ -602,7 +604,8 @@ print_last_report_record (GList      *li
                 break;
         case RECORD_STATUS_NORMAL:
                 duration = get_duration (event, remove_event);
-                removedtime = g_strdup_printf ("- %s", ctime (&remove_event->timestamp.tv_sec) + 11);
+                removed_t = remove_event->timestamp.tv_sec;
+                removedtime = g_strdup_printf ("- %s", ctime (&removed_t) + 11);
                 removedtime[7] = 0;
                 break;
         default:
@@ -629,6 +632,7 @@ generate_report_last (int         uid,
         GList      *oldest;
         CkLogEvent *oldest_event;
         GList      *l;
+        time_t      oldest_e;
 
         /* print events in reverse time order */
 
@@ -660,7 +664,8 @@ generate_report_last (int         uid,
         oldest = g_list_first (all_events);
         if (oldest != NULL) {
                 oldest_event = oldest->data;
-                g_print ("\nLog begins %s", ctime (&oldest_event->timestamp.tv_sec));
+                oldest_e = oldest_event->timestamp.tv_sec;
+                g_print ("\nLog begins %s", ctime (&oldest_e));
         }
 }
 
@@ -672,6 +677,7 @@ generate_report_last_compat (int        
         GList      *oldest;
         CkLogEvent *oldest_event;
         GList      *l;
+        time_t      oldest_e;
 
         /* print events in reverse time order */
 
@@ -703,7 +709,8 @@ generate_report_last_compat (int        
         oldest = g_list_first (all_events);
         if (oldest != NULL) {
                 oldest_event = oldest->data;
-                g_print ("\nLog begins %s", ctime (&oldest_event->timestamp.tv_sec));
+                oldest_e = oldest_event->timestamp.tv_sec;
+                g_print ("\nLog begins %s", ctime (&oldest_e));
         }
 }
 
