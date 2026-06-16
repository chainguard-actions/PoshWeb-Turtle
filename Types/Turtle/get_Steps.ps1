if (-not $this.'.Steps') {   
    $this.psobject.properties.add(
        [psnoteproperty]::new(
            '.Steps', [Collections.Generic.List[string]]::new()
        ), $false
    )    
}
return ,$this.'.Steps'
