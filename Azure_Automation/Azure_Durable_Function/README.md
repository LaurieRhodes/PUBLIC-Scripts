# Azure Function App CI/CD Pipeline

## Overview

This repository contains the CI/CD pipeline for deploying an Azure PowerShell Core Function App. The pipeline is configured to automatically deploy the function app using GitHub Actions and Bicep for infrastructure as code.

Microsoft's Defender Vulnerability Management is a work in progress that doesn't currently allow the direct export of data from the Defender portal to Event Hubs.

This Powershell Core Durable Function project uses Microsoft's Defender APIs to retrieve the current vulnerability list for machines that have Defender installed.  Data is retrieved nightly and written to an Event Hub for ingestion into Azure Data Explorer.  

## Table of Contents

- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Configure Azure Credentials](#2-configure-azure-credentials)
  - [3. Set Up GitHub Secrets](#3-set-up-github-secrets)
  - [4. Deploy the Infrastructure](#4-deploy-the-infrastructure)
  - [5. Deploy the Function App](#5-deploy-the-function-app)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

```plaintext
Get-Defender-Vulnerabilities/
├── .github/
│ └── workflows/
│ └── ci-cd-pipeline.yml
├── infrastructure/
│ ├── main.bicep
│ ├── parameters.json
│ └── modules/
│ ├── functionApp.bicep
│ └── otherModules.bicep
├── src/
│ └── FunctionApp/
│ ├── host.json
│ ├── local.settings.json
│ ├── profile.ps1
│ ├── requirements.psd1
│ ├── run.ps1
│ ├── Get-Machines/
│ │ ├── function.json
│ │ └── run.ps1
│ ├── Get-Vulnerabilities/
│ │ ├── function.json
│ │ └── run.ps1
│ ├── HttpTriggerFunction/
│ │ ├── function.json
│ │ └── run.ps1
│ ├── modules/
│ │ ├── AZRest.psd1
│ │ └── AZRest.psm1
│ │ │── private/
│ │ │── public/
│ │ │ │── Get-AzureADToken.ps1
│ ├── OrchestratorFunction/
│ │ ├── function.json
│ │ └── run.ps1
│ ├── TimerTriggerFunction/
│ │ ├── function.json
│ │ └── run.ps1
├── tests/
│ └── testScripts.ps1
└── README.md
```

## Prerequisites

- Azure Subscription
- Defender for Endpoint Subscription
- GitHub repository with the following secrets:
  - `AZURE_SUBSCRIPTION`: Your Azure Subscription ID
  - `AZURE_CLIENT_ID`: The Client ID of your Azure AD app registration
  - `AZURE_CLIENT_SECRET`: The Client Secret of your Azure AD app registration
  - `AZURE_TENANT_ID`: Your Azure AD Tenant ID

## Setup Instructions

### 1. Clone the Repository

```sh
git clone https://https://github.com/LaurieRhodes/PUBLIC-Get-Defender-Vulnerabilities.git
cd AzureFunctionApp-CI-CD
```

### 2. Set Up GitHub Secrets

Add the following secrets to your GitHub repository.  Client must have permissions to deploy to your nominated subscription (or Resource Group):

AZURE_SUBSCRIPTION
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID

### 3. Configure Managed Identity

Assign Defender permission to the managed identity using Azure AD.

[Details can be found here](./docs/Identity.md)

### 4. Create Event Hub

Create an Event Hub with meaningful name for Defender Vulnerability data.

Assign Azure Event Hubs Data Sender Role to the previously create Managed Identity.

### 5. Customise function variables

Within the Orchestrator Function App run.ps1 file located at:

```plaintext
Get-Defender-Vulnerabilities/
├── src/
│ └── FunctionApp/
│ ├── OrchestratorFunction/
│ │ └── run.ps1
```

Modify the variables at the start of the script.

```powershell
$EventHubNameSpace = 'MyEventhub'
$EventHubName      = 'DeviceTvmSoftwareVulnerabilities'
$ClientId          = 'fea3d290a8-97a1-41fb-8ff8-97fea3d290a0'
```

- Customise the **'ClientID'** variable with your created User Defined Managed Identity Client ID.

- Customise the Event Hub Namespace Name and ID to match The Event Hub created for Defender Vulnerability Management.

### 6. Customise Bicep properties

Modify the Bicep parameters file with names for the Azure components to be deployed.

[Details can be found here](./docs/Bicep.md)

### 7. Deploy the Function App

The function app will be deployed automatically by the GitHub Actions workflow upon pushing to the main branch.

## Usage

Once deployed, the Azure Function App will automatically retrieve vulnerability data from Microsoft's Defender APIs and write the data to the specified Event Hub at 3 AM daily.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
