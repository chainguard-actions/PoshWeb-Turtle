param(
[PSObject]
$AnimateMotionDuration
)

if ($AnimateMotionDuration -is [TimeSpan]) {
    $AnimateMotionDuration = $AnimateMotionDuration.TotalSeconds + 's'
}

if ($AnimateMotionDuration -is [int] -or $AnimateMotionDuration -is [double]) {
    $AnimateMotionDuration = "${AnimateMotionDuration}s"
}

$this | Add-Member -MemberType NoteProperty -Force -Name '.AnimateMotionDuration' -Value $AnimateMotionDuration
