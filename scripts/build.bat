@echo off
setlocal

set ROOT=%~dp0
set CHINESE_DIR=OpenFonts.Chinese
set ENGLISH_DIR=OpenFonts
set OUTPUT_DIR=docs

echo 当前根目录: %ROOT%
cd /d "%ROOT%"

echo 正在编译中文简历...
cd /d "%CHINESE_DIR%"
if exist resume.tex (
    echo 找到 resume.tex，开始编译...
    xelatex resume.tex
    if exist resume.pdf (
        move /y resume.pdf "..\%OUTPUT_DIR%\resume-cn.pdf"
        echo 中文简历已生成: ..\%OUTPUT_DIR%\resume-cn.pdf
    ) else (
        echo 错误: 编译中文简历失败
    )
) else (
    echo 错误: 在 %CHINESE_DIR% 中找不到 resume.tex
)
cd /d "%ROOT%"

echo.
echo 正在编译英文简历...
cd /d "%ENGLISH_DIR%"
if exist resume.tex (
    echo 找到 resume.tex，开始编译...
    xelatex resume.tex
    if exist resume.pdf (
        move /y resume.pdf "..\%OUTPUT_DIR%\resume.pdf"
        echo 英文简历已生成: ..\%OUTPUT_DIR%\resume.pdf
    ) else (
        echo 错误: 编译英文简历失败
    )
) else (
    echo 错误: 在 %ENGLISH_DIR% 中找不到 resume.tex
)
cd /d "%ROOT%"

echo.
echo 编译完成！
endlocal