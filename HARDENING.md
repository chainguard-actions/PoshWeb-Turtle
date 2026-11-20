<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.2.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `374911c4be584df24e6da57af2d990570ef0f859`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.2.1** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

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

I re-applied the prior fix by hand. The earlier patch was cut off, so I couldn't copy it exactly. All ${{ }} expressions were already passed in through env: and read as ${env:...} under pwsh, so nothing needed changing there. The remaining risk was in the inline pwsh script in action.yml: it ran the TargetBranch and CommitMessage inputs through $ExecutionContext.SessionState.InvokeCommand.ExpandString, which runs any $(...) code inside the text. If a workflow put untrusted text like a PR title or branch name into either input, that text could run commands. I added an ExpandSafeString helper that fills in only $var, ${var} and $env:NAME references and never runs $(...), and both inputs now go through it. The trade-off: plain variable templating still works, but any $(...) a user puts in these two inputs will no longer run. That shape of the attached diff suggests the previous harden moved the script into a separate file; I kept it inline and changed only the risky calls. I didn't change the Run input, which runs a user script on purpose (that is what the action does), or the '{{ secrets.GITHUB_TOKEN }}' default, which is a placeholder rather than a real secret. Build/GitHub/Actions/TurtleAction.ps1, which looks like the build source for this inline script, wasn't edited: the action never runs it, and it still has the old calls, so regenerating action.yml from it would bring them back. I haven't run the action.

