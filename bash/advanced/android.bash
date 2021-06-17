ANDROID_HOME=$HOME/android/sdk

if [ -d "$ANDROID_HOME" ]; then
  export ANDROID_HOME
  export PATH="$PATH:$ANDROID_HOME/emulator"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/tools/bin"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
fi

if [ -d /opt/android-studio/bin ]; then
  export PATH="/opt/android-studio/bin:$PATH"
fi
