#!/bin/bash

# 进入 Git 仓库目录
cd /Users/huili/Downloads/flutter_example || exit

# 获取远程分支的最新提交 ID
REMOTE_COMMIT=$(git ls-remote origin -h refs/heads/main | awk '{print $1}')

# 获取本地当前分支的最新提交 ID
LOCAL_COMMIT=$(git rev-parse HEAD)

# 如果远程有新提交，则执行 `git pull`
if [[ "$REMOTE_COMMIT" != "$LOCAL_COMMIT" ]]; then
    echo "检测到远程有新提交，正在拉取最新代码..."
    git pull origin main
else
    echo "代码已是最新，无需更新。"
fi

