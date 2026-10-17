#!/bin/zsh
# 脚本自述：
# - 脚本名称：CocoaPods 网络适配诊断。
# - 核心用途：测试当前 Git 下载链路和已配置的系统代理，辅助排查受限网络。
# - 影响范围：只读网络探测与临时进程环境；不安装依赖、不修改全局代理或 Git 配置。
# - 运行提示：独立运行先展示自述并按回车确认；真正安装由 Podfile 同步调用 Ruby 适配器。

SCRIPT_DIR=''
PROJECT_ROOT=''
RUBY_BIN=''
LOG_FILE=''

# 渲染固定自述；非彩色终端保持纯文本。
intro_line() {
  local role="$1" message="$2"
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    if [[ "$role" == title ]]; then
      print -r -- $'\033[1;31m'"$message"$'\033[0m'
    else
      print -r -- $'\033[0;34m'"$message"$'\033[0m'
    fi
  else
    print -r -- "$message"
  fi
}
# 先说明只读边界，确认前不创建日志或发送网络请求。
show_script_intro_and_wait() {
  intro_line title 'CocoaPods 网络适配诊断'
  intro_line body '1、测试 AMPopTip 的真实 Git tag 查询，并尝试机器上已配置、已启用的代理。'
  intro_line body '2、只影响诊断子进程；不启动 pod install，不修改全局 Git、系统代理或依赖文件。'
  intro_line body '3、摘要写入系统临时目录的 jobs-cocoapods-network.log，不写代理地址或认证信息；按 Ctrl+C 可取消。'
  if [[ "${1:-}" == --help || "${1:-}" == -h ]]; then
    print -r -- '用法：/bin/zsh <本脚本>；实际安装仍在工程根目录执行 pod install。'
    exit 0
  fi
  if (( $# != 0 )); then
    print -u2 -r -- '不支持该参数；可使用 --help 查看说明。'
    exit 2
  fi
  [[ -t 0 ]] || { print -u2 -r -- '请在可交互终端运行本诊断。'; exit 2; }
  local answer=''
  read -r '?👉 按回车开始只读诊断，输入其它内容取消：' answer || exit 2
  [[ -z "$answer" ]] || exit 0
}
# 确认后按脚本目录定位工程，兼容中文和空格路径。
initialize_runtime() {
  setopt NO_NOMATCH
  SCRIPT_DIR="${${(%):-%x}:A:h}"
  PROJECT_ROOT="${SCRIPT_DIR:h:h}"
  LOG_FILE="${TMPDIR:-/tmp}/jobs-cocoapods-network.log"
  : > "$LOG_FILE"
  print -r -- "诊断日志：$LOG_FILE"
}
# 只检查现有 Ruby，不为诊断安装或升级工具链。
check_environment() {
  RUBY_BIN="$(command -v ruby 2>/dev/null)"
  [[ -n "$RUBY_BIN" ]] || RUBY_BIN=/usr/bin/ruby
  if [[ ! -x "$RUBY_BIN" ]] || ! "$RUBY_BIN" -e 'require "open3"; require "uri"' >/dev/null 2>&1; then
    print -u2 -r -- 'Ruby 不可用，请先检查当前 CocoaPods / Ruby 环境。'
    return 1
  fi
  [[ -f "$SCRIPT_DIR/jobs_cocoapods_network.rb" ]] || {
    print -u2 -r -- '网络适配器缺失，请复制完整脚本包。'
    return 1
  }
}
# 在独立 Ruby 进程测试路由，不将临时代理导出到调用终端。
run_diagnostic() {
  "$RUBY_BIN" - "$SCRIPT_DIR/jobs_cocoapods_network.rb" "$PROJECT_ROOT" 2>&1 <<'RUBY' | /usr/bin/tee -a "$LOG_FILE"
require ARGV.fetch(0)
result = JobsCocoaPodsNetwork.apply!(project_root: ARGV.fetch(1), probe: true)
puts '[PodNetwork] 诊断结束；探测通过不等于完整依赖已经下载。'
exit(result == :unavailable ? 1 : 0)
RUBY
  return "${pipestatus[1]}"
}
# 按先自述、后检查、再只读探测的顺序执行。
main() {
  show_script_intro_and_wait "$@" # 展示影响范围并完成终端确认。
  initialize_runtime # 确认后解析脚本与工程目录。
  check_environment || return $? # 复用现有 Ruby，缺失时停止诊断。
  run_diagnostic # 仅在子进程内测试当前网络和已配置代理。
}

main "$@"
