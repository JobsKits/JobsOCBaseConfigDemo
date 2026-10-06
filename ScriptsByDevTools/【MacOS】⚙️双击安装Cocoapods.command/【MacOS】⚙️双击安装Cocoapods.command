#!/usr/bin/env zsh
# 脚本自述：
# - 脚本名称：【MacOS】⚙️双击安装Cocoapods.command
# - 核心用途：双击安装Cocoapods。
# - 影响范围：本机开发工具或用户环境配置；脚本所在工程或指定目标中的文件。
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
  printf '%s\n' '【MacOS】⚙️双击安装Cocoapods.command' | jobs_intro_style title
  printf '%s\n' '1、核心用途：双击安装Cocoapods。' | jobs_intro_style body
  printf '%s\n' '2、影响范围：本机开发工具或用户环境配置；脚本所在工程或指定目标中的文件。' | jobs_intro_style body
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

# ================================== Jobs CocoaPods Installer ==================================
# - macOS 双击运行（.command）友好
# - 自动安装/注入 Homebrew 环境
# - fzf：无则安装，有则可选升级（回车跳过，输入任意字符升级）
# - Ruby：默认使用 Homebrew Ruby，避免系统 Ruby 权限/版本问题
# - CocoaPods：默认用 Homebrew 安装（最稳），失败再 fallback 到 gem（配合 brew ruby）
# - 全流程日志：/tmp/${SCRIPT_BASENAME}.log
# ==============================================================================================

set -e

# ================================== 全局变量 ==================================
START_TIME=$(date +%s)
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

# ================================== 日志与彩色输出 ==================================
log() { echo -e "$1" | tee -a "$LOG_FILE"; }

# 你原脚本里用到了 _color_echo，这里补齐，并且写入 LOG_FILE
_color_echo() {
  local color="$1"; shift
  local text="$*"

  case "$color" in
    red)        log "\033[31m${text}\033[0m" ;;
    green)      log "\033[32m${text}\033[0m" ;;
    yellow)     log "\033[33m${text}\033[0m" ;;
    blue)       log "\033[34m${text}\033[0m" ;;
    purple)     log "\033[35m${text}\033[0m" ;;
    cyan)       log "\033[36m${text}\033[0m" ;;
    white)      log "\033[37m${text}\033[0m" ;;
    gray)       log "\033[90m${text}\033[0m" ;;

    bold)       log "\033[1m${text}\033[0m" ;;
    underline)  log "\033[4m${text}\033[0m" ;;

    success)    log "\033[1;32m✔ ${text}\033[0m" ;;
    error)      log "\033[1;31m✖ ${text}\033[0m" ;;
    info)       log "\033[1;34mℹ ${text}\033[0m" ;;
    warning)    log "\033[1;33m⚠ ${text}\033[0m" ;;
    note)       log "\033[1;35m➤ ${text}\033[0m" ;;

    *)          log "${text}" ;;
  esac
}

info_echo()      { _color_echo info "$1"; }
success_echo()   { _color_echo success "$1"; }
warn_echo()      { _color_echo warning "$1"; }
note_echo()      { _color_echo note "$1"; }
error_echo()     { _color_echo error "$1"; }
gray_echo()      { _color_echo gray "$1"; }
bold_echo()      { _color_echo bold "$1"; }

# ================================== UI / 工具函数 ==================================
print_logo() {
  _color_echo cyan "======================="
  _color_echo cyan "     Jobs Installer    "
  _color_echo cyan "======================="
  gray_echo "日志：$LOG_FILE"
}

print_duration() {
  local end_time=$(date +%s)
  local duration=$((end_time - START_TIME))
  info_echo "⚙️ 脚本总耗时：${duration}s"
}

pause_to_exit() {
  echo ""
  note_echo "✅ 脚本结束。按回车退出..."
  IFS= read -r _
}

get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

confirm_upgrade() {
  # 回车：跳过；输入任意字符：执行升级（按你的要求）
  local what="$1"
  info_echo "🔄 检测到 ${what} 已安装。"
  echo "👉 回车：跳过升级"
  echo "👉 输入任意字符后回车：执行升级"
  local confirm
  IFS= read -r confirm
  [[ -n "$confirm" ]]
}

ensure_command() {
  local cmd="$1"
  local hint="$2"
  if ! command -v "$cmd" &>/dev/null; then
    error_echo "❌ 缺少命令：$cmd"
    [[ -n "$hint" ]] && note_echo "$hint"
    return 1
  fi
}

# ================================== Xcode Command Line Tools ==================================
ensure_clt() {
  if xcode-select -p &>/dev/null; then
    success_echo "✅ Xcode Command Line Tools 已安装"
    return 0
  fi

  warn_echo "⚠️ 未检测到 Xcode Command Line Tools（Homebrew 需要它）"
  note_echo "将尝试触发安装：会弹出系统安装窗口，按提示完成后重新运行脚本。"
  xcode-select --install || true

  pause_to_exit
  exit 1
}

