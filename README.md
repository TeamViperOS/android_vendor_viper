[Welcome to ViperOS]
====================================

![ViperOS](http://i.imgur.com/bwSVDSV.png)

Download the Source
===================

Please read the [AOSP building instructions](http://source.android.com/source/index.html) before proceeding.

Initializing Repository
-----------------------

Initiate core trees without any device/kernel/vendor:

    $ repo init -u https://github.com/Viper0S/android_manifest.git -b n7.1

Sync the repository:

    $ repo sync --force-sync

***

Building
--------

After the sync is finished, please read the [instructions from the Android site](http://s.android.com/source/building.html) on how to build.

    . build/envsetup.sh
    lunch

You can also build for specific devices (eg. hammerhead) like this:

    . build/envsetup.sh
    lunch viper_hammerhead-userdebug
    mka poison

Remember to `make clobber && make clean` every now and then!