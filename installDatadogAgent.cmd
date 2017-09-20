set log=datadog-install.log
set api_key=%1

sc query | findstr DatadogAgent
if ERRORLEVEL 1 (
    echo "Datadog Agent service not detected" >> %log%
    echo "Starting the installation" >> %log%

    if exist ddagent.msi (
        echo "Already has the installer" >> %log%
    ) else (
        echo "Fetching the Agent Installer" >> %log%
        powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://s3.amazonaws.com/ddagent-windows-stable/ddagent-cli.msi', 'ddagent.msi')"
    )

    echo "Starting the installer" >>%log%
    msiexec.exe /qn /i ddagent.msi APIKEY=%api_key% /L+ %log%
) else (
    echo "Agent already exists, skipping install" >>%log%
)

echo "Finished Install" >>%log%
exit 0