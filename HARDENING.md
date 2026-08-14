<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.2.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.2.1** was hardened automatically. 5 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple `uses:` references in BuildTurtle.yml are pinned to mutable tags or branch names instead of full 40-character commit SHAs, making the workflow vulnerable to supply-chain attacks: `actions/checkout@v4`, `actions/upload-artifact@main`, `actions/checkout@v2`, `actions/checkout@main`, `StartAutomating/EZOut@master`.

Locations:

- `.github/workflows/BuildTurtle.yml:37`
- `.github/workflows/BuildTurtle.yml:83`
- `.github/workflows/BuildTurtle.yml:89`
- `.github/workflows/BuildTurtle.yml:281`
- `.github/workflows/BuildTurtle.yml:283`

### unpinned-uses (severity: high)

Multiple `uses:` references in deploy.yml are pinned to the mutable branch name `main` instead of full 40-character commit SHAs, making the workflow vulnerable to supply-chain attacks: `actions/checkout@main`, `actions/configure-pages@main`, `actions/upload-pages-artifact@main`, `actions/deploy-pages@main`.

Locations:

- `.github/workflows/deploy.yml:37`
- `.github/workflows/deploy.yml:41`
- `.github/workflows/deploy.yml:46`
- `.github/workflows/deploy.yml:51`

### permissions (severity: medium)

missing-permissions: BuildTurtle.yml has no top-level `permissions:` key and none of its three jobs (TestPowerShellOnLinux, TagReleaseAndPublish, BuildTurtle) define a job-level `permissions:` block. This means the workflow runs with the default, overly broad GITHUB_TOKEN permissions.

Locations:

- `.github/workflows/BuildTurtle.yml:1`

### script-injection (severity: high)

Rule (a): GitHub Actions expressions are interpolated directly inside `run:` shell script strings in the ReleaseModule step. The expressions `${{github.repository}}`, `${{github.owner}}`, and `${{ secrets.GITHUB_TOKEN }}` are embedded directly in the PowerShell script body (e.g., `$releasesURL = 'https://api.github.com/repos/${{github.repository}}/releases'` and `'Authorization' = 'Bearer ${{ secrets.GITHUB_TOKEN }}'`). Any `${{ }}` expression inside a `run:` block is a script-injection risk as the value is substituted by the YAML template engine before the shell processes it.

Locations:

- `.github/workflows/BuildTurtle.yml:155`

### script-injection (severity: high)

Rule (a): In the PublishPowerShellGallery `run:` block, the expression `${{secrets.GALLERYKEY}}` is interpolated directly inside the PowerShell script string: `$gk = '${{secrets.GALLERYKEY}}'`. Any `${{ }}` expression inside a `run:` block is a script-injection risk.

Locations:

- `.github/workflows/BuildTurtle.yml:222`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, permissions, script-injection

**Notes:**

Fixed all 5 findings across BuildTurtle.yml and deploy.yml:

1. Pinned 5 unpinned actions in BuildTurtle.yml to full commit SHAs (actions/checkout@v4, actions/upload-artifact@main, actions/checkout@v2, actions/checkout@main, StartAutomating/EZOut@master).

2. Pinned 4 unpinned actions in deploy.yml to full commit SHAs (actions/checkout@main, actions/configure-pages@main, actions/upload-pages-artifact@main, actions/deploy-pages@main).

3. Added top-level `permissions: contents: write / packages: read` block to BuildTurtle.yml (contents:write needed for git tag push).

4. Fixed script-injection in ReleaseModule step: moved ${{github.repository}}, ${{github.owner}}, and ${{secrets.GITHUB_TOKEN}} into the step's env: block; PowerShell script now reads them via $env:GH_REPOSITORY, $env:GH_OWNER, $env:GH_TOKEN.

5. Fixed script-injection in PublishPowerShellGallery step: moved ${{secrets.GALLERYKEY}} into the step's env: block as GALLERY_KEY; PowerShell script now reads it via $env:GALLERY_KEY.

