param(
[ValidateSet('nonzero', 'evenodd')]
[string]
$fillRule = 'nonzero'
)
$this.PathAttribute = [Ordered]@{'fill-rule' = $fillRule.ToLower()}
