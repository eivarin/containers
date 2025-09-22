



# 初始化测试模式标记
test_mode=0

# 解析命令行参数
if [ "$1" = "--test" ]; then
    test_mode=1
    echo "测试模式已启用：仅演示操作，不会实际执行安装或写入源列表"
fi

# 检查操作系统是否为Ubuntu 24.04
check_os_version() {
    local os_version=$(lsb_release -sc 2>/dev/null)
    if [ "$os_version" != "noble" ]; then
        echo "$1"  # 明确使用双引号包裹参数
        exit 1
    fi
}

# 写入源的函数
write_source() {
    local repo_url=$1
    local prompt=$2
    if [ $test_mode -eq 1 ]; then
        echo "测试模式：$prompt（不会实际写入源列表）"
        return  # 跳过实际写入操作
    fi
    echo "$prompt"
    echo "deb [trusted=yes] $repo_url $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/acnext.list > /dev/null
}

# 安装操作的函数
install_slicer() {
    if [ $test_mode -eq 1 ]; then
        echo "测试模式：将执行安装操作（不会实际安装"
        return  # 跳过实际安装操作
    fi
    sudo apt update
    sudo apt install -y anycubicslicernext
}

choice=2

# 定义语言配置关联数组
declare -A lang_config=(
    [1]="https://cdn-platform-slicer.anycubicloud.com/prod|接下来操作需要root权限，请输入密码...|安装完成|错误：仅支持Ubuntu 24.04系统"
    [2]="https://cdn-universe-slicer.anycubic.com/prod|Next operation requires root privileges, please enter password...|Installation complete|Error: Only Ubuntu 24.04 is supported"
)


case $choice in
  1|2)
    # 从数组中提取配置参数（用|分隔）
    IFS='|' read -r repo_url prompt complete_msg os_error <<< "${lang_config[$choice]}"
    check_os_version "$os_error"
    write_source "$repo_url" "$prompt"
    ;;
  *)
    echo "错误：无效的选择，仅支持输入1或2 / Error: Invalid selection, only 1 or 2 are supported"
    exit 1
    ;;
esac

# 统一执行安装并输出完成信息（未修改）
install_slicer
echo "$complete_msg"