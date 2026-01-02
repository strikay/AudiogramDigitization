# Setup Instructions

This document provides detailed instructions on how to get the AudiogramDigitization project up and running.

## Recent Updates (January 2026)

The project has been updated to work with modern Python versions and remove the need for manual bug fixes:

- **Updated PyTorch**: Now uses PyTorch 2.2.0+ which is compatible with Python 3.7-3.12
- **No manual bug fixes needed**: The hardswish bug in old PyTorch versions has been fixed
- **Automated setup**: Added setup scripts for easy installation
- **Updated Dockerfile**: Uses Python 3.9-slim-bullseye base image

## Requirements

- Python 3.7 or higher (Python 3.9-3.11 recommended)
- For Docker users: Docker installed on your system

## Installation Methods

### Method 1: Quick Setup with Scripts (Recommended)

#### On Linux/macOS:
```bash
./setup.sh
```

#### On Windows:
```cmd
setup.bat
```

The setup script will:
1. Check your Python version
2. Create a virtual environment in the `environment` directory
3. Install all required dependencies
4. Display instructions for using the digitizer

### Method 2: Manual Setup

If you prefer to set up manually or the script doesn't work for your system:

1. Create a virtual environment:
   ```bash
   python3 -m venv environment
   ```

2. Activate the virtual environment:
   - **Linux/macOS**: `source environment/bin/activate`
   - **Windows**: `environment\Scripts\activate.bat`

3. Install dependencies:
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

### Method 3: Docker

1. Build the Docker image:
   ```bash
   docker build -t audiogram-digitizer .
   ```

2. Run the digitizer:
   ```bash
   docker run -v $(pwd)/data:/app/data audiogram-digitizer src/digitize_report.py -i data/inputs -o data/outputs
   ```

## Using the Digitizer

After setup, make sure the virtual environment is activated, then run:

```bash
./src/digitize_report.py -i <path_to_image_or_directory> -o <output_directory>
```

### Examples:

Digitize a single image:
```bash
./src/digitize_report.py -i sample_audiogram.png -o ./output
```

Digitize a directory of images:
```bash
./src/digitize_report.py -i ./images -o ./output
```

Use GPU acceleration (if available):
```bash
./src/digitize_report.py -i ./images -o ./output --gpu
```

## Troubleshooting

### NumPy Version Compatibility

If you see an error like "A module that was compiled using NumPy 1.x cannot be run in NumPy 2.0.2":

**Solution: The requirements.txt now pins NumPy to <2.0.0 for compatibility**

If you already installed with NumPy 2.x, reinstall dependencies:
```bash
# Activate your environment first
pip uninstall numpy -y
pip install -r requirements.txt
```

Or start fresh:
```bash
# Delete the old environment
rm -rf environment  # Linux/macOS
# or
rmdir /s environment  # Windows

# Re-run setup
./setup.sh  # or setup.bat on Windows
```

### Windows Permission Errors

If you encounter `[WinError 5] Access is denied` when running `setup.bat`, this is typically a pyenv or system permission issue:

**Solution 1: Skip pip upgrade (Recommended)**
The setup script now automatically handles this. If pip upgrade fails, it continues with the current version.

**Solution 2: Manual setup without pip upgrade**
```cmd
python -m venv environment
environment\Scripts\activate.bat
pip install -r requirements.txt
```

**Solution 3: Run as Administrator**
Right-click Command Prompt and select "Run as administrator", then run `setup.bat`

**Solution 4: Use --user flag**
If manually installing, you can use:
```cmd
pip install --user -r requirements.txt
```

### Import Errors

If you get import errors, make sure your virtual environment is activated:
- **Linux/macOS**: `source environment/bin/activate`
- **Windows**: `environment\Scripts\activate.bat`

### Python Version Issues

If you encounter compatibility issues:
1. Check your Python version: `python3 --version`
2. Make sure you're using Python 3.7 or higher
3. Python 3.9-3.11 are recommended for best compatibility

### Docker SSL Issues

If you encounter SSL certificate errors during Docker build in certain CI/CD environments, this is usually a network/proxy configuration issue. Try:
- Building on a local machine
- Checking your network proxy settings
- Using a different base image if needed

## What Changed?

### Previous Version (Before Updates)
- Required exactly Python 3.9
- Used PyTorch 1.9.0 which had a hardswish bug
- Needed manual file editing after installation
- No automated setup scripts

### Current Version (After Updates)
- Works with Python 3.7-3.12
- Uses PyTorch 2.2.0+ without bugs
- No manual fixes required
- Automated setup scripts included
- Better Dockerfile with modern base image

## Additional Resources

- **Main README**: See README.md for detailed usage instructions
- **YOLOv5 Documentation**: See src/digitizer/yolov5/README.md
- **Demo**: https://huggingface.co/spaces/weiren119/AudiogramDigitization
