<#
.SYNOPSIS
    Includes Help Content
.DESCRIPTION
    Includes the Help for a Command.
#>
param(
# The command
[PSObject]
$Command,

# If set, will invoke examples.
# This can be as dangerous as your examples.
[switch]
$InvokeExample,

# The width of the sample code (in landscape mode), in characters
[int]
$SampleCodeWidthLandscape = 80,

# The width of the sample code (in portrait mode), in characters
[int]
$SampleCodeWidthPortrait = 50
)

# Try to get command help
$CommandHelp = Get-Help -Name $Command -ErrorAction Ignore
# If we cannot get help, return
if (-not $CommandHelp) { return }

# If the help was a string
if ($CommandHelp -is [string]) {
    # return preformatted text.
    return "<pre>$([Web.HttpUtility]::HtmlEncode($CommandHelp))</pre>"
}

# Get the core parts of help we need.
$synopsis = $CommandHelp.Synopsis
$description = $CommandHelp.description.text -join [Environment]::NewLine
$notes = $CommandHelp.alertSet.alert.text -join [Environment]::NewLine

# Display the command name, synopsis, and description
"<h1>$([Web.HttpUtility]::HtmlEncode($CommandHelp.Name))</h1>"
"<h2>$([Web.HttpUtility]::HtmlEncode($synopsis))</h2>"
"<h3>$([Web.HttpUtility]::HtmlEncode($description))</h3>"

if ($notes) {
    # If there were notes, convert them from markdown
    (ConvertFrom-Markdown -InputObject $notes).Html
}

#region Grid Styles
"<style>"
".example-grid {
    width: 90vw;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}"
".example {    
    text-align: center;    
}"
".sampleCode {
    text-align: center;
    width: fit-content;
    font-size: .9rem;
    margin-left: auto;
    margin-right: auto;
}"

<#"@media (orientation: portrait) {
    sampleCode { width: ${SampleCodeWidthPortrait}ch }
}"#>

"code { text-align: left}"

".example-outputs {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 1.5rem;
    margin: 0.8rem;
    padding: 0.4rem;
    width: 90vw;
}"
".example-output { text-align: center }"
"</style>"
#endregion Grid Styles

# Create a grid for examples
"<div class='example-grid'>"
$exampleNumber = 0
# Walk over each example
foreach ($example in $CommandHelp.examples.example) {
    $exampleNumber++
    # Combine the code and remarks
    $exampleLines = 
        @(
            $example.Code
            foreach ($remark in $example.Remarks.text) {
                if (-not $remark) { continue }
                $remark
            }
        ) -join ([Environment]::NewLine) -split '(?>\r\n|\n)' # and split into lines

    # Anything until the first non-comment line is a markdown predicate to the example
    $nonCommentLine = $false
    $markdownLines = @()
        
    # Go thru each line in the example as part of a loop
    $codeBlock = @(foreach ($exampleLine in $exampleLines) {
        # Any comments until the first uncommentedLine are markdown
        if ($exampleLine -match '^\#' -and -not $nonCommentLine) {
            $markdownLines += $exampleLine -replace '^\#' -replace '^\s+'
        } else {
            $nonCommentLine = $true
            $exampleLine
        }
    }) -join [Environment]::NewLine
    
    # Join all of our markdown lines together
    $Markdown = $markdownLines -join [Environment]::NewLine
        
    # and start our example div
    "<div class='example'>"
        # If we had markdown, output it
        if ($markdown) {
            (ConvertFrom-Markdown -InputObject $Markdown).Html
        }
        # followed by our sample code
        "<div class='sampleCode'>"
            "<pre>"
                "<code class='language-powershell'>" + 
                    [Web.HttpUtility]::HtmlEncode($codeBlock) + 
                "</code>"
            "</pre>"
        "</div>"    
    
        # If we do not want to invoke examples, we can continue to the next example.
        if (-not $InvokeExample) { 
            "</div>"
            "<hr/>"
            continue
        }

        # Otherwise, try to make our example a script block
        $exampleCode = 
            try {
                [scriptblock]::Create($codeBlock)
            } catch {
                Write-Warning "Unable to convert $($example.code) to a script"
                continue
            }
        
        # then run it and capture the output
        $exampleOutputs = @(. $exampleCode)
        
        # Keep track of our example output count
        $exampleOutputNumber = 0
        # and start walking thru the list
        "<div class='example-outputs'>"
        foreach ($exampleOutput in $exampleOutputs) {
            $exampleOutputNumber++
            # Each output goes in a div
            "<div class='example-output'>"
            # if the output was a file
            if ($exampleOutput -is [IO.FileInfo]) {
                # and that file is SVG
                if ($exampleOutput.Extension -eq '.svg') {
                    # include it inline.
                    Get-Content $exampleOutput.FullName -Raw
                }
            } else {
                # If the output was a turtle object
                if ($exampleOutput.pstypenames -contains 'Turtle') {
                    # set it's ID
                    $exampleOutput.ID = "$($Command)-Example-$exampleCounter"
                    if ($exampleOutputs.Length -gt 1) {
                        # If we have more than out output,
                        # attach our example counter
                        $exampleOutput.ID += "-$($exampleOutputNumber)"
                    }
                }            
                # Include our example output inline
                if ($exampleOutput.ToHtml.Invoke) {
                    $exampleOutput.ToHtml()
                } else {
                    "$exampleOutput"
                }            
            }    
            "</div>"
        }
        "</div>"
        "<hr/>"
    "</div>"    
}
"</div>"