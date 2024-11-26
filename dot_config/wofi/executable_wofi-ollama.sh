#!/bin/bash

# Configuration
CACHE_DIR="$HOME/.cache/wofi-ollama"
mkdir -p "$CACHE_DIR"

# Get the prompt from wofi
prompt=$(wofi --dmenu --prompt "Ask Ollama" --lines 0 --cache-file /dev/null)

if [ -n "$prompt" ]; then
  # Show processing message
  echo "Thinking..." | wofi --dmenu --prompt "Ollama" --width 600 --lines 1 &
  PROCESSING_PID=$!

  # Get response from Ollama
  response=$(ollama run mistral "$prompt" 2>/dev/null)

  # Kill the processing message
  kill $PROCESSING_PID 2>/dev/null

  # Save to history
  echo "Q: $prompt" >>"$CACHE_DIR/history.txt"
  echo "A: $response" >>"$CACHE_DIR/history.txt"
  echo "---" >>"$CACHE_DIR/history.txt"

  # Format response for display
  formatted_response="Question: $prompt\n\n$response\n\n(Press Escape to close)"

  # Show response in wofi
  echo -e "$formatted_response" | wofi --dmenu --prompt "Ollama Response" \
    --width 800 \
    --height 600 \
    --lines 20 \
    --cache-file /dev/null \
    --insensitive \
    --conf <(echo "key_forward=Right") \
    --conf <(echo "key_backward=Left") \
    --conf <(echo "line_wrap=word") \
    --conf <(echo "allow_markup=true")
fi
