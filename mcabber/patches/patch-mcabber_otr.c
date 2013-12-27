$NetBSD$

Fix libotr>=4 build.

--- mcabber/otr.c.orig	2012-12-02 13:27:32.000000000 +0000
+++ mcabber/otr.c
@@ -56,6 +56,20 @@ static void       cb_inject_message     
                                          const char *protocol,
                                          const char *recipient,
                                          const char *message);
+static void       cb_update_context_list(void *opdata);
+static void       cb_new_fingerprint    (void *opdata, OtrlUserState us,
+                                         const char *accountname,
+                                         const char *protocol,
+                                         const char *username,
+                                         unsigned char fingerprint[20]);
+static void       cb_write_fingerprints (void *opdata);
+static void       cb_gone_secure        (void *opdata, ConnContext *context);
+static void       cb_gone_insecure      (void *opdata, ConnContext *context);
+static void       cb_still_secure       (void *opdata, ConnContext *context,
+                                         int is_reply);
+static int        cb_max_message_size   (void *opdata, ConnContext *context);
+
+#ifdef HAVE_LIBOTR3
 static void       cb_notify             (void *opdata,
                                          OtrlNotifyLevel level,
                                          const char *accountname,
@@ -69,22 +83,26 @@ static int        cb_display_otr_message
                                          const char *protocol,
                                          const char *username,
                                          const char *msg);
-static void       cb_update_context_list(void *opdata);
 static const char *cb_protocol_name     (void *opdata, const char *protocol);
 static void       cb_protocol_name_free (void *opdata,
                                          const char *protocol_name);
-static void       cb_new_fingerprint    (void *opdata, OtrlUserState us,
-                                         const char *accountname,
-                                         const char *protocol,
-                                         const char *username,
-                                         unsigned char fingerprint[20]);
-static void       cb_write_fingerprints (void *opdata);
-static void       cb_gone_secure        (void *opdata, ConnContext *context);
-static void       cb_gone_insecure      (void *opdata, ConnContext *context);
-static void       cb_still_secure       (void *opdata, ConnContext *context,
-                                         int is_reply);
 static void       cb_log_message        (void *opdata, const char *message);
-static int        cb_max_message_size   (void *opdata, ConnContext *context);
+
+static void       otr_handle_smp_tlvs   (OtrlTLV *tlvs, ConnContext *ctx);
+#else /* HAVE_LIBOTR3 */
+static char *tagfile = NULL;
+static guint otr_timer_source = 0;
+
+static void       cb_handle_smp_event   (void *opdata, OtrlSMPEvent event,
+                                         ConnContext *context, unsigned short percent,
+                                         char *question);
+static void       cb_handle_msg_event   (void *opdata, OtrlMessageEvent event,
+                                         ConnContext *context, const char *message,
+                                         gcry_error_t err);
+static void       cb_create_instag      (void *opdata, const char *accountname,
+                                         const char *protocol);
+static void       cb_timer_control      (void *opdata, unsigned int interval);
+#endif /* HAVE_LIBOTR3 */
 
 static OtrlMessageAppOps ops =
 {
@@ -92,26 +110,44 @@ static OtrlMessageAppOps ops =
   cb_create_privkey,
   cb_is_logged_in,
   cb_inject_message,
+#ifdef HAVE_LIBOTR3
   cb_notify,
   cb_display_otr_message,
+#endif
   cb_update_context_list,
+#ifdef HAVE_LIBOTR3
   cb_protocol_name,
   cb_protocol_name_free,
+#endif
   cb_new_fingerprint,
   cb_write_fingerprints,
   cb_gone_secure,
   cb_gone_insecure,
   cb_still_secure,
+#ifdef HAVE_LIBOTR3
   cb_log_message,
+#endif
   cb_max_message_size,
-  NULL, /*account_name*/
-  NULL  /*account_name_free*/
+  NULL, /* account_name */
+  NULL, /* account_name_free */
+#ifndef HAVE_LIBOTR3
+  NULL, /* received_symkey */
+  NULL, /* otr_error_message */
+  NULL, /* otr_error_message_free */
+  NULL, /* resent_msg_prefix */
+  NULL, /* resent_msg_prefix_free */
+  cb_handle_smp_event,
+  cb_handle_msg_event,
+  cb_create_instag,
+  NULL, /* convert_msg */
+  NULL, /* convert_free */
+  cb_timer_control,
+#endif
 };
 
 static void otr_message_disconnect(ConnContext *ctx);
 static ConnContext *otr_get_context(const char *buddy);
 static void otr_startstop(const char *buddy, int start);
