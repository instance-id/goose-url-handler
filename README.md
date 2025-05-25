# goose CLI URL Handler

A linux URL protocol handler for the [goose](https://github.com/block/goose) AI agent cli that enables one-click installation of extensions directly from web browsers.

## Overview

goose URL Handler registers a custom `goose://` URL protocol on Linux systems, allowing websites to provide direct installation links for goose extensions. When a user clicks a `goose://` link in their browser, this handler parses the URL parameters and automatically updates the goose configuration file with the new extension details.

## Features

- Enables one-click installation of goose extensions from websites
- Automatic parsing of extension parameters from URLs
- Adds the extension to the goose configuration file
- Backup of configuration file before modifications

## Installation

Clone the repository and run the setup script:

```bash
git clone https://github.com/instance-id/goose-url-handler.git
cd goose-url-handler
chmod +x setup.sh
./setup.sh
```

Or you can install it manually:

```bash
sudo cp ./goose-url-handler /usr/local/bin/
cp ./goose-url-handler.desktop $XDG_DATA_HOME/applications/
xdg-mime default goose-url-handler.desktop x-scheme-handler/goose
sudo update-desktop-database
```

The setup script will:
1. Copy the URL handler script to `/usr/local/bin/`
2. Register the desktop entry for the URL protocol
3. Update the MIME and desktop databases

## Requirements

- Linux desktop environment
- `xdg-utils` package
- goose AI agent installed and configured
- `notify-send` for desktop notifications

## Usage

### For end users

Simply click on `goose://` links in your browser. The handler will automatically process the URL and install the extension to your goose configuration.

### For extension developers

Create links with the following format to allow one-click installation of your extensions:

```
goose://extension?id=extension-id&name=Extension%20Name&cmd=/path/to/extension&description=Extension%20Description&arg=argument1&arg=argument2
```

Parameters:
- `id`: Unique identifier for the extension
- `name`: Human-readable name of the extension
- `cmd`: Command to execute for the extension
- `description`: Brief description of what the extension does
- `arg`: (Optional, can be repeated) Arguments to pass to the extension
- `timeout`: (Optional) Timeout in seconds, defaults to 300

## Configuration

By default, the handler assumes goose is installed at `~/.local/bin/goose`. You can set a custom path by defining the `GOOSE_PATH` environment variable.

The handler manages extensions in the goose configuration file located at `~/.config/goose/config.yaml`.

## Troubleshooting

Logs are written to `/tmp/goose-handler.log` for debugging purposes.

## License

This project is licensed under the terms of the included LICENSE file.

## Author

Created by [instance.id](https://github.com/instance-id)