# ================================== Homebrew ==================================
detect_brew_bin() {
  if command -v brew &>/dev/null; then
    command -v brew
    return 0
  fi

  # Finder 双击运行时经常 PATH 不完整：这里兜底
  if [[ -x /opt/homebrew/bin/brew ]]; then
    echo /opt/homebrew/bin/brew
    return 0
  fi

  if [[ -x /usr/local/bin/brew ]]; then
    echo /usr/local/bin/brew
    return 0
  fi

  return 1
}

apply_brew_shellenv() {
  local brew_bin="$1"
  eval "$("$brew_bin" shellenv)"
}

install_homebrew() {
  ensure_clt

  local arch="$(get_cpu_arch)"
  local brew_bin=""

  if brew_bin="$(detect_brew_bin)"; then
    apply_brew_shellenv "$brew_bin"
    success_echo "✅ Homebrew 已可用：$(brew --version | head -n 1)"
    return 0
  fi

  warn_echo "🧩 未检测到 Homebrew，准备安装（$arch）..."
  ensure_command curl "请先确保系统可访问网络，并允许 Terminal 使用网络。"

  if [[ "$arch" == "arm64" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
      error_echo "❌ Homebrew 安装失败（arm64）"
      pause_to_exit
      exit 1
    }
    brew_bin="/opt/homebrew/bin/brew"
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
      error_echo "❌ Homebrew 安装失败（x86_64）"
      pause_to_exit
      exit 1
    }
    brew_bin="/usr/local/bin/brew"
  fi

  apply_brew_shellenv "$brew_bin"
  success_echo "✅ Homebrew 安装成功：$(brew --version | head -n 1)"

  # 写入 shell profile，保证下次也能用（zsh 默认）
  local shell_path="${SHELL##*/}"
  local profile_file=""
  case "$shell_path" in
    zsh)  profile_file="$HOME/.zprofile" ;;
    bash) profile_file="$HOME/.bash_profile" ;;
    *)    profile_file="$HOME/.profile" ;;
  esac

  local shellenv_cmd='eval "$(brew shellenv)"'
  if ! grep -qF "$shellenv_cmd" "$profile_file" 2>/dev/null; then
    echo "$shellenv_cmd" >> "$profile_file"
    success_echo "📝 已写入 brew shellenv 到：$profile_file"
  else
    gray_echo "🔁 brew shellenv 已存在：$profile_file"
  fi
}

# ================================== fzf（自检/安装/升级） ==================================
install_fzf() {
  ensure_command brew "Homebrew 不可用，无法安装 fzf。"

  if ! command -v fzf &>/dev/null; then
    note_echo "📦 未检测到 fzf，正在通过 Homebrew 安装..."
    brew install fzf || { error_echo "❌ fzf 安装失败"; pause_to_exit; exit 1; }
    success_echo "✅ fzf 安装成功：$(fzf --version 2>/dev/null || echo 'unknown')"
    return 0
  fi

  # 已安装：是否升级（回车跳过，任意字符升级）
  if confirm_upgrade "fzf"; then
    info_echo "⏳ 正在升级 fzf..."
    brew upgrade fzf || { error_echo "❌ fzf 升级失败"; return 1; }
    brew cleanup || { warn_echo "⚠️ brew cleanup 执行时有警告"; }
    success_echo "✅ fzf 已升级到最新版本：$(fzf --version 2>/dev/null || echo 'unknown')"
  else
    note_echo "⏭️ 已选择跳过 fzf 升级"
  fi
}

# ================================== Ruby（优先 Homebrew Ruby） ==================================
ensure_brew_ruby() {
  ensure_command brew "Homebrew 不可用，无法安装 Ruby。"

  if brew list --formula ruby &>/dev/null; then
    success_echo "✅ Homebrew Ruby 已安装"
  else
    note_echo "💎 未检测到 Homebrew Ruby，正在安装..."
    brew install ruby || { error_echo "❌ Ruby 安装失败"; pause_to_exit; exit 1; }
    success_echo "✅ Ruby 安装成功"
  fi

  # 当前会话注入 PATH，确保 ruby/gem 指向 brew ruby
  local ruby_prefix
  ruby_prefix="$(brew --prefix ruby 2>/dev/null || true)"
  if [[ -n "$ruby_prefix" && -d "$ruby_prefix/bin" ]]; then
    export PATH="$ruby_prefix/bin:$PATH"
  fi

  info_echo "Ruby: $(ruby -v 2>/dev/null || echo 'not found')"
  info_echo "Gem : $(gem -v 2>/dev/null || echo 'not found')"
}