-static void otr_handle_smp_tlvs(OtrlTLV *tlvs, ConnContext *ctx);
 
 static char *otr_get_dir(void);
 
@@ -135,7 +171,6 @@ void otr_init(const char *fjid)
   account = jidtodisp(fjid);
   keyfile = g_strdup_printf("%s%s.key", root, account);
   fprfile = g_strdup_printf("%s%s.fpr", root, account);
-  g_free(root);
 
   if (otrl_privkey_read(userstate, keyfile)){
     scr_LogPrint(LPRINT_LOGNORM, "Could not read OTR key from %s", keyfile);
@@ -145,6 +180,14 @@ void otr_init(const char *fjid)
     scr_LogPrint(LPRINT_LOGNORM, "Could not read OTR fingerprints from %s",
                  fprfile);
   }
+#ifndef HAVE_LIBOTR3
+  tagfile = g_strdup_printf("%s%s.tag", root, account);
+  if (otrl_instag_read(userstate, tagfile)) {
+    scr_LogPrint(LPRINT_LOGNORM, "Could not read OTR instance tag from %s", tagfile);
+    cb_create_instag(NULL, account, OTR_PROTOCOL_NAME);
+  }
+#endif
+  g_free(root);
 }
 
 void otr_terminate(void)
@@ -154,6 +197,13 @@ void otr_terminate(void)
   if (!otr_is_enabled)
     return;
 
+#ifndef HAVE_LIBOTR3
+  if (otr_timer_source > 0) {
+    g_source_remove (otr_timer_source);
+    otr_timer_source = 0;
+  }
+#endif
+
   for (ctx = userstate->context_root; ctx; ctx = ctx->next)
     if (ctx->msgstate == OTRL_MSGSTATE_ENCRYPTED)
       otr_message_disconnect(ctx);
@@ -175,6 +225,12 @@ void otr_terminate(void)
   userstate = NULL;
   g_free(keyfile);
   keyfile = NULL;
+  g_free(fprfile);
+  fprfile = NULL;
+#ifndef HAVE_LIBOTR3
+  g_free(tagfile);
+  tagfile = NULL;
+#endif
 }
 
 static char *otr_get_dir(void)
@@ -206,7 +262,12 @@ static ConnContext *otr_get_context(cons
 
   mc_strtolower(lowcasebuddy);
   ctx = otrl_context_find(userstate, lowcasebuddy, account, OTR_PROTOCOL_NAME,
+#ifdef HAVE_LIBOTR3
                           1, &null, NULL, NULL);
+#else
+                          // INSTAG XXX
+                          OTRL_INSTAG_BEST, 1, &null, NULL, NULL);
+#endif
   g_free(lowcasebuddy);
   return ctx;
 }
@@ -216,7 +277,12 @@ static void otr_message_disconnect(ConnC
   if (ctx->msgstate == OTRL_MSGSTATE_ENCRYPTED)
     cb_gone_insecure(NULL, ctx);
   otrl_message_disconnect(userstate, &ops, NULL, ctx->accountname,
+#ifdef HAVE_LIBOTR3
                           ctx->protocol, ctx->username);
+#else
+                          // INSTAG XXX
+                          ctx->protocol, ctx->username, OTRL_INSTAG_BEST);
+#endif
 }
 
 static void otr_startstop(const char *buddy, int start)
@@ -283,6 +349,8 @@ void otr_fingerprint(const char *buddy, 
   cb_write_fingerprints(NULL);
 }
 
+#ifdef HAVE_LIBOTR3
+
 static void otr_handle_smp_tlvs(OtrlTLV *tlvs, ConnContext *ctx)
 {
   OtrlTLV *tlv = NULL;
@@ -354,6 +422,130 @@ static void otr_handle_smp_tlvs(OtrlTLV 
   }
 }
 
