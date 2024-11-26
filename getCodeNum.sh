#! /bin/bash
set -e 

now_dir="."
if [ $# -eq 0 ];then
    now_dir="."
elif [ $# -eq 1 ];then
    now_dir=$1
elif [ $# -gt 1 ];then
    echo "useage: ./getCodeNum.sh [input_path]"
    echo "example: ./getCodeNum.sh obs"
    exit
fi
cd $now_dir

# 获取当前目录名称
filename=$(basename $(pwd))

# # 统计文件个数
# c1=$(find -name "*.c" | wc -l)
# cc1=$(find -name "*.cc" | wc -l)
# cxx1=$(find -name "*.cxx" | wc -l)
# cpp1=$(find -name "*.cpp" | wc -l)
# h1=$(find -name "*.h" | wc -l)
# hplus1=$(find -name "*.h++" | wc -l)
# hpp1=$(find -name "*.hpp" | wc -l)
# total_files=$(expr ${c1} + ${cc1} + ${cxx1} + ${cpp1} + ${h1} + ${hplus1} + ${hpp1})

# # 统计代码行数（不含空行）
# c3=$(find -name "*.c" | xargs cat | grep -v ^$ | wc -l)
# cc3=$(find -name "*.cc" | xargs cat | grep -v ^$ | wc -l)
# cxx3=$(find -name "*.cxx" | xargs cat | grep -v ^$ | wc -l)
# cpp3=$(find -name "*.cpp" | xargs cat | grep -v ^$ | wc -l)
# h3=$(find -name "*.h" | xargs cat | grep -v ^$ | wc -l)
# hplus3=$(find -name "*.h++" | xargs cat | grep -v ^$ | wc -l)
# hpp3=$(find -name "*.hpp" | xargs cat | grep -v ^$ | wc -l)
# total_lines=$(expr ${c3} + ${cc3} + ${cxx3} + ${cpp3} + ${h3} + ${hplus3} + ${hpp3})

# # 使用 Markdown 表格呈现结果
# echo "**${filename}中代码统计**"
# echo "| ${filename} | *.c | *.cc | *.cxx | *.cpp | *.h | *.h++ | *.hpp | **总和** |"
# echo "|---|---|---|---|---|---|---|---|---|"
# echo "| 数量 | ${c1} | ${cc1} | ${cxx1} | ${cpp1} | ${h1} | ${hplus1} | ${hpp1} | **${total_files}** |"
# echo "| 代码行数（不含空行） | ${c3} | ${cc3} | ${cxx3} | ${cpp3} | ${h3} | ${hplus3} | ${hpp3} | **${total_lines}** |"



# 定义一个函数来统计文件个数和行数  
function count_files_and_lines {  
    local ext=$1  
    local file_count=$(find . -name "$ext" | wc -l)  
    local line_count=$(find . -name "$ext" -exec cat {} + | grep -v ^$ | wc -l)  
    echo $file_count $line_count  
}  

# 定义文件扩展名数组  
extensions=("*.c" "*.cc" "*.cxx" "*.cpp" "*.h" "*.h++" "*.hpp" "*.md")  

# 初始化统计变量  
total_files=0  
total_lines=0  
declare -a counts  
declare -a lines  

# 统计每种类型的文件和代码行数  
for ext in "${extensions[@]}"; do  
    read count line < <(count_files_and_lines "$ext")  
    counts+=($count)  
    lines+=($line)  
    total_files=$((total_files + count))  
    total_lines=$((total_lines + line))  
done  

# 连接统计数组元素并添加分隔符 |  
exten_output=$(IFS='|'; echo "| ${extensions[*]} |")  
counts_output=$(IFS='|'; echo "| ${counts[*]} |")  
lines_output=$(IFS='|'; echo "| ${lines[*]} |")  

length=${#extensions[@]}  
echo "|---|$(printf '---|' $(seq 1 $length))"  


# 使用 Markdown 表格呈现结果  
echo "**${filename}中代码统计**"  
echo "| ${filename} ${exten_output}  **总和** |"  
echo "|---|---|---|---|---|---|---|---|---|---|"  
echo "${counts_output} **${total_files}** |"  
echo "${lines_output} **${total_lines}** |"  