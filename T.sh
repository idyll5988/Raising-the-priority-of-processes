#!/system/bin/sh
[ ! "$MODDIR" ] && MODDIR=${0%/*}
MODPATH="/data/adb/modules/priority"
[[ ! -e ${MODDIR}/ll/log ]] && mkdir -p ${MODDIR}/ll/log
while true; do
    screen_status=$(dumpsys window | grep "mScreenOn" | grep "true")
    if [[ "${screen_status}" ]]; then
        visible_apps=$(dumpsys activity | grep "visible=true" | grep "* Task" | sed "s/.*A=[^:]*:$$[^ ]*$$.*/\1/" | grep -v "systemui" | grep -v "launcher" | sort | uniq)

        for a in $visible_apps; do
            am send-trim-memory $a RUNNING_CRITICAL
            pid=$(pidof $a)
            if [[ ! -z "$pid" ]]; then
                chrt -r -p 99 $pid
            fi
        done
        sleep 30
    else
        sleep 60
    fi
    >/dev/null 2>&1
done
