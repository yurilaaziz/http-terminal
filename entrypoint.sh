#/bin/sh
if [ -n "$USER" ]; then
    auth="-c $USER:$PASSWORD"
else
    auth=""
fi
if [ -n "$TASK_NAME" ]; then
    task_name=$TASK_NAME
else
    task_name="unknown"
fi
if [ -n "$NTTY" ]; then
    ntty=$NTTY
else
    ntty=1
fi
/usr/bin/ttyd $auth -m $ntty tmux new-session -A -s $task_name
