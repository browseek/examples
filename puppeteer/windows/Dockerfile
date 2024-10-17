# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Chocolatey
RUN powershell -Command `
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Node.js and Python
RUN choco install -y nodejs-lts python

# Set up working directory
WORKDIR C:\app

# Copy installation script
COPY install.bat .

# Run the installation script
RUN install.bat

# Copy your application files
COPY . .

# Install Puppeteer
RUN npm install puppeteer

# Command to run your application
CMD ["node", "main.js"]
