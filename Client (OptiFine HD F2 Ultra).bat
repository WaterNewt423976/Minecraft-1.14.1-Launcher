@echo off

SET "DIR=%cd%"
SET "JAVA_HOME=%DIR%\runtime\jre-x64"
SET "JAVA=%JAVA_HOME%\bin\javaw.exe"
SET MAX_MEM=1G
SET LIBRARIES=versions\1.14.4\1.14.4-natives-455711844723379
SET MAIN_CLASS=net.minecraft.launchwrapper.Launch
SET CLASSPATH=libraries\optifine\OptiFine\1.14.4_HD_U_F2\OptiFine-1.14.4_HD_U_F2.jar;libraries\optifine\launchwrapper-of\2.1\launchwrapper-of-2.1.jar;libraries\oshi-project\oshi-core\1.1\oshi-core-1.1.jar;libraries\net\java\dev\jna\jna\4.4.0\jna-4.4.0.jar;libraries\net\java\dev\jna\platform\3.4.0\platform-3.4.0.jar;libraries\com\ibm\icu\icu4j-core-mojang\51.2\icu4j-core-mojang-51.2.jar;libraries\com\mojang\javabridge\1.0.22\javabridge-1.0.22.jar;libraries\net\sf\jopt-simple\jopt-simple\5.0.3\jopt-simple-5.0.3.jar;libraries\io\netty\netty-all\4.1.25.Final\netty-all-4.1.25.Final.jar;libraries\com\google\guava\guava\21.0\guava-21.0.jar;libraries\org\apache\commons\commons-lang3\3.5\commons-lang3-3.5.jar;libraries\commons-io\commons-io\2.5\commons-io-2.5.jar;libraries\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;libraries\com\mojang\brigadier\1.0.17\brigadier-1.0.17.jar;libraries\com\mojang\datafixerupper\2.0.24\datafixerupper-2.0.24.jar;libraries\com\google\code\gson\gson\2.8.0\gson-2.8.0.jar;libraries\com\mojang\authlib\1.5.25\authlib-1.5.25.jar;libraries\org\apache\commons\commons-compress\1.8.1\commons-compress-1.8.1.jar;libraries\org\apache\httpcomponents\httpclient\4.3.3\httpclient-4.3.3.jar;libraries\commons-logging\commons-logging\1.1.3\commons-logging-1.1.3.jar;libraries\org\apache\httpcomponents\httpcore\4.3.2\httpcore-4.3.2.jar;libraries\it\unimi\dsi\fastutil\8.2.1\fastutil-8.2.1.jar;libraries\org\apache\logging\log4j\log4j-api\2.8.1\log4j-api-2.8.1.jar;libraries\org\apache\logging\log4j\log4j-core\2.8.1\log4j-core-2.8.1.jar;libraries\org\lwjgl\lwjgl\3.2.2\lwjgl-3.2.2.jar;libraries\org\lwjgl\lwjgl-jemalloc\3.2.2\lwjgl-jemalloc-3.2.2.jar;libraries\org\lwjgl\lwjgl-openal\3.2.2\lwjgl-openal-3.2.2.jar;libraries\org\lwjgl\lwjgl-opengl\3.2.2\lwjgl-opengl-3.2.2.jar;libraries\org\lwjgl\lwjgl-glfw\3.2.2\lwjgl-glfw-3.2.2.jar;libraries\org\lwjgl\lwjgl-stb\3.2.2\lwjgl-stb-3.2.2.jar;libraries\com\mojang\text2speech\1.11.3\text2speech-1.11.3.jar;versions\1.14.4\1.14.4.jar
SET JAVA_OPTIONS=-Xmx%MAX_MEM% -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Djava.library.path=%LIBRARIES% -Dminecraft.launcher.brand=java-minecraft-launcher -Dminecraft.launcher.version=unknown -cp %CLASSPATH% %MAIN_CLASS%
setlocal enabledelayedexpansion

set /p NICK=<"%DIR%\nick.txt"
if "%NICK%"=="" (
  set /p NICK=Enter a nickname:
  echo.
  if "!NICK!"=="" (
    set NICK=unnamed
  )
  @echo !NICK! >"%DIR%\nick.txt"
)
set /p UUID=<"%DIR%\uuid.txt"
if "%UUID%"=="" (
  set "string=abcdef0123456789"
  set "uuid="
  for /L %%i in (1,1,32) do call :add
  @echo !uuid! >"%DIR%\uuid.txt"
  goto :continue

  :add
  set /a x=%random% %% 16 
  set uuid=%uuid%!string:~%x%,1!
  goto :eof
)
:continue

start "" /D "%DIR%" /I /HIGH "%JAVA%" %JAVA_OPTIONS% --version 1.14.4 --gameDir . --assetsDir assets --assetIndex 1.14 --accessToken 1337535510N --userType legacy --versionType release --tweakClass optifine.OptiFineTweaker --uuid %uuid% --username %NICK% 
