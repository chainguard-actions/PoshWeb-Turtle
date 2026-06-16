$myCommandName = $MyInvocation.MyCommand.Name -replace '\.html\.ps1$'
if ($site.includes.Help) {
    . $site.includes.Help -Command $myCommandName
}