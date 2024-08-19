#!/system/bin/sh
[ ! "$MODDIR" ] && MODDIR=${0%/*}
MODPATH="/data/adb/modules/priority"
[[ ! -e ${MODDIR}/ll/log ]] && mkdir -p ${MODDIR}/ll/log
screen_status=$(dumpsys window | grep "mScreenOn" | grep true)
if [[ "$screen_status" ]]; then
while true;do for a in $(dumpsys activity|grep "visible=true"|grep "* Task"|sed "s/.*A=[^:]*:\([^ ]*\).*/\1/"|grep -v systemui|sort|uniq);do am send-trim-memory $a RUNNING_CRITICAL;chrt -r -p 99 $(pidof $a);done;sleep 30;done; >/dev/null 2>&1 &
fi	