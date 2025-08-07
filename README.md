# Snowflake Native App Sample Project

This project demonstrates a basic Snowflake Native App setup with proper authentication and configuration.

## Prerequisites

### 1. Snowflake CLI Installation

The project uses Snowflake CLI for development and deployment. Install it via Homebrew:

```bash
brew install snowflake-cli
```

**Note**: Use Homebrew installation instead of pip to avoid conflicts and ensure proper updates.

### 2. Verify Installation

Check that Snowflake CLI is properly installed:

```bash
snow --version
```

Should display: `Snowflake CLI version: 3.10.0` (or latest version)

## Configuration Setup

### 1. Update Authentication Token

Update the `snowflake-pat.token` file with your Snowflake Programmatic Access Token (PAT):

### 2. Configure Connection Settings

Update the `config.toml` file with your Snowflake account details:

```toml
[connections.tutorial]
account = "YOUR_ACCOUNT_ID"
user = "YOUR_USERNAME"
authenticator = "PROGRAMMATIC_ACCESS_TOKEN"
token_file_path = "snowflake-pat.token"
role = "YOUR_ROLE"
warehouse = "YOUR_WAREHOUSE"
database = "YOUR_DATABASE"
schema = "YOUR_SCHEMA"
```

## Testing Connection

Test your Snowflake connection using the CLI:

```bash
# Test connection with config file
snow --config-file="config.toml" connection test -c tutorial
```

# Initialize New Native App

```bash
snow init --template app_basic na-spcs-tutorial
```