$NetBSD: patch-media_webrtc_trunk_webrtc_modules_audio__device_audio__device.gypi,v 1.1 2013/05/23 13:12:13 ryoon Exp $

--- media/webrtc/trunk/webrtc/modules/audio_device/audio_device.gypi.orig	2013-05-11 19:19:45.000000000 +0000
+++ media/webrtc/trunk/webrtc/modules/audio_device/audio_device.gypi
@@ -45,11 +45,15 @@
         'dummy/audio_device_utility_dummy.h',
       ],
       'conditions': [
-        ['OS=="linux"', {
+        ['include_alsa_audio==1 or include_pulse_audio==1', {
           'include_dirs': [
             'linux',
           ],
-        }], # OS==linux
+          'defines': [
+            # avoid pointless rename
+            'WEBRTC_LINUX',
+          ],
+        }], # include_alsa_audio==1 or include_pulse_audio==1
         ['OS=="ios"', {
           'include_dirs': [
             'ios',
@@ -77,14 +81,8 @@
         }],
         ['include_internal_audio_device==1', {
           'sources': [
-            'linux/alsasymboltable_linux.cc',
-            'linux/alsasymboltable_linux.h',
-            'linux/audio_device_alsa_linux.cc',
-            'linux/audio_device_alsa_linux.h',
             'linux/audio_device_utility_linux.cc',
             'linux/audio_device_utility_linux.h',
-            'linux/audio_mixer_manager_alsa_linux.cc',
-            'linux/audio_mixer_manager_alsa_linux.h',
             'linux/latebindingsymboltable_linux.cc',
             'linux/latebindingsymboltable_linux.h',
             'ios/audio_device_ios.cc',
@@ -134,28 +132,36 @@
               ],
             }],
             ['OS=="linux"', {
-              'defines': [
-                'LINUX_ALSA',
-              ],
               'link_settings': {
                 'libraries': [
                   '-ldl',
                 ],
               },
-              'conditions': [
-                ['include_pulse_audio==1', {
-                  'defines': [
-                    'LINUX_PULSE',
-                  ],
-                  'sources': [
-                    'linux/audio_device_pulse_linux.cc',
-                    'linux/audio_device_pulse_linux.h',
-                    'linux/audio_mixer_manager_pulse_linux.cc',
-                    'linux/audio_mixer_manager_pulse_linux.h',
-                    'linux/pulseaudiosymboltable_linux.cc',
-                    'linux/pulseaudiosymboltable_linux.h',
-                  ],
-                }],
+            }],
+            ['include_alsa_audio==1', {
+              'defines': [
+                'LINUX_ALSA',
+              ],
+              'sources': [
+                'linux/alsasymboltable_linux.cc',
+                'linux/alsasymboltable_linux.h',
+                'linux/audio_device_alsa_linux.cc',
+                'linux/audio_device_alsa_linux.h',
+                'linux/audio_mixer_manager_alsa_linux.cc',
+                'linux/audio_mixer_manager_alsa_linux.h',
+              ],
+            }],
+            ['include_pulse_audio==1', {
+              'defines': [
+                'LINUX_PULSE',
+              ],
+              'sources': [
+                'linux/audio_device_pulse_linux.cc',
+                'linux/audio_device_pulse_linux.h',
+                'linux/audio_mixer_manager_pulse_linux.cc',
+                'linux/audio_mixer_manager_pulse_linux.h',
+                'linux/pulseaudiosymboltable_linux.cc',
+                'linux/pulseaudiosymboltable_linux.h',
               ],
             }],
             ['OS=="mac" or OS=="ios"', {
