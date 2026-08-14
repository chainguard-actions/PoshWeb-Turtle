<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.1.9

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.1.9** was hardened automatically. 3 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple `uses:` references in workflow files use mutable tags or branch names instead of pinned 40-character SHA digests, making the action vulnerable to supply-chain attacks if the referenced action is compromised or altered.

In BuildTurtle.yml:
- `uses: actions/checkout@v4` (line ~36)
- `uses: actions/upload-artifact@main` (line ~103)
- `uses: actions/checkout@v2` (line ~108)
- `uses: actions/checkout@main` (line ~530)
- `uses: StartAutomating/EZOut@master` (line ~532)

In deploy.yml:
- `uses: actions/checkout@main`
- `uses: actions/configure-pages@main`
- `uses: actions/upload-pages-artifact@main`
- `uses: actions/deploy-pages@main`

Locations:

- `.github/workflows/BuildTurtle.yml:36`
- `.github/workflows/BuildTurtle.yml:103`
- `.github/workflows/BuildTurtle.yml:108`
- `.github/workflows/BuildTurtle.yml:530`
- `.github/workflows/BuildTurtle.yml:532`
- `.github/workflows/deploy.yml:33`
- `.github/workflows/deploy.yml:37`
- `.github/workflows/deploy.yml:41`
- `.github/workflows/deploy.yml:47`

### script-injection (severity: high)

Sub-rule (a): `${{ }}` expressions are interpolated directly inside `run:` shell script blocks in the ReleaseModule and PublishPowerShellGallery steps of BuildTurtle.yml. Per the check rules, any `${{ ... }}` directly inside a `run:` script is a script-injection finding regardless of which context it reads from, because the value flows through YAML template substitution before the shell processes it.

Offending lines in the ReleaseModule run: block:
- `$releasesURL = 'https://api.github.com/repos/${{github.repository}}/releases'`
- `"Authorization" = 'Bearer ${{ secrets.GITHUB_TOKEN }}'` (appears twice)
- `owner = '${{github.owner}}'`
- `repo = '${{github.repository}}'`
- `"Authorization" = 'Bearer ${{ secrets.GITHUB_TOKEN }}'` (upload URL call)

Offending line in the PublishPowerShellGallery run: block:
- `$gk = '${{secrets.GALLERYKEY}}'`

Locations:

- `.github/workflows/BuildTurtle.yml:280`
- `.github/workflows/BuildTurtle.yml:284`
- `.github/workflows/BuildTurtle.yml:296`
- `.github/workflows/BuildTurtle.yml:297`
- `.github/workflows/BuildTurtle.yml:313`
- `.github/workflows/BuildTurtle.yml:338`
- `.github/workflows/BuildTurtle.yml:395`

### missing-permissions (severity: medium)

The workflow file BuildTurtle.yml has no top-level `permissions:` key and none of its three jobs (TestPowerShellOnLinux, TagReleaseAndPublish, BuildTurtle) define a job-level `permissions:` block. Without explicit permissions, the workflow runs with the default (potentially broad) GITHUB_TOKEN permissions, which can include write access to repository contents.

Locations:

- `.github/workflows/BuildTurtle.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, script-injection, missing-permissions

**Notes:**

Fixed all three findings in BuildTurtle.yml and deploy.yml:

1. unpinned-uses: Pinned all 9 action references to full 40-char SHA digests using lookup_action_sha. BuildTurtle.yml: checkout@v4→@11d5960a, upload-artifact@main→@043fb46d, checkout@v2→@0717577d, checkout@main→@f548e57e, EZOut@master→@82ea997b. deploy.yml: checkout@main→@f548e57e, configure-pages@main→@45bfe019, upload-pages-artifact@main→@98ef48e4, deploy-pages@main→@cd2ce8fc.

2. script-injection: Moved all ${{ }} expressions out of run: blocks into env: blocks. ReleaseModule step now uses GH_REPOSITORY and GH_TOKEN env vars (replacing github.repository, secrets.GITHUB_TOKEN, github.owner, github.repository inline expressions). PublishPowerShellGallery step now uses GALLERYKEY env var instead of inline ${{secrets.GALLERYKEY}}.

3. missing-permissions: Added top-level permissions block to BuildTurtle.yml with contents: write (for git tag push) and id-token: write. deploy.yml already had appropriate permissions.