# ================================== RubyGems 源（可选） ==================================
is_in_china() {
  ensure_command curl "无法访问网络，跳过根据 IP 判断。" || return 1

  local json
  json=$(curl -s --max-time 3 https://ipinfo.io || true)
  [[ -z "$json" ]] && return 1

  if command -v jq &>/dev/null; then
    local country
    country=$(echo "$json" | jq -r '.country' 2>/dev/null || true)
    [[ "$country" == "CN" ]] && return 0 || return 1
  fi

  # 无 jq：用简单 grep 兜底
  echo "$json" | grep -q '"country"[[:space:]]*:[[:space:]]*"CN"'
}

set_gem_source() {
  command -v gem &>/dev/null || { warn_echo "⚠️ gem 不可用，跳过 RubyGems 源设置"; return 0; }

  if is_in_china; then
    gem sources --remove https://rubygems.org/ 2>/dev/null || true
    gem sources --add https://gems.ruby-china.com/ 2>/dev/null || true
    note_echo "🇨🇳 检测到可能在中国网络环境：已切换 RubyGems 源为 ruby-china"
  else
    gem sources --remove https://gems.ruby-china.com/ 2>/dev/null || true
    gem sources --add https://rubygems.org/ 2>/dev/null || true
    note_echo "🌐 使用官方 RubyGems 源"
  fi

  info_echo "📦 当前 RubyGems 源列表："
  gem sources -l | tee -a "$LOG_FILE" || true
}

# ================================== CocoaPods 安装 ==================================
install_cocoapods() {
  ensure_command brew "Homebrew 不可用，无法安装 CocoaPods。"

  if command -v pod &>/dev/null; then
    success_echo "✅ CocoaPods 已安装：$(pod --version 2>/dev/null || echo 'unknown')"
    return 0
  fi

  note_echo "📦 正在通过 Homebrew 安装 CocoaPods（推荐/最稳）..."
  brew install cocoapods || {
    warn_echo "⚠️ brew 安装 CocoaPods 失败，尝试改用 gem 安装（使用 Homebrew Ruby）"

    ensure_brew_ruby
    set_gem_source

    gem install cocoapods -N || { error_echo "❌ gem 安装 CocoaPods 失败"; pause_to_exit; exit 1; }
  }

  if ! command -v pod &>/dev/null; then
    # gem 安装后 PATH 可能没更新，尝试修复
    if command -v gem &>/dev/null; then
      local gem_bin
      gem_bin=$(ruby -e 'puts Gem.user_dir' 2>/dev/null)/bin
      [[ -d "$gem_bin" ]] && export PATH="$gem_bin:$PATH"
    fi
  fi

  command -v pod &>/dev/null || { error_echo "❌ CocoaPods 安装后仍未找到 pod 命令"; pause_to_exit; exit 1; }

  success_echo "✅ CocoaPods 安装完成：$(pod --version 2>/dev/null || echo 'unknown')"

  # CocoaPods 现在默认走 CDN，通常不需要 pod setup；这里做首次初始化兜底
  if [[ ! -d "$HOME/.cocoapods" ]]; then
    note_echo "🔧 首次初始化 CocoaPods（可选）：pod setup"
    pod setup || warn_echo "⚠️ pod setup 执行失败（通常不影响使用）"
  else
    gray_echo "ℹ 已存在 ~/.cocoapods，跳过 pod setup"
  fi
}

# ================================== 备份配置文件（可选） ==================================
backup_configs() {
  local files=("$HOME/.zshrc" "$HOME/.zprofile" "$HOME/.bash_profile" "$HOME/.profile")
  for f in "${files[@]}"; do
    [[ -f "$f" ]] || continue
    cp "$f" "$f.bak" 2>/dev/null || true
  done
  success_echo "📦 配置文件已备份（*.bak，如存在）"
}

# ================================== 主流程 ==================================
main() {
  : > "$LOG_FILE" 2>/dev/null || true

  print_logo
  backup_configs

  install_homebrew

  # 你的旧脚本里依赖过 fzf（菜单），所以这里先保证它可用
  install_fzf

  # 解决“新系统 ruby 环境安装失败/系统 ruby 权限问题”
  ensure_brew_ruby

  install_cocoapods

  print_duration
  success_echo "🎉 所有步骤已完成，日志保存在：$LOG_FILE"
}

trap 'error_echo "❌ 脚本中途失败，详见日志：$LOG_FILE"; pause_to_exit' ERR

main "$@"
pause_to_exit
}
# 编排自述确认与原有业务。
main() {
  show_script_intro_and_wait # 展示用途与影响，并等待回车确认。
  jobs_run_original_script "$@" # 继续执行原有脚本流程。
}
main "$@"
