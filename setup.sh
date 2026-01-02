#!/bin/bash
# Automated setup script for AudiogramDigitization

set -e

echo "Setting up AudiogramDigitization..."

# Check if Python 3 is available
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed. Please install Python 3.7 or higher."
    exit 1
fi

# Display Python version
PYTHON_VERSION=$(python3 --version)
echo "Using $PYTHON_VERSION"

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv environment

# Activate virtual environment
echo "Activating virtual environment..."
source environment/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip3 install --upgrade pip
pip3 install -r requirements.txt

echo ""
echo "✓ Setup complete!"
echo ""
echo "To use the digitizer, activate the virtual environment first:"
echo "  source environment/bin/activate"
echo ""
echo "Then run the digitizer:"
echo "  ./src/digitize_report.py -i <path_to_image> -o <output_directory>"
echo ""
