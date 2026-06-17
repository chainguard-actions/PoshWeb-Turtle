if (-not $this.'.SVGAttribute') { 
    $this | Add-Member NoteProperty '.SVGAttribute' ([Ordered]@{}) -Force    
}
return $this.'.SVGAttribute'