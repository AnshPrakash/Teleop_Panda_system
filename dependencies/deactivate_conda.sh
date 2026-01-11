#!/usr/bin/env bash
# deactivate_conda.sh
# Usage: source deactivate_conda.sh [--verbose]
# This script must be sourced (not run in a subshell) to change the current shell's env.

# --- opts ---
VERBOSE=false
if [ "${1:-}" = "--verbose" ]; then VERBOSE=true; fi

log() { if [ "$VERBOSE" = "true" ]; then printf '%s\n' "$*"; fi }

# --- try to repeatedly deactivate conda if available ---
if command -v conda >/dev/null 2>&1; then
  log "conda found at: $(command -v conda)"
  # Try up to N times — stacked activations (CONDA_SHLVL) are common with nested activations
  MAX_ATTEMPTS=20
  for i in $(seq 1 "$MAX_ATTEMPTS"); do
    # If CONDA_SHLVL absent or <= 0 and there is no CONDA_PREFIX, assume no more active envs
    shlvl=${CONDA_SHLVL:-0}
    if ! printf '%s' "$shlvl" | grep -Eq '^[0-9]+$'; then shlvl=0; fi
    if [ "$shlvl" -le 0 ] && [ -z "${CONDA_PREFIX:-}" ]; then
      log "No active conda environment detected (CONDA_SHLVL=${CONDA_SHLVL:-unset}, CONDA_PREFIX=${CONDA_PREFIX:-unset})."
      break
    fi

    log "Attempt $i: running 'conda deactivate'..."
    # hide output, but don't exit the script on failure
    if ! conda deactivate >/dev/null 2>&1; then
      log "conda deactivate returned non-zero or is not functional in this shell; stopping further attempts."
      break
    fi
    # small chance CONDA_SHLVL isn't updated; loop will re-check
  done
else
  log "conda command not found — skipping conda deactivate."
fi

# --- unset common conda-related env vars (harmless if not present) ---
for v in CONDA_SHLVL CONDA_PROMPT_MODIFIER CONDA_PREFIX CONDA_DEFAULT_ENV CONDA_EXE CONDA_PYTHON_EXE; do
  unset "$v" 2>/dev/null || true
done

# --- safely clean PATH by removing entries that look like conda installations ---
OLD_PATH="$PATH"
# Filter out entries containing these keywords (case-insensitive). Adjust pattern if you want.
filtered=$(printf '%s\n' "$OLD_PATH" | tr ':' '\n' | awk 'BEGIN{IGNORECASE=1} !/miniconda|miniforge|anaconda|conda/ {print}' | paste -sd: -)

if [ -z "$filtered" ]; then
  # If filtering would remove everything (unlikely), don't clobber PATH — leave it as-is
  log "PATH filtering would remove all entries; keeping original PATH."
else
  export PATH="$filtered"
  log "Cleaned PATH. Removed conda-like entries."
fi

log "Finished. To activate your venv: source ./venv/bin/activate"
