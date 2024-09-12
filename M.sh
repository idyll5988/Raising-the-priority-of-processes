#!/system/bin/sh
[ ! "$MODDIR" ] && MODDIR=${0%/*}
MODPATH="/data/adb/modules/priority"
[[ ! -e ${MODDIR}/ll/log ]] && mkdir -p ${MODDIR}/ll/log
while true; do
    screen_status=$(dumpsys window | grep "mScreenOn" | grep "true")
    if [[ "${screen_status}" ]]; then
        for a in $(dumpsys activity | grep "mResumedActivity" | cut -f8 -d ' ' | cut -f1 -d/); do
            am send-trim-memory $a RUNNING_CRITICAL
            pid=$(pidof $a)
            if [[ ! -z "$pid" ]]; then
                chrt -r -p 99 $pid
            fi
        done >/dev/null 2>&1
    fi
    sleep 30
done