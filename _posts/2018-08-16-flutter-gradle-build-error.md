---
id: 973
title: 'flutter 踩坑: gradle build 报错'
date: 2018-08-16T09:29:32+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=973
permalink: /archives/973
categories:
  - 技术
tags:
  - flutter
---
当把 `Android Studio` 或者 `VS code` 配置好之后，按照[官方教程](https://flutter.io/get-started/test-drive/#androidstudio)里的写的开始run的时候，出现了以下报错:

```shell
$ Launching lib\main.dart on emulator-5554 in debug mode...
* Error running Gradle:
Exit code 1 from: E:\project\myflutter\android\gradlew.bat app:properties:


FAILURE: Build failed with an exception.



* What went wrong:

A problem occurred configuring root project 'android'.

> Could not resolve all files for configuration ':classpath'.

   > Could not download kotlin-reflect.jar (org.jetbrains.kotlin:kotlin-reflect:1.1.3-2)

      > Could not get resource 'https://jcenter.bintray.com/org/jetbrains/kotlin/kotlin-reflect/1.1.3-2/kotlin-reflect-1.1.3-2.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/org/jetbrains/kotlin/kotlin-reflect/1.1.3-2/kotlin-reflect-1.1.3-2.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.100, d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159] failed: Read timed out

   > Could not download kotlin-stdlib.jar (org.jetbrains.kotlin:kotlin-stdlib:1.1.3-2)

      > Could not get resource 'https://jcenter.bintray.com/org/jetbrains/kotlin/kotlin-stdlib/1.1.3-2/kotlin-stdlib-1.1.3-2.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/org/jetbrains/kotlin/kotlin-stdlib/1.1.3-2/kotlin-stdlib-1.1.3-2.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.100, d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159] failed: Read timed out

   > Could not download protobuf-java.jar (com.google.protobuf:protobuf-java:3.0.0)

      > Could not get resource 'https://jcenter.bintray.com/com/google/protobuf/protobuf-java/3.0.0/protobuf-java-3.0.0.jar'.

         > Could not GET 'https://jcenter.bintray.com/com/google/protobuf/protobuf-java/3.0.0/protobuf-java-3.0.0.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.100, d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159] failed: Read timed out

   > Could not download bcpkix-jdk15on.jar (org.bouncycastle:bcpkix-jdk15on:1.56)

      > Could not get resource 'https://jcenter.bintray.com/org/bouncycastle/bcpkix-jdk15on/1.56/bcpkix-jdk15on-1.56.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/org/bouncycastle/bcpkix-jdk15on/1.56/bcpkix-jdk15on-1.56.jar'.

            > Remote host closed connection during handshake

   > Could not download bcprov-jdk15on.jar (org.bouncycastle:bcprov-jdk15on:1.56)

      > Could not get resource 'https://jcenter.bintray.com/org/bouncycastle/bcprov-jdk15on/1.56/bcprov-jdk15on-1.56.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/org/bouncycastle/bcprov-jdk15on/1.56/bcprov-jdk15on-1.56.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159, d29vzk4ow07wi7.cloudfront.net/143.204.132.100] failed: Read timed out

   > Could not download fastutil.jar (it.unimi.dsi:fastutil:7.2.0)

      > Could not get resource 'https://jcenter.bintray.com/it/unimi/dsi/fastutil/7.2.0/fastutil-7.2.0.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/it/unimi/dsi/fastutil/7.2.0/fastutil-7.2.0.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.100, d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159] failed: Read timed out

   > Could not download ecj.jar (org.eclipse.jdt.core.compiler:ecj:4.6.1)

      > Could not get resource 'https://jcenter.bintray.com/org/eclipse/jdt/core/compiler/ecj/4.6.1/ecj-4.6.1.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/org/eclipse/jdt/core/compiler/ecj/4.6.1/ecj-4.6.1.jar'.

            > Remote host closed connection during handshake

   > Could not download jimfs.jar (com.google.jimfs:jimfs:1.1)

      > Could not get resource 'https://jcenter.bintray.com/com/google/jimfs/jimfs/1.1/jimfs-1.1.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/com/google/jimfs/jimfs/1.1/jimfs-1.1.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.100, d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159] failed: Read timed out

   > Could not download lombok-ast.jar (com.android.tools.external.lombok:lombok-ast:0.2.3)

      > Could not get resource 'https://jcenter.bintray.com/com/android/tools/external/lombok/lombok-ast/0.2.3/lombok-ast-0.2.3.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/com/android/tools/external/lombok/lombok-ast/0.2.3/lombok-ast-0.2.3.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159, d29vzk4ow07wi7.cloudfront.net/143.204.132.100] failed: Read timed out

   > Could not download guava.jar (com.google.guava:guava:22.0)

      > Could not get resource 'https://jcenter.bintray.com/com/google/guava/guava/22.0/guava-22.0.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/com/google/guava/guava/22.0/guava-22.0.jar'.

            > Connect to d29vzk4ow07wi7.cloudfront.net:443 [d29vzk4ow07wi7.cloudfront.net/143.204.132.57, d29vzk4ow07wi7.cloudfront.net/143.204.132.53, d29vzk4ow07wi7.cloudfront.net/143.204.132.159, d29vzk4ow07wi7.cloudfront.net/143.204.132.100] failed: Read timed out

   > Could not download antlr4.jar (org.antlr:antlr4:4.5.3)

      > Failed to download SHA1 for resource 'https://jcenter.bintray.com/org/antlr/antlr4/4.5.3/antlr4-4.5.3.jar'.

         > Could not GET 'https://jcenter.bintray.com/org/antlr/antlr4/4.5.3/antlr4-4.5.3.jar.sha1'.

            > Read timed out

   > Could not download juniversalchardet.jar (com.googlecode.juniversalchardet:juniversalchardet:1.0.3)

      > Failed to download SHA1 for resource 'https://jcenter.bintray.com/com/googlecode/juniversalchardet/juniversalchardet/1.0.3/juniversalchardet-1.0.3.jar'.

         > Could not GET 'https://jcenter.bintray.com/com/googlecode/juniversalchardet/juniversalchardet/1.0.3/juniversalchardet-1.0.3.jar.sha1'.

            > Read timed out

   > Could not download proguard-base.jar (net.sf.proguard:proguard-base:5.3.3)

      > Could not get resource 'https://jcenter.bintray.com/net/sf/proguard/proguard-base/5.3.3/proguard-base-5.3.3.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/net/sf/proguard/proguard-base/5.3.3/proguard-base-5.3.3.jar'.

            > Read timed out

   > Could not download commons-compress.jar (org.apache.commons:commons-compress:1.12)

      > Could not get resource 'https://jcenter.bintray.com/org/apache/commons/commons-compress/1.12/commons-compress-1.12.jar'.

         > Could not HEAD 'https://jcenter.bintray.com/org/apache/commons/commons-compress/1.12/commons-compress-1.12.jar'.

            > Read timed out



* Try:

Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output.



* Get more help at https://help.gradle.org



BUILD FAILED in 6m 10s
Please review your Gradle project setup in the android/ folder.
Exited (sigterm)
```

看提示就是没有下载下来么，手动访问提示中出现的地址，发现能访问。胡乱尝试了一些办法后，发现都没用。

最后解决方案是:

  1. 保持翻墙状态
  2. 不断的 `run` 以触发 `gradle initial`

这样你就发现报错每次都会减少一点，最后就跑成功了 &#x1f605;