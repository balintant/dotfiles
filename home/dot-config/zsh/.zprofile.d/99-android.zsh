#!/bin/zsh

# Configure Android SDK locations and PATH
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

# Avoid Android Emulator messing with Bluetooth Audio.
export QEMU_AUDIO_DRV="none"

