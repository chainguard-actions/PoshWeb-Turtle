<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.2.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.2.2** was hardened automatically. 4 finding(s) were identified and resolved across 2 iteration(s).

## Findings Fixed

### missing-permissions (severity: medium)

The workflow file .github/workflows/BuildTurtle.yml has no top-level `permissions:` key and no job-level `permissions:` key on any of its three jobs (TestPowerShellOnLinux, TagReleaseAndPublish, BuildTurtle). This means the workflow runs with the default (potentially broad) GITHUB_TOKEN permissions.

Locations:

- `.github/workflows/BuildTurtle.yml:1`

### script-injection (severity: high)

Sub-rule (a): GitHub Actions expressions are interpolated directly inside a `run:` shell script block. In the ReleaseModule step, `${{github.repository}}` is embedded in a PowerShell string used to construct a URL (`'https://api.github.com/repos/${{github.repository}}/releases'`), and `${{github.owner}}` and `${{github.repository}}` are embedded in a hashtable body passed to Invoke-RestMethod. These expressions are substituted by the Actions runner before the shell sees the script, allowing injection of shell metacharacters.

Locations:

- `.github/workflows/BuildTurtle.yml:174`

### unpinned-uses (severity: high)

Multiple `uses:` references in BuildTurtle.yml are pinned to mutable tags or branch names instead of immutable 40-character commit SHAs, making the workflow vulnerable to supply-chain attacks if the referenced action is compromised or its tag is moved:
- `uses: actions/checkout@v4` (line ~38)
- `uses: actions/upload-artifact@main` (line ~106)
- `uses: actions/checkout@v2` (line ~116)
- `uses: actions/checkout@main` (line ~307)
- `uses: StartAutomating/EZOut@master` (line ~308)

Locations:

- `.github/workflows/BuildTurtle.yml:38`
- `.github/workflows/BuildTurtle.yml:106`
- `.github/workflows/BuildTurtle.yml:116`
- `.github/workflows/BuildTurtle.yml:307`
- `.github/workflows/BuildTurtle.yml:308`

### unpinned-uses (severity: high)

Multiple `uses:` references in deploy.yml are pinned to the mutable `@main` branch instead of immutable 40-character commit SHAs, making the workflow vulnerable to supply-chain attacks:
- `uses: actions/checkout@main` (line 36)
- `uses: actions/configure-pages@main` (line 41)
- `uses: actions/upload-pages-artifact@main` (line 46)
- `uses: actions/deploy-pages@main` (line 52)

Locations:

- `.github/workflows/deploy.yml:36`
- `.github/workflows/deploy.yml:41`
- `.github/workflows/deploy.yml:46`
- `.github/workflows/deploy.yml:52`

## Iteration Notes

### Iteration 1

**Fixes applied:** missing-permissions, script-injection, unpinned-uses

**Notes:**

Fixed all four findings in BuildTurtle.yml and deploy.yml:

1. missing-permissions: Added top-level `permissions: contents: read` to BuildTurtle.yml. Added job-level `permissions: contents: write` to the TagReleaseAndPublish job (needed for git tag push and GitHub release creation). deploy.yml already had a permissions block.

2. script-injection: In the ReleaseModule step of BuildTurtle.yml, moved `${{github.repository}}` and `${{github.owner}}` out of the run: shell script into an env: block (as GITHUB_REPOSITORY_NAME and GITHUB_OWNER_NAME). Updated the PowerShell script to use `$env:GITHUB_REPOSITORY_NAME` and `$env:GITHUB_OWNER_NAME` instead.

3. unpinned-uses (BuildTurtle.yml): Pinned 5 actions to full commit SHAs — actions/checkout@v4, actions/upload-artifact@main, actions/checkout@v2, actions/checkout@main, StartAutomating/EZOut@master.

4. unpinned-uses (deploy.yml): Pinned 4 actions to full commit SHAs — actions/checkout@main, actions/configure-pages@main, actions/upload-pages-artifact@main, actions/deploy-pages@main.

All SHAs were resolved via lookup_action_sha.

### Iteration 2

**Fixes applied:** script-injection

**Notes:**

Fixed all four script-injection occurrences in hardened/action/.github/workflows/BuildTurtle.yml:

1. ReleaseModule step (lines 278, 318, 358): Added `GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}` to the step's `env:` block. Replaced the three direct interpolations `'Bearer ${{ secrets.GITHUB_TOKEN }}'` (in PowerShell single-quoted strings used as HTTP Authorization headers for the list-releases, create-release, and upload-asset API calls) with `"Bearer $($env:GH_TOKEN)"` — PowerShell double-quoted strings that read from the environment variable at runtime.

2. PublishPowerShellGallery step (line 433): Added `GALLERY_KEY: ${{ secrets.GALLERYKEY }}` to the step's `env:` block. Replaced `$gk = '${{secrets.GALLERYKEY}}'` with `$gk = $env:GALLERY_KEY` so the secret is read from the environment at runtime rather than being embedded in the script source.