+#else /* HAVE_LIBOTR3 */
+
+static void cb_handle_smp_event(void *opdata, OtrlSMPEvent event,
+                                ConnContext *context, unsigned short percent,
+                                char *question)
+{
+  const char *msg = NULL;
+  char *freeme = NULL;
+  switch (event) {
+    case OTRL_SMPEVENT_ASK_FOR_SECRET:
+      msg = freeme = g_strdup_printf("OTR: Socialist Millionaires' Protocol: "
+                                     "Received SMP Initiation.\n"
+                                     "Answer with /otr smpr %s $secret",
+                                     context->username);
+      break;
+    case OTRL_SMPEVENT_ASK_FOR_ANSWER:
+      msg = freeme = g_strdup_printf("OTR: Socialist Millionaires' Protocol: "
+                                     "Received SMP Initiation.\n"
+                                     "Answer with /otr smpr %s $secret\n"
+                                     "Question: %s", context->username,
+                                     question);
+      break;
+    case OTRL_SMPEVENT_CHEATED:
+      msg = "OTR: Socialist Millionaires' Protocol: Correspondent cancelled negotiation!";
+      otrl_message_abort_smp(userstate, &ops, opdata, context);
+      break;
+    case OTRL_SMPEVENT_IN_PROGRESS:
+      scr_log_print(LPRINT_DEBUG, "OTR: Socialist Millionaires' Protocol: "
+                                  "Negotiation is in pogress...");
+      break;
+    case OTRL_SMPEVENT_SUCCESS:
+      msg = "OTR: Socialist Millionaires' Protocol: Success!";
+      break;
+    case OTRL_SMPEVENT_FAILURE:
+      msg = "OTR: Socialist Millionaires' Protocol: Failure.";
+      break;
+    case OTRL_SMPEVENT_ABORT:
+      msg = "OTR: Socialist Millionaires' Protocol: Aborted.";
+      break;
+    case OTRL_SMPEVENT_ERROR:
+      msg = "OTR: Socialist Millionaires' Protocol: Error occured, aborting negotiations!";
+      otrl_message_abort_smp(userstate, &ops, opdata, context);
+      break;
+    default:
+      break;
+  }
+
+  if (msg) {
+    scr_WriteIncomingMessage(context->username, msg, 0, HBB_PREFIX_INFO, 0);
+    g_free(freeme);
+  }
+}
+
+static void cb_handle_msg_event(void *opdata, OtrlMessageEvent event,
+                                ConnContext *context, const char *message,
+                                gcry_error_t err)
+{
+  const char *msg = NULL;
+  char *freeme = NULL;
+  switch (event) {
+    case OTRL_MSGEVENT_ENCRYPTION_REQUIRED:
+      msg = "OTR: Policy requires encryption on message!";
+      break;
+    case OTRL_MSGEVENT_ENCRYPTION_ERROR:
+      msg = "OTR: Encryption error! Message not sent.";
+      break;
+    case OTRL_MSGEVENT_CONNECTION_ENDED:
+      msg = "OTR: Connection closed by remote end, message lost. "
+            "Close or refresh connection.";
+      break;
+    case OTRL_MSGEVENT_SETUP_ERROR:
+      // FIXME
+      msg = freeme = g_strdup_printf("OTR: Error setting up private conversation: %u",
+                                     err);
+      break;
+    case OTRL_MSGEVENT_MSG_REFLECTED:
+      msg = "OTR: Received own OTR message!";
+      break;
+    case OTRL_MSGEVENT_MSG_RESENT:
+      msg = "OTR: Previous message was resent.";
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_NOT_IN_PRIVATE:
+      msg = "OTR: Received encrypted message, but connection is not established " \
+            "yet! Message lost.";
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_UNREADABLE:
+      msg = "OTR: Unable to read incoming message!";
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_MALFORMED:
+      msg = "OTR: Malformed incoming message!";
+      break;
+    case OTRL_MSGEVENT_LOG_HEARTBEAT_RCVD:
+      scr_log_print(LPRINT_DEBUG, "OTR: Received heartbeat.");
+      break;
+    case OTRL_MSGEVENT_LOG_HEARTBEAT_SENT:
+      scr_log_print(LPRINT_DEBUG, "OTR: Sent heartbeat.");
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_GENERAL_ERR:
+      msg = freeme = g_strdup_printf("OTR: Received general otr error: %s",
+                                     message);
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_UNENCRYPTED:
+      msg = freeme = g_strdup_printf("OTR: Received unencrypted message: %s",
+                                     message);
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_UNRECOGNIZED:
+      msg = "OTR: Unable to determine type of received OTR message!";
+      break;
+    case OTRL_MSGEVENT_RCVDMSG_FOR_OTHER_INSTANCE:
+      // XXX
+      scr_log_print(LPRINT_DEBUG, "OTR: Received message for other instance.");
+      break;
+    default:
+      break;
+  }
+
+  if (msg) {
+    scr_WriteIncomingMessage(context->username, msg, 0, HBB_PREFIX_INFO, 0);
+    g_free(freeme);
+  }
+}
+
+#endif /* HAVE_LIBOTR3 */
+
 /*
  * returns whether a otr_message was received
  * sets *otr_data to NULL, when it was an internal otr message
@@ -362,8 +554,10 @@ int otr_receive(char **otr_data, const c
 {
   int ignore_message;
   char *newmessage = NULL;
+#ifdef HAVE_LIBOTR3
   OtrlTLV *tlvs = NULL;
   OtrlTLV *tlv = NULL;
+#endif
   ConnContext *ctx;
 
   ctx = otr_get_context(buddy);
@@ -371,8 +565,8 @@ int otr_receive(char **otr_data, const c
   ignore_message = otrl_message_receiving(userstate, &ops, NULL,
                                           ctx->accountname, ctx->protocol,
                                           ctx->username, *otr_data,
-                                          &newmessage, &tlvs,NULL, NULL);
-
+#ifdef HAVE_LIBOTR3
+                                          &newmessage, &tlvs, NULL, NULL);
 
   tlv = otrl_tlv_find(tlvs, OTRL_TLV_DISCONNECTED);
   if (tlv) {
@@ -387,6 +581,9 @@ int otr_receive(char **otr_data, const c
 
   if (tlvs != NULL)
     otrl_tlv_free(tlvs);
+#else
+                                          &newmessage, NULL, NULL, NULL, NULL);
+#endif
 
   if (ignore_message)
     *otr_data = NULL;
@@ -410,13 +607,27 @@ int otr_send(char **msg, const char *bud
 
   if (ctx->msgstate == OTRL_MSGSTATE_PLAINTEXT)
     err = otrl_message_sending(userstate, &ops, NULL, ctx->accountname,
+#ifdef HAVE_LIBOTR3
                                ctx->protocol, ctx->username, *msg, NULL,
                                &newmessage, NULL, NULL);
+#else
+                               // INSTAG XXX
+                               ctx->protocol, ctx->username, OTRL_INSTAG_BEST,
+                               *msg, NULL, &newmessage, OTRL_FRAGMENT_SEND_SKIP,
+                               NULL, NULL, NULL);
+#endif
   else {
     htmlmsg = html_escape(*msg);
     err = otrl_message_sending(userstate, &ops, NULL, ctx->accountname,
+#ifdef HAVE_LIBOTR3
                                ctx->protocol, ctx->username, htmlmsg, NULL,
                                &newmessage, NULL, NULL);
+#else
+                               // INSTAG XXX
+                               ctx->protocol, ctx->username, OTRL_INSTAG_BEST,
+                               htmlmsg, NULL, &newmessage, OTRL_FRAGMENT_SEND_SKIP,
+                               NULL, NULL, NULL);
+#endif
     g_free(htmlmsg);
   }
 
@@ -648,6 +859,59 @@ static void cb_inject_message(void *opda
                   LM_MESSAGE_SUB_TYPE_NOT_SET, NULL);
 }
 
+/* When the list of ConnContexts changes (including a change in
+ * state), this is called so the UI can be updated. */
+static void cb_update_context_list(void *opdata)
+{
+  /*maybe introduce new status characters for mcabber,
+   * then use this function (?!)*/
+}
+
+/* A new fingerprint for the given user has been received. */
+static void cb_new_fingerprint(void *opdata, OtrlUserState us,
+                               const char *accountname, const char *protocol,
+                               const char *username,
+                               unsigned char fingerprint[20])
+{
+  char *sbuf = NULL;
+  char readable[45];
+
+  otrl_privkey_hash_to_human(readable, fingerprint);
+  sbuf = g_strdup_printf("OTR: new fingerprint: %s", readable);
+  scr_WriteIncomingMessage(username, sbuf, 0, HBB_PREFIX_INFO, 0);
+  g_free(sbuf);
+}
+
+/* The list of known fingerprints has changed.  Write them to disk. */
+static void cb_write_fingerprints(void *opdata)
+{
+  otrl_privkey_write_fingerprints(userstate, fprfile);
+}
+
+/* A ConnContext has entered a secure state. */
+static void cb_gone_secure(void *opdata, ConnContext *context)
+{
+  scr_WriteIncomingMessage(context->username, "OTR: channel established", 0,
+                           HBB_PREFIX_INFO, 0);
+}
+
+/* A ConnContext has left a secure state. */
+static void cb_gone_insecure(void *opdata, ConnContext *context)
+{
+  scr_WriteIncomingMessage(context->username, "OTR: channel closed", 0,
+                           HBB_PREFIX_INFO, 0);
+}
+
+/* We have completed an authentication, using the D-H keys we
+ * already knew.  is_reply indicates whether we initiated the AKE. */
+static void cb_still_secure(void *opdata, ConnContext *context, int is_reply)
+{
+  scr_WriteIncomingMessage(context->username, "OTR: channel reestablished", 0,
+                           HBB_PREFIX_INFO, 0);
+}
+
+#ifdef HAVE_LIBOTR3
+
 /* Display a notification message for a particular
  * accountname / protocol / username conversation. */
 static void cb_notify(void *opdata, OtrlNotifyLevel level,
@@ -684,14 +948,6 @@ static int cb_display_otr_message(void *
   return 0;
 }
 
-/* When the list of ConnContexts changes (including a change in
- * state), this is called so the UI can be updated. */
-static void cb_update_context_list(void *opdata)
-{
-  /*maybe introduce new status characters for mcabber,
-   * then use this function (?!)*/
-}
-
 /* Return a newly allocated string containing a human-friendly name
  * for the given protocol id */
 static const char *cb_protocol_name(void *opdata, const char *protocol)
@@ -705,54 +961,40 @@ static void cb_protocol_name_free (void 
   /* We didn't allocated memory, so we don't have to free anything :p */
 }
 
-/* A new fingerprint for the given user has been received. */
-static void cb_new_fingerprint(void *opdata, OtrlUserState us,
-                               const char *accountname, const char *protocol,
-                               const char *username,
-                               unsigned char fingerprint[20])
+/* Log a message.  The passed message will end in "\n". */
+static void cb_log_message(void *opdata, const char *message)
 {
-  char *sbuf = NULL;
-  char readable[45];
-
-  otrl_privkey_hash_to_human(readable, fingerprint);
-  sbuf = g_strdup_printf("OTR: new fingerprint: %s", readable);
-  scr_WriteIncomingMessage(username, sbuf, 0, HBB_PREFIX_INFO, 0);
-  g_free(sbuf);
+  scr_LogPrint(LPRINT_DEBUG, "OTR: %s", message);
 }
 
-/* The list of known fingerprints has changed.  Write them to disk. */
-static void cb_write_fingerprints(void *opdata)
-{
-  otrl_privkey_write_fingerprints(userstate, fprfile);
-}
+#else /* HAVE_LIBOTR3 */
 
-/* A ConnContext has entered a secure state. */
-static void cb_gone_secure(void *opdata, ConnContext *context)
+/* Generate unique instance tag for account. */
+static void cb_create_instag(void *opdata, const char *accountname,
+                             const char *protocol)
 {
-  scr_WriteIncomingMessage(context->username, "OTR: channel established", 0,
-                           HBB_PREFIX_INFO, 0);
+  if (otrl_instag_generate(userstate, tagfile, accountname, protocol)) {
+    scr_LogPrint(LPRINT_LOGNORM, "OTR instance tag generation failed!");
+  }
 }
 
-/* A ConnContext has left a secure state. */
-static void cb_gone_insecure(void *opdata, ConnContext *context)
+static gboolean otr_timer_cb(gpointer userdata)
 {
-  scr_WriteIncomingMessage(context->username, "OTR: channel closed", 0,
-                           HBB_PREFIX_INFO, 0);
+  otrl_message_poll(userstate, &ops, userdata);
+  return TRUE;
 }
 
-/* We have completed an authentication, using the D-H keys we
- * already knew.  is_reply indicates whether we initiated the AKE. */
-static void cb_still_secure(void *opdata, ConnContext *context, int is_reply)
+static void cb_timer_control(void *opdata, unsigned int interval)
 {
-  scr_WriteIncomingMessage(context->username, "OTR: channel reestablished", 0,
-                           HBB_PREFIX_INFO, 0);
+  if (otr_timer_source > 0) {
+    g_source_remove(otr_timer_source);
+    otr_timer_source = 0;
+  }
+  if (interval > 0)
+    otr_timer_source = g_timeout_add_seconds(interval, otr_timer_cb, opdata);
 }
 
-/* Log a message.  The passed message will end in "\n". */
-static void cb_log_message(void *opdata, const char *message)
-{
-  scr_LogPrint(LPRINT_DEBUG, "OTR: %s", message);
-}
+#endif /* HAVE_LIBOTR3 */
 
 /* Find the maximum message size supported by this protocol. */
 static int cb_max_message_size(void *opdata, ConnContext *context)
