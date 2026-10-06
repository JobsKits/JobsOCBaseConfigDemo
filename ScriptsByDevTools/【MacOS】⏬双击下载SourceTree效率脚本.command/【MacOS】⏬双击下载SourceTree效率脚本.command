#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS】⏬双击下载SourceTree效率脚本.command
# - 核心用途：双击下载SourceTree效率脚本。
# - 影响范围：Git 工作区、子模块或仓库状态；脚本指定文件或缓存的删除 / 清理；脚本所在工程或指定目标中的文件；本机应用、模拟器或终端窗口。
# - 运行提示：先阅读自述并按回车确认，按 Ctrl+C 取消。
JOBS_COMMAND_ENTRY_ARG0="$0"
# 仅渲染自述：标题红色加粗，编号正文蓝色常规字重；非彩色终端输出纯文本。
jobs_intro_style() {
  local intro_color=0
  if [ -t 1 ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
     [ -z "${NO_COLOR+x}" ] && [ "${PLAIN_OUTPUT:-0}" != 1 ] &&
     [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]; then
    intro_color=1
  fi
  /usr/bin/awk -v color="$intro_color" -v role="${1:-body}" '
    BEGIN { esc = sprintf("%c", 27) }
    {
      gsub(esc "\\[[0-9;]*m", "")
      gsub(/\\(033|e|x1[bB])\[[0-9;]*m/, "")
      if (!color || $0 ~ /^[[:space:]]*$/) { print; next }
      numbered = ($0 ~ /^[[:space:]➤ℹ🔹✔⚠]*([0-9]+[、.)）]|[0-9]+️⃣|[-•])/)
      heading = ($0 ~ /^[[:space:]]*#{1,6}[[:space:]]/ || $0 ~ /[：:][[:space:]]*$/ || $0 ~ /^[[:space:]]*[=━─-]{3}/)
      title = (!numbered && (role == "title" || heading))
      if (role == "auto" && !seen && !numbered) title = 1
      if ($0 !~ /^[[:space:]]*[=━─-]+[[:space:]]*$/) seen = 1
      printf "%s%s%s\n", esc (title ? "[1;31m" : "[0;34m"), $0, esc "[0m"
    }
  '
}
# 打印固定自述，确认后才进入原有脚本流程。
show_script_intro_and_wait() {
  printf '%s\n' '【MacOS】⏬双击下载SourceTree效率脚本.command' | jobs_intro_style title
  printf '%s\n' '1、核心用途：双击下载SourceTree效率脚本。' | jobs_intro_style body
  printf '%s\n' '2、影响范围：Git 工作区、子模块或仓库状态；脚本指定文件或缓存的删除 / 清理；脚本所在工程或指定目标中的文件；本机应用、模拟器或终端窗口。' | jobs_intro_style body
  printf '%s\n' '3、运行策略：确认后执行原有流程；后续危险操作的确认保持原样。' | jobs_intro_style body
  printf '%s\n' '4、取消方式：按 Ctrl+C 终止；确认前不执行真实业务。' | jobs_intro_style body
  if [ ! -t 0 ]; then
    printf '%s\n' '当前没有可交互输入，请在终端中重新运行。' >&2
    exit 1
  fi
  printf '%s' '已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：'
  IFS= read -r jobs_intro_answer || exit 1
}
# 确认后执行原有业务，保留原来的参数、交互和退出策略。
jobs_run_original_script() {
  0="$JOBS_COMMAND_ENTRY_ARG0"

# ✅ 全局变量
REPO_URL="https://github.com/JobsKits/SourceTree.sh.git"
CLONE_DIR="$HOME/SourceTree.sh"

# ✅ 彩色输出
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }

# ✅ 下载并运行
main() {
    info_echo "📥 开始克隆 SourceTree.sh 仓库到 $CLONE_DIR..."
    rm -rf "$CLONE_DIR"  # 删除旧版本
    if ! git clone --depth=1 "$REPO_URL" "$CLONE_DIR"; then
        error_echo "❌ 克隆失败"
        exit 1
    fi

    success_echo "✔ 克隆完成：$CLONE_DIR"

    info_echo "🔑 赋予执行权限..."
    find "$CLONE_DIR" -type f \( -name "*.sh" -o -name "*.command" \) -exec chmod +x {} \;
    
    open $CLONE_DIR
}

main "$@"
}
# 编排自述确认与原有业务。
main() {
  show_script_intro_and_wait # 展示用途与影响，并等待回车确认。
  jobs_run_original_script "$@" # 继续执行原有脚本流程。
}
main "$@"
