# Raising-the-priority-of-processes

提升进程优先级来优化性能

Increase process priority to optimize performance

Raising the priority of processes

开屏运行 关屏不运行

Overall, what this script does is check all visible applications in an infinite loop and tries to optimise their performance by sending memory cleanup signals and boosting process priorities.

整体来说，这个脚本的作用是无限循环地检查所有可见的应用程序，并试图通过发送内存清理信号和提升进程优先级来优化它们的性能。

1.（M）Filters out activities that are currently in the ‘mResumed’ state, which usually means that the activity is currently running in the foreground.

1.（M）过滤出那些当前处于“mResumed”状态的活动，这通常意味着活动是当前正在前台运行的活动

2.（T）Filter out visible Activities Filter further, selecting only those activities marked as current tasks (Task) Exclude systemui, which is an interface service of the Android system and usually does not need to be adjusted

2.（T）过滤出可见的Activity 进一步过滤，只选择那些标记为当前任务（Task）的活动 排除系统界面（systemui），这是Android系统的界面服务，通常不需要调整
