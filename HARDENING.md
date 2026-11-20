<!-- markdownlint-disable -->

# Hardening Report: PoshWeb--Turtle/v0.2.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `374911c4be584df24e6da57af2d990570ef0f859`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **PoshWeb--Turtle/v0.2.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

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

The diff from the previous harden was cut off, so I couldn't see exactly what it did to the run: script. The visible part was mostly whitespace cleanup. Then the inline script, about 380 lines, was swapped for 4 lines I couldn't see. I did not try to rebuild that change. Instead I fixed the real security problem in the action.yml step script. It called $ExecutionContext.SessionState.InvokeCommand.ExpandString() on the TargetBranch and CommitMessage inputs. That evaluates $( ... ) subexpressions, so any untrusted text in those inputs (a branch name, a PR title) ran as PowerShell. I added a SafeExpandString helper and used it in both places. It still expands plain variable references like $env:X, but it returns the string unchanged with a warning if it contains '$(' or a backtick. This changes behaviour: a commit message or branch name that relied on a $( ... ) subexpression is now used as literal text. The rest of the script is unchanged and nothing was run to test it. The Run input still goes through Invoke-Expression, because running a user-supplied script is the point of that input. The GitHubToken default '{{ secrets.GITHUB_TOKEN }}' is a placeholder the script detects, not a real credential. Build/GitHub/Actions/TurtleAction.ps1 has the same ExpandString calls and is still unchanged; the step does not run it.

