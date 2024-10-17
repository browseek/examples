# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.2] - 2024-10-17

## [0.1.2] - 2024-10-17

### Added
- New documentation files:
  - EXAMPLES.md with code samples for each tool
  - CONTRIBUTION.md with guidelines for contributors
  - TEST.md with information on running and creating tests
- Environment and dependency management:
  - Created .env file for storing environment variables
  - Added requirements.txt files for Playwright, Puppeteer, and Selenium folders
  - Specified both Python and Node.js dependencies in requirements.txt files
- Installation and setup improvements:
  - Created install.sh and install.bat for installing project-specific dependencies
  - Developed install_system_tools.sh to install Ansible, Docker, and other system tools
  - Added Fedora support to install_system_tools.sh
  - Created installation scripts for chromedriver, geckodriver, and edgedriver for Linux
- Testing enhancements:
  - Created e2e_tests.yml for Ansible end-to-end tests
  - Developed test.sh script to run Ansible e2e tests
- Version control and deployment:
  - Created update.sh script to automate version bumping, changelog updates, and pushing changes to the server
  
### Changed
- Code improvements:
  - Replaced hardcoded "https://example.com" with TEST_URL variable in all main.js files
  - Updated main.js files to use TEST_URL from .env file
  - Added dotenv as a dependency in requirements.txt files
- Documentation updates:
  - Updated README.md with a menu linking to new markdown files
- Dependency management:
  - Specified pyppeteer version 1.0.2 in puppeteer/requirements.txt to resolve installation issues
- Driver installation enhancements:
  - Improved Edge driver installation script to use a more reliable method for obtaining the latest version

## [0.1.1] - 2024-10-17
### Added
- Created main.js files for Playwright, Puppeteer, and Selenium
- Added basic test examples in each main.js file

## [0.1.0] - 2024-10-17
### Added
- Initial project setup
- Docker configurations for Playwright, Puppeteer, and Selenium
- Basic Python examples for each tool
