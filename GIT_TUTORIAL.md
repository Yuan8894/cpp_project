# Git 命令教程 - 本地项目推送到 GitHub

本教程记录了如何将本地 C++ 项目初始化为 Git 仓库，并推送到 GitHub 远程仓库的完整步骤。

## 前置准备

- 已安装 Git
- 已在 GitHub 上创建空仓库
- 已配置 SSH 或 HTTPS 认证

## 详细步骤

### 1. 初始化本地 Git 仓库

```bash
git init
```

**说明**：在项目根目录执行此命令，会创建 `.git` 目录，标记该文件夹为 Git 仓库。

**输出示例**：
```
Initialized empty Git repository in D:/code/c plusplus/vscode/project/.git/
```

---

### 2. 配置 Git 用户信息

```bash
git config user.name "Yuan8894"
git config user.email "your-email@example.com"
```

**说明**：设置本地仓库的用户名和邮箱，这些信息会显示在每次提交的记录中。

**说明**：
- 若要配置全局用户信息，添加 `--global` 参数：`git config --global user.name "Yuan8894"`
- 本地配置优先级高于全局配置

---

### 3. 添加所有文件到暂存区

```bash
git add .
```

**说明**：
- `.` 表示添加当前目录下的所有文件和文件夹
- 也可以添加特定文件：`git add filename`
- 查看状态：`git status`

**常用选项**：
- `git add src/` - 添加 src 文件夹内的所有文件
- `git add *.cpp` - 添加所有 .cpp 文件

---

### 4. 提交到本地仓库

```bash
git commit -m "Initial commit"
```

**说明**：
- `-m` 参数指定提交信息
- 提交信息应简洁明了，描述本次改动内容
- 提交后会显示改动统计信息

**输出示例**：
```
[master (root-commit) bec8c7e] Initial commit
 9 files changed, 375 insertions(+)
 create mode 100644 .vscode/c_cpp_properties.json
 create mode 100644 .vscode/launch.json
 create mode 100644 .vscode/settings.json
 create mode 100644 .vscode/tasks.json
 create mode 100644 CMakeLists.txt
 create mode 100644 Makefile
 create mode 100644 README.md
 create mode 100644 src/test.cpp
 create mode 100644 src/test.exe
```

**常用选项**：
- `git commit -am "message"` - 跳过 `git add` 步骤，直接提交已追踪的文件
- `git commit --amend` - 修改最近一次提交

---

### 5. 添加远程仓库

```bash
git remote add origin https://github.com/Yuan8894/cpp_project.git
```

**说明**：
- `origin` 是远程仓库的默认别名
- 将本地仓库与 GitHub 上的远程仓库关联
- 也可使用 SSH 地址：`git@github.com:Yuan8894/cpp_project.git`

**常用命令**：
- `git remote -v` - 查看所有远程仓库
- `git remote remove origin` - 移除远程仓库
- `git remote rename origin upstream` - 重命名远程仓库别名

---

### 6. 重命名分支为 main

```bash
git branch -M main
```

**说明**：
- `-M` 表示强制重命名（move）
- 将默认分支 `master` 改为 `main`（GitHub 的默认分支名）
- 确保本地分支名与远程分支名一致

**常用命令**：
- `git branch` - 查看本地分支
- `git branch -a` - 查看所有分支（包括远程）
- `git branch -d branchname` - 删除分支

---

### 7. 推送到远程仓库

```bash
git push -u origin main
```

**说明**：
- `-u` 参数表示设置上游分支（upstream），后续 `git push` 时可以省略参数
- `origin` 是远程仓库别名
- `main` 是要推送的本地分支名

**输出示例**：
```
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 12 threads
Compressing objects: 100% (13/13), done.
Writing objects: 100% (13/objects) 79.09 KiB | 6.59 MiB/s, done.
Total 13 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/Yuan8894/cpp_project.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
```

**常用选项**：
- `git push` - 推送到已设置的上游分支
- `git push origin --all` - 推送所有分支
- `git push origin --delete branchname` - 删除远程分支

---

## 完整命令速查表

```bash
# 初始化并配置
git init
git config user.name "Your Name"
git config user.email "your-email@example.com"

# 添加、提交、关联、推送
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/repo.git
git branch -M main
git push -u origin main
```

---

## 后续常用命令

### 查看日志
```bash
git log                    # 查看提交历史
git log --oneline         # 简洁格式查看
git log --graph --all     # 可视化分支
```

### 克隆仓库
```bash
git clone https://github.com/Yuan8894/cpp_project.git
```

### 更新和推送
```bash
git pull                   # 从远程拉取更新
git push                   # 推送到远程
git status                 # 查看状态
git diff                   # 查看改动
```

### 分支操作
```bash
git branch branchname      # 创建新分支
git checkout branchname    # 切换分支
git checkout -b newbranch  # 创建并切换分支
git merge branchname       # 合并分支
```

---

## 常见问题

### Q: 推送时出现身份验证错误
A: 确保已配置 SSH 秘钥或提供正确的 HTTPS 凭证。

### Q: 如何修改最后一次提交信息？
A: 使用 `git commit --amend` 修改最后一次提交。

### Q: 如何撤销本地修改？
A: 使用 `git checkout -- filename` 撤销单个文件，或 `git reset --hard HEAD` 撤销所有本地修改。

### Q: 如何删除已提交的文件？
A: 
```bash
git rm filename            # 删除文件并暂存
git commit -m "Remove file"
git push
```

---

## 参考资源

- [Git 官方文档](https://git-scm.com/doc)
- [GitHub 快速入门](https://docs.github.com/en/get-started)
- [Git 视觉化学习](https://learngitbranching.js.org/)
