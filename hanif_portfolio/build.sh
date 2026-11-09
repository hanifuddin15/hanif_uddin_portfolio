#!/bin/bash
set -e

echo "============================================="
echo "   Building Hanif Uddin Portfolio for Web    "
echo "============================================="

# Ensure Flutter SDK exists
if command -v flutter >/dev/null 2>&1; then
  echo "✓ Flutter found in PATH: $(which flutter)"
elif [ -d "$HOME/flutter/bin" ]; then
  echo "✓ Flutter found in $HOME/flutter/bin"
  export PATH="$HOME/flutter/bin:$PATH"
else
  echo "→ Flutter not found. Cloning Flutter stable SDK..."
  git clone --depth 1 --branch stable https://github.com/flutter/flutter.git "$HOME/flutter"
  export PATH="$HOME/flutter/bin:$PATH"
fi

echo "Flutter version:"
flutter --version

# Navigate to Flutter app folder if run from repository root
if [ -d "hanif_portfolio" ]; then
  cd hanif_portfolio
fi

echo "Installing Flutter dependencies..."
flutter pub get

echo "Building Flutter Web release..."
flutter build web --release --base-href "/"

echo "============================================="
echo "✓ Flutter Web Build Completed Successfully!"
echo "============================================="

