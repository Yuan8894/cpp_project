# Makefile for C++ Project
# 编译器和工具
CXX = C:\msys64\ucrt64\bin\g++.exe
CXXFLAGS = -g -Wall -Wextra -std=c++17
GDB = C:\msys64\ucrt64\bin\gdb.exe

# 目录
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# 源文件和输出文件
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
EXECUTABLE = $(BIN_DIR)/app.exe

# 默认目标
all: $(EXECUTABLE)

# 创建目录
$(BUILD_DIR) $(BIN_DIR):
	mkdir -p $@

# 编译源文件
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 链接可执行文件
$(EXECUTABLE): $(OBJECTS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@

# 运行程序
run: $(EXECUTABLE)
	$(EXECUTABLE)

# 调试程序
debug: $(EXECUTABLE)
	$(GDB) $(EXECUTABLE)

# 清理生成文件
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) *.exe

.PHONY: all run debug clean
