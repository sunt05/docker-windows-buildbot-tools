# escape=`

ARG BASE_TAG=latest_1803

FROM mback2k/windows-buildbot-worker:${BASE_TAG}

SHELL ["powershell", "-command"]

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
    Invoke-WebRequest "https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/Git-2.18.0-64-bit.exe" -OutFile "C:\Windows\Temp\Git-64-bit.exe"; `
    Start-Process -FilePath "C:\Windows\Temp\Git-64-bit.exe" -ArgumentList /VERYSILENT, /NORESTART, /NOCANCEL, /SP- -NoNewWindow -PassThru -Wait; `
    Remove-Item @('C:\Windows\Temp\*', 'C:\Users\*\Appdata\Local\Temp\*') -Force -Recurse;

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
    Invoke-WebRequest "http://www.jrsoftware.org/download.php/is-unicode.exe" -OutFile "C:\Windows\Temp\is-unicode.exe"; `
    Start-Process -FilePath "C:\Windows\Temp\is-unicode.exe" -ArgumentList /VERYSILENT, /NORESTART, /NOCANCEL, /SP- -NoNewWindow -PassThru -Wait; `
    Remove-Item @('C:\Windows\Temp\*', 'C:\Users\*\Appdata\Local\Temp\*') -Force -Recurse;

RUN Invoke-WebRequest "http://www.7-zip.org/a/7z1604-x64.exe" -OutFile "C:\Windows\Temp\7z1604-x64.exe"; `
    Start-Process -FilePath "C:\Windows\Temp\7z1604-x64.exe" -ArgumentList /S -NoNewWindow -PassThru -Wait; `
    Remove-Item @('C:\Windows\Temp\*', 'C:\Users\*\Appdata\Local\Temp\*') -Force -Recurse;
