# C++ 开发环境配置说明

## 环境配置信息

- **编译器**: MinGW-w64 (g++)
- **调试器**: GDB
- **C++ 标准**: C++17
- **工具链路径**: `C:\msys64\ucrt64\bin`

## 已配置的功能

### 1. 代码编辑和智能感知
- ✅ IntelliSense 代码补全
- ✅ 符号导航和定义跳转
- ✅ 代码格式化
- ✅ 实时错误检查

### 2. 编译和构建
支持多种编译方式：
- **快捷键**: `Ctrl+Shift+B` - 编译当前文件
- **命令面板**: `C++: 生成活动文件` - 编译并生成执行文件
- **Makefile**: `make` - 使用Makefile构建
- **CMake**: `cmake --build` - 使用CMake构建

### 3. 调试功能
- **快捷键**: `F5` - 启动调试
- **断点**: 点击行号设置断点
- **监视**: 查看变量值和表达式
- **调用栈**: 查看函数调用链

### 4. 任务管理
可用任务（通过`Ctrl+Shift+P`打开命令面板）：
- `C++: 生成活动文件` - 编译当前文件
- `C++: 生成所有文件` - 编译整个项目
- `C++: 运行活动文件` - 编译并运行当前文件
- `C++: 清理构建` - 删除所有编译文件

## 项目结构建议

```
project/
├── src/              # 源代码文件 (.cpp)
├── include/          # 头文件 (.h, .hpp)
├── build/            # 编译输出目录（自动生成）
├── bin/              # 可执行文件目录（自动生成）
├── .vscode/          # VS Code 配置
│   ├── settings.json
│   ├── launch.json
│   ├── tasks.json
│   └── c_cpp_properties.json
├── Makefile          # Make 构建脚本
├── CMakeLists.txt    # CMake 构建配置
└── README.md         # 项目说明
```

## 常用快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+Shift+B` | 编译当前文件 |
| `F5` | 开始调试 |
| `Ctrl+F5` | 运行（不调试） |
| `Ctrl+K Ctrl+R` | 打开文件夹 |
| `F12` | 转到定义 |
| `Ctrl+Shift+O` | 转到符号 |
| `Ctrl+Shift+P` | 命令面板 |

## 编译选项说明

- `-g`: 生成调试信息
- `-Wall`: 显示所有警告
- `-Wextra`: 显示额外警告
- `-std=c++17`: 使用C++17标准

## 安装必要的扩展

推荐安装以下VS Code扩展：
1. **C/C++ (ms-vscode.cpptools)** - 必需
2. **C++ Intellisense (austin.code-gnu-global)** - 可选
3. **Better Comments (aaron-bond.better-comments)** - 可选
4. **Clang-Format (xaver.clang-format)** - 可选

## 故障排除

### 1. 编译器不被识别
确保 `C:\msys64\ucrt64\bin\g++.exe` 存在并可访问。

### 2. IntelliSense 不工作
- 重新加载 VS Code 窗口 (`Ctrl+Shift+P` -> Reload Window)
- 检查 `c_cpp_properties.json` 中的路径配置

### 3. 调试时找不到符号
确保编译时使用了 `-g` 标志以生成调试信息。

### 4. GDB 找不到
确保 `C:\msys64\ucrt64\bin\gdb.exe` 存在。

## 测试配置

创建一个简单的测试文件来验证配置：

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> numbers = {5, 2, 8, 1, 9};
    std::sort(numbers.begin(), numbers.end());
    
    for(int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    return 0;
}
```

编译运行：`Ctrl+Shift+B` 然后 `Ctrl+F5`

预期输出：`1 2 5 8 9`
