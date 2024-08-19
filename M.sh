#!/system/bin/sh
[ ! "$MODDIR" ] && MODDIR=${0%/*}
MODPATH="/data/adb/modules/priority"
[[ ! -e ${MODDIR}/ll/log ]] && mkdir -p ${MODDIR}/ll/log
screen_status=$(dumpsys window | grep "mScreenOn" | grep true)
while true;do if [[ "$screen_status" ]]; then for a in $(dumpsys activity|grep mResumed|cut -f8 -d ' '|cut -f1 -d/);do am send-trim-memory $a RUNNING_CRITICAL;chrt -r -p 99 $(pidof $a);done; >/dev/null 2>&1 &
fi	