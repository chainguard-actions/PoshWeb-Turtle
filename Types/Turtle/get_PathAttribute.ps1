if (-not $this.'.PathAttribute') { 
    $this | Add-Member NoteProperty '.PathAttribute' ([Ordered]@{}) -Force    
}
return $this.'.PathAttribute'