# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Chocolatey
RUN powershell -Command `
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Python and pip
RUN choco install -y python

# Set up working directory
WORKDIR C:\app

# Copy installation script
COPY install.bat .

# Run the installation script
RUN install.bat

# Copy your application files
COPY . .

# Install Selenium
RUN pip install selenium

# Download and install ChromeDriver
RUN powershell -Command `
    $ProgressPreference = 'SilentlyContinue'; `
    Invoke-WebRequest -Uri "https://chromedriver.storage.googleapis.com/LATEST_RELEASE" -OutFile "chromedriver_version.txt"; `
    $Version = Get-Content "chromedriver_version.txt"; `
    Invoke-WebRequest -Uri "https://chromedriver.storage.googleapis.com/$Version/chromedriver_win32.zip" -OutFile "chromedriver.zip"; `
    Expand-Archive "chromedriver.zip" -DestinationPath "C:\Windows"; `
    Remove-Item "chromedriver.zip"; `
    Remove-Item "chromedriver_version.txt"

# Command to run your application
CMD ["python", "main.py"]
