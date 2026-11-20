<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.2.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `374911c4be584df24e6da57af2d990570ef0f859`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.2.2** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### prior-fix (severity: high)

Carried forward from this version's previous harden, which fixed it; fix it again unless the code no longer has the problem. The previous harden changed action.yml without recording a finding for it, and this analysis reported nothing there. Re-apply its security changes unless the code no longer needs them. The previous patch:
```diff
diff --git a/action.yml b/action.yml
index 533a47f..64152d6 100644
--- a/action.yml
+++ b/action.yml
@@ -1,60 +1,73 @@
-
 name: TurtlePowerShell
 description: Turtles in a PowerShell
-inputs: 
-  Run: 
+inputs:
+  Run:
     required: false
-    description: |
-      A PowerShell Script that uses Turtle.  
-      Any files outputted from the script will be added to the repository.
-      If those files have a .Message attached to them, they will be committed with that message.
-  SkipScriptFile: 
+    description: "A PowerShell Script that uses Turtle.  \nAny files outputted from the script will be added to the repository.\nIf those files have a .Message attached to them, they will be committed with that message.\n"
+  SkipScriptFile:
     required: false
     description: 'If set, will not process any files named *.Turtle.ps1'
-  InstallModule: 
+  InstallModule:
     required: false
     description: A list of modules to be installed from the PowerShell gallery before scripts run.
-  CommitMessage: 
+  CommitMessage:
     required: false
     description: If provided, will commit any remaining changes made to the workspace with this commit message.
-  TargetBranch: 
+  TargetBranch:
     required: false
     description: |
       If provided, will checkout a new branch before making the changes.
       If not provided, will use the current branch.
-  ActionScript: 
+  ActionScript:
     required: false
     description: The name of one or more scripts to run, from this action's path.
-  GitHubToken: 
+  GitHubToken:
     required: false
     default: '{{ secrets.GITHUB_TOKEN }}'
     description: The github token to use for requests.
-  UserEmail: 
+  UserEmail:
     required: false
     description: The user email associated with a git commit.  If this is not provided, it will be set to the username@noreply.github.com.
-  UserName: 
+  UserName:
     required: false
     description: The user name associated with a git commit.
-  NoPush: 
+  NoPush:
     required: false
     description: |
       If set, will not push any changes made to the repository.
       (they will still be committed unless `-NoCommit` is passed)
-  NoCommit: 
+  NoCommit:
     required: false
     description: |
       If set, will not commit any changes made to the repository.
       (this also implies `-NoPush`)
-branding: 
+branding:
   icon: chevron-right
   color: blue
-runs: 
+runs:
   using: composite
-  steps: 
+  steps:
     - name: TurtleAction
       id: TurtleAction
       shell: pwsh
-      env: 
+      env:
         UserName: ${{inputs.UserName}}
         CommitMessage: ${{inputs.CommitMessage}}
         Run: ${{inputs.Run}}
@@ -66,380 +79,4 @@ runs:
         NoCommit: ${{inputs.NoCommit}}
         NoPush: ${{inputs.NoPush}}
         InstallModule: ${{inputs.InstallModule}}
-      run: |
-        $Parameters = @{}
-        $Parameters.Run = ${env:Run}
-        $Parameters.SkipScriptFile = ${env:SkipScriptFile}
-        $Parameters.SkipScriptFile = $parameters.SkipScriptFile -match 'true';
-        $Parameters.InstallModule = ${env:InstallModule}
-        $Parameters.InstallModule = $parameters.InstallModule -split ';' -replace '^[''"]' -replace  '[''"]$'
-        $Parameters.CommitMessage = ${env:CommitMessage}
-        $Parameters.TargetBranch = ${env:TargetBranch}
-        $Parameters.ActionScript = ${env:ActionScript}
-        $Parameters.ActionScript = $parameters.ActionScript -split ';' -replace '^[''"]' -replace  '[''"]$'
-        $Parameters.GitHubToken = ${env:GitHubToken}
-        $Parameters.UserEmail = ${env:UserEmail}
-        $Parameters.UserName = ${env:UserName}
-        $Parameters.NoPush = ${env:NoPush}
-        $Parameters.NoPush = $parameters.NoPush -match 'true';
-        $Parameters.NoCommit = ${env:NoCommit}
-        $Parameters.NoCommit = $parameters.NoCommit -match 'true';
-        foreach ($k in @($parameters.Keys)) {
-            if ([String]::IsNullOrEmpty($parameters[$k])) {
-                $parameters.Remove($k)
-            }
-        }
-        Write-Host "::debug:: TurtleAction $(@(foreach ($p in $P
... (truncated)
```

Locations:

- `action.yml`

## Iteration Notes

### Iteration 1

**Fixes applied:** prior-fix

**Notes:**

I couldn't fully redo the previous fix because the old patch was cut off in the finding. It showed the inline pwsh script being removed, but not what replaced it. So I hardened the one clear code-injection risk in action.yml instead, and no tests were run. The script was calling $ExecutionContext.SessionState.InvokeCommand.ExpandString on the TargetBranch and CommitMessage inputs, which runs any $(...) subexpression in the value as code. Both calls now go through a new SafeExpandString helper. It still expands plain variable references like $env:GITHUB_SHA, but if a value contains '$(' it leaves the text unexpanded and logs a warning. One behaviour change: a branch name or commit message that relied on $(...), such as a date stamp, now stays as literal text. Inputs already reach the script through env: and are read as ${env:...}, so there are no ${{ }} expressions inside the run: script. I left the Run input running through Invoke-Expression, since running the user's script is what the action is for.

