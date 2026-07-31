#!/bin/bash
# Opens Flower Bloom in your default browser.
# Keep this file in the SAME folder as flower-bloom.html.
# First time only: right-click this file -> Open (macOS may block unsigned scripts otherwise).

cd "$(dirname "$0")"
open "flower-bloom.html" 2>/dev/null || xdg-open "flower-bloom.html" 2>/dev/null
