# escape=`

ARG BASE_TAG=latest

FROM sunt05/windows-buildbot-worker:${BASE_TAG}

SHELL ["powershell", "-command"]

ARG GIT_X64="https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/Git-2.18.0-64-bit.exe"
ADD ${GIT_X64} C:\Windows\Temp\Git-64-bit.exe

RUN Start-Process -FilePath "C:\Windows\Temp\Git-64-bit.exe" -ArgumentList /VERYSILENT, /NORESTART, /NOCANCEL, /SP- -NoNewWindow -PassThru -Wait; `
    Remove-Item @('C:\Windows\Temp\*', 'C:\Users\*\Appdata\Local\Temp\*') -Force -Recurse;

ARG IS_UNICODE="http://www.jrsoftware.org/download.php/is-unicode.exe"
ADD ${IS_UNICODE} C:\Windows\Temp\is-unicode.exe

RUN Start-Process -FilePath "C:\Windows\Temp\is-unicode.exe" -ArgumentList /VERYSILENT, /NORESTART, /NOCANCEL, /SP- -NoNewWindow -PassThru -Wait; `
    Remove-Item @('C:\Windows\Temp\*', 'C:\Users\*\Appdata\Local\Temp\*') -Force -Recurse;

ARG P7Z_X64="http://www.7-zip.org/a/7z1604-x64.exe"
ADD ${P7Z_X64} C:\Windows\Temp\7z1604-x64.exe

RUN Start-Process -FilePath "C:\Windows\Temp\7z1604-x64.exe" -ArgumentList /S -NoNewWindow -PassThru -Wait; `
    Remove-Item @('C:\Windows\Temp\*', 'C:\Users\*\Appdata\Local\Temp\*') -Force -Recurse;
