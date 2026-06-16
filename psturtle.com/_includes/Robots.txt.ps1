<#
.SYNOPSIS
    Includes robots.txt
.DESCRIPTION
    Includes the content for `robots.txt`.  
    
    This can be called after a site build to generate a `robots.txt` file.
.EXAMPLE
    ./Robots.txt.ps1
#>
param()
#region robots.txt
if (-not $Site.NoRobots) {
    @(
        "User-agent: *"
        if ($site.Disallow) {
            foreach ($disallow in $site.Disallow) {
                "Disallow: $disallow"
            }
        }
        if ($site.Allow) {
            foreach ($allow in $site.Allow) {
                "Allow: $allow"
            }
        }
        if ($site.CNAME -and -not $site.NoSitemap) {
            "Sitemap: https://$($site.CNAME)/sitemap.xml"
        }
    )
}
#endregion robots.txt
