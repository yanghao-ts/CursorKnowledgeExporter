#!/bin/bash

SKILL_NAME="knowledge-export"
TARGET="$HOME/.cursor/skills/$SKILL_NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR/skill"

echo "================================================"
echo " KnowledgeExporter - Skill 安装脚本 (macOS/Linux)"
echo "================================================"
echo ""

if [ ! -f "$SOURCE/SKILL.md" ]; then
    echo "[错误] 未找到 $SOURCE/SKILL.md"
    echo "       请确保在 KnowledgeExporter 目录下运行此脚本"
    exit 1
fi

if [ -f "$TARGET/SKILL.md" ]; then
    echo "[提示] 检测到已有安装：$TARGET"
    read -rp "是否覆盖？(Y/N): " OVERWRITE
    if [[ ! "$OVERWRITE" =~ ^[Yy]$ ]]; then
        echo "已取消安装。"
        exit 0
    fi
fi

echo "[1/3] 创建目录 $TARGET ..."
mkdir -p "$TARGET/references"

echo "[2/3] 复制文件 ..."
cp -f "$SOURCE/SKILL.md" "$TARGET/SKILL.md"
cp -f "$SOURCE/references/asset-checklist.md" "$TARGET/references/asset-checklist.md"

echo "[3/3] 验证安装 ..."
if [ -f "$TARGET/SKILL.md" ] && [ -f "$TARGET/references/asset-checklist.md" ]; then
    echo ""
    echo "================================================"
    echo " 安装成功！"
    echo " 位置：$TARGET"
    echo ""
    echo " 已安装文件："
    echo "   - SKILL.md"
    echo "   - references/asset-checklist.md"
    echo ""
    echo " 使用方法：在 Cursor 对话中说\"帮我导出知识资产\""
    echo "================================================"
else
    echo "[错误] 文件复制失败，请检查权限"
    exit 1
fi
