<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.1.10

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.1.10** was hardened automatically. 3 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### script-injection (severity: high)

Sub-rule (a): ${{ }} expressions are interpolated directly inside run: shell script strings in the ReleaseModule and PublishPowerShellGallery steps. Offending lines include: `$releasesURL = 'https://api.github.com/repos/${{github.repository}}/releases'`, `owner = '${{github.owner}}'`, `repo = '${{github.repository}}'`, `"Authorization" = 'Bearer ${{ secrets.GITHUB_TOKEN }}'` (multiple occurrences in ReleaseModule), and `$gk = '${{secrets.GALLERYKEY}}'` in PublishPowerShellGallery. These expressions are substituted by the Actions runner before the shell sees the script, allowing values to break out of the string context.

Locations:

- `.github/workflows/BuildTurtle.yml:207`
- `.github/workflows/BuildTurtle.yml:213`
- `.github/workflows/BuildTurtle.yml:214`
- `.github/workflows/BuildTurtle.yml:219`
- `.github/workflows/BuildTurtle.yml:232`
- `.github/workflows/BuildTurtle.yml:260`
- `.github/workflows/BuildTurtle.yml:280`

### unpinned-uses (severity: high)

Multiple uses: references in workflow files use mutable tags or branch names instead of pinned 40-character SHA digests, making the workflow vulnerable to supply-chain attacks. In BuildTurtle.yml: actions/checkout@v4, actions/upload-artifact@main, actions/checkout@v2, actions/checkout@main, StartAutomating/EZOut@master. In deploy.yml: actions/checkout@main, actions/configure-pages@main, actions/upload-pages-artifact@main, actions/deploy-pages@main.

Locations:

- `.github/workflows/BuildTurtle.yml:36`
- `.github/workflows/BuildTurtle.yml:100`
- `.github/workflows/BuildTurtle.yml:103`
- `.github/workflows/BuildTurtle.yml:310`
- `.github/workflows/BuildTurtle.yml:312`
- `.github/workflows/deploy.yml:33`
- `.github/workflows/deploy.yml:37`
- `.github/workflows/deploy.yml:42`
- `.github/workflows/deploy.yml:47`

### missing-permissions (severity: medium)

BuildTurtle.yml has no top-level permissions: key and none of its three jobs (TestPowerShellOnLinux, TagReleaseAndPublish, BuildTurtle) define job-level permissions: blocks. Without explicit permissions, the workflow inherits the default repository permissions, which may be overly broad for a workflow triggered by push, pull_request, and workflow_dispatch.

Locations:

- `.github/workflows/BuildTurtle.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** script-injection, unpinned-uses, missing-permissions

**Notes:**

Fixed all three findings in BuildTurtle.yml and deploy.yml:

1. script-injection: Moved all ${{ }} expressions from run: shell scripts into env: blocks. ReleaseModule step now uses env vars GH_REPOSITORY, GH_OWNER, GH_TOKEN (from github.repository, github.repository_owner, secrets.GITHUB_TOKEN). PublishPowerShellGallery step now uses env var GALLERY_KEY (from secrets.GALLERYKEY). All references in the PowerShell scripts updated to use $env:VAR_NAME instead of inline ${{ }} interpolation.

2. unpinned-uses: Pinned all 9 unpinned action references to full 40-char SHAs with original tag/branch preserved in comments. BuildTurtle.yml: checkout@v4→@11d5960a, upload-artifact@main→@043fb46d, checkout@v2→@0717577d, checkout@main→@f548e57e, EZOut@master→@82ea997b. deploy.yml: checkout@main→@f548e57e, configure-pages@main→@45bfe019, upload-pages-artifact@main→@98ef48e4, deploy-pages@main→@cd2ce8fc.

3. missing-permissions: Added top-level permissions block to BuildTurtle.yml with contents:write (required for git tag push operations) and packages:read.

