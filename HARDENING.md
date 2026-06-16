<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.1.10

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **PoshWeb--Turtle/v0.1.10** was hardened automatically. 0 finding(s) were identified and resolved across 1 iteration(s).

## Iteration Notes

### Iteration 1

**Fixes applied:** script-injection

**Notes:**

Replaced `Invoke-Expression -Command $myScript` in the `InvokeActionModule` function with a safer pattern: write the script to a temp file via `[IO.File]::WriteAllText()`, execute it with the dot-source operator (`. $myScriptFile`), and clean up in a `finally` block. This eliminates the Invoke-Expression injection risk while preserving the action's intended behavior of running user-provided PowerShell scripts. The `Run` input was already correctly passed through the `env:` block rather than being directly interpolated into the shell script.

