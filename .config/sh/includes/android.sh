#
# android.sh
#
ANDROID_HOME=$HOME/android/sdk

if [[ -d "$ANDROID_HOME" ]]; then
  export ANDROID_HOME
  export PATH="$ANDROID_HOME/emulator:$PATH"
  export PATH="$ANDROID_HOME/tools:$PATH"
  export PATH="$ANDROID_HOME/tools/bin:$PATH"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

if [[ -d /opt/android-studio/bin ]]; then
  export PATH="/opt/android-studio/bin:$PATH"
fi
