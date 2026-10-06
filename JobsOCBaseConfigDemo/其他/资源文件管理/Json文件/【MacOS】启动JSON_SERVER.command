#!/bin/sh
# 脚本自述：
# - 脚本名称：【MacOS】启动JSON_SERVER.command
# - 核心用途：启动JSON_SERVER。
# - 影响范围：本机开发工具或用户环境配置；本机应用、模拟器或终端窗口。
# - 运行提示：先阅读自述并按回车确认，按 Ctrl+C 取消。
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
  printf '%s\n' '【MacOS】启动JSON_SERVER.command' | jobs_intro_style title
  printf '%s\n' '1、核心用途：启动JSON_SERVER。' | jobs_intro_style body
  printf '%s\n' '2、影响范围：本机开发工具或用户环境配置；本机应用、模拟器或终端窗口。' | jobs_intro_style body
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

# json-server 主要用于模拟 REST API，它期望处理的是对象数组而不是字符串数组
# 因此，如果你提供的是字符串数组，它会尝试将这些字符串转换为对象，并添加 id 属性，这就导致了错误
# 为了使 json-server 正常工作，你需要将字符串数组转换为对象数组。每个对象至少应该有一个唯一的属性
# 如果确实需要处理字符串数组，可以考虑将这些字符串包装在对象中

# 不能被json-server正确读取的json格式
#{
#  "data": ["a1", "a2", "a3"]
#}

# 可以被json-server正确读取的json格式
#{
#  "data": [
#    {"id": "a1"},
#    {"id": "a2"},
#    {"id": "a3"}
#  ]
#}

# 统一的输出打印函数
print_message() {
    message=$1
    echo "\033[31m$message\033[0m"  # 红色输出
}

# 获取当前脚本文件的目录
get_current_directory() {
    current_directory=$(dirname "$(readlink -f "$0")")
    print_message "当前路径为: $current_directory"
    cd "$current_directory"
}

# 检查并安装/更新 Homebrew
check_and_update_brew() {
    if ! command -v brew &> /dev/null
    then
        print_message "Homebrew没有安装，正在安装到最新版本"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        print_message "Homebrew 已被安装，正在检查更新..."
        brew update
        # 有更新才更新
        outdated_packages=$(brew outdated)
        if [ -n "$outdated_packages" ]; then
            print_message "升级 Homebrew packages..."
            brew upgrade
        else
            print_message "Homebrew packages 已经全部升级到最新版本"
        fi
    fi
}

# 检查并安装/更新 npm
install_npm_homebrew() {
    print_message "正在通过 Homebrew 安装 npm..."
    brew install npm
}

install_npm_official() {
    print_message "正在打开 npm 官网以进行安装..."
    open https://nodejs.org/en/
}

check_and_install_npm() {
    while ! command -v npm &> /dev/null
    do
        print_message "npm 没有找到，请选择安装方式："
        echo "1. 通过 Homebrew 安装"
        echo "2. 通过官网安装（将打开浏览器）"
        read -p "选择 (1 或 2): " choice

        case $choice in
            1)
                install_npm_homebrew
                ;;
            2)
                install_npm_official
                ;;
            *)
                print_message "无效选择，请重新选择。"
                ;;
        esac

        if command -v npm &> /dev/null; then
            print_message "npm 安装成功。"
            break
        else
            print_message "npm 尚未安装，请再次选择安装方式。"
        fi
    done
}

# 检查并安装/更新 json-server
check_and_update_json_server() {
    if ! npm list -g json-server &> /dev/null
    then
        print_message "json-server 没找到，正在安装到最新版本..."
        npm install -g json-server
    else
        latest_version=$(npm show json-server version)
        current_version=$(npm list -g json-server --depth=0 | grep json-server | awk -F@ '{print $2}')
        if [ "$latest_version" != "$current_version" ]; then
            print_message "正在更新 json-server 版本，从 $current_version 到 $latest_version"
            npm install -g json-server@latest
        else
            print_message "json-server 已经成功升级"
        fi
    fi
}

# 检查并安装/更新 fzf
check_and_update_fzf() {
    if ! command -v fzf &> /dev/null
    then
        print_message "fzf没有安装，正在安装到最新版本"
        brew install fzf
    else
        print_message "fzf 已被安装，正在检查更新..."
        brew update fzf
        # 有更新才更新
        outdated_packages=$(brew outdated fzf)
        if [ -n "$outdated_packages" ]; then
            print_message "升级 fzf..."
            brew upgrade fzf
        else
            print_message "fzf 已经是最新版本"
        fi
    fi
}

# 列出当前目录下的所有后缀名为 json 的文件，并让用户选择
select_json_file() {
    json_files=($(ls *.json 2> /dev/null))
    if [ ${#json_files[@]} -eq 0 ]; then
        print_message "在此文件夹里面，并没有找到后缀名为json的文件."
        exit 1
    fi

    selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 10 --reverse --border)
    if [ -n "$selected_file" ]; then
        print_message "您的选择是: $selected_file"
        json-server --watch "$selected_file"
    else
        print_message "未选择任何文件"
    fi
}

# 主函数，调用其他函数
main() {
    get_current_directory

    # 提示用户是否进行更新流程
    read -r -p "是否进行更新流程？按任意键继续，按回车键跳过: " response
    if [ -n "$response" ];then
        check_and_update_brew
        check_and_install_npm
        check_and_update_json_server
        check_and_update_fzf
    else
        print_message "跳过更新流程"
    fi

    select_json_file
    print_message "关闭这个窗口，服务器结束"
    open http://localhost:3000/
}

# 调用主函数
main
}
# 编排自述确认与原有业务。
main() {
  show_script_intro_and_wait # 展示用途与影响，并等待回车确认。
  jobs_run_original_script "$@" # 继续执行原有脚本流程。
}
main "$@"
