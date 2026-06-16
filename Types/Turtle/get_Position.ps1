if (-not $this.'.Position') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Position' -Value ([pscustomobject]@{ X = 0; Y = 0 })
}
return $this.'.Position'
