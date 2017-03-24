ViperOs Project
===============

![ViperOS](http://i.imgur.com/bwSVDSV.png)

Download the Source
===================

Please read the [AOSP building instructions](http://source.android.com/source/index.html) before proceeding.

Initializing Repository
-----------------------

Initiate core trees without any device/kernel/vendor:

    $ repo init -u https://github.com/Viper0S/manifest.git -b n-mr1

Sync the repository:

    $ repo sync -c -f -j8 --force-sync --no-clone-bundle --no-tags

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
