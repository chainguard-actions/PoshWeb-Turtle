<#
.SYNOPSIS
    Gets any Text Attributes
.DESCRIPTION
    Gets any attributes associated with the Turtle text
    
#>
if (-not $this.'.TextAttribute') { 
    $this | Add-Member NoteProperty '.TextAttribute' ([Ordered]@{}) -Force    
}
return $this.'.TextAttribute'