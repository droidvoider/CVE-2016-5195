#!/system/bin/sh

mount -o remount,rw -t auto /system
mount -o remount,rw -t auto /data
mount -t rootfs -o remount,rw rootfs

if [ ! -e /system/etc/init.d ]; then
   mkdir /system/etc/init.d
   chown -R root.root /system/etc/init.d
   chmod -R 755 /system/etc/init.d
fi

for FILE in /system/etc/init.d/*; do
   sh $FILE >/dev/null
done;

mount -t rootfs -o remount,ro rootfs
mount -o remount,rw -t auto /data
mount -o remount,ro -t auto /system