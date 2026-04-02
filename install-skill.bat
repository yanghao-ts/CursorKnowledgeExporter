@echo off
chcp 65001 >nul 2>&1
setlocal

set "SKILL_NAME=knowledge-export"
set "TARGET=%USERPROFILE%\.cursor\skills\%SKILL_NAME%"
set "SOURCE=%~dp0skill"

echo ================================================
echo  KnowledgeExporter - Skill 安装脚本 (Windows)
echo ================================================
echo.

if not exist "%SOURCE%\SKILL.md" (
    echo [错误] 未找到 %SOURCE%\SKILL.md
    echo        请确保在 KnowledgeExporter 目录下运行此脚本
    pause
    exit /b 1
)

if exist "%TARGET%\SKILL.md" (
    echo [提示] 检测到已有安装：%TARGET%
    set /p OVERWRITE="是否覆盖？(Y/N): "
    if /i not "%OVERWRITE%"=="Y" (
        echo 已取消安装。
        pause
        exit /b 0
    )
)

echo [1/3] 创建目录 %TARGET% ...
if not exist "%TARGET%\references" mkdir "%TARGET%\references"

echo [2/3] 复制文件 ...
copy /y "%SOURCE%\SKILL.md" "%TARGET%\SKILL.md" >nul
copy /y "%SOURCE%\references\asset-checklist.md" "%TARGET%\references\asset-checklist.md" >nul

echo [3/3] 验证安装 ...
if exist "%TARGET%\SKILL.md" (
    if exist "%TARGET%\references\asset-checklist.md" (
        echo.
        echo ================================================
        echo  安装成功！
        echo  位置：%TARGET%
        echo.
        echo  已安装文件：
        echo    - SKILL.md
        echo    - references\asset-checklist.md
        echo.
        echo  使用方法：在 Cursor 对话中说"帮我导出知识资产"
        echo ================================================
    ) else (
        echo [错误] asset-checklist.md 复制失败
    )
) else (
    echo [错误] SKILL.md 复制失败
)

echo.
pause
