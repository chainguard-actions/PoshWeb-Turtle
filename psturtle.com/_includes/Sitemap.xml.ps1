<#
.SYNOPSIS
    Includes sitemap.xml
.DESCRIPTION
    Includes the content for `sitemap.xml`.  
    
    This can be called after a site build to generate a `sitemap.xml` file.
.EXAMPLE
    ./Sitemap.xml.ps1
#>
#region sitemap.xml
if (-not $Site.NoSitemap) {
    $siteMapXml = @(
        '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
        :nextPage foreach ($key in $site.PagesByUrl.Keys | Sort-Object { "$_".Length}) {
            $keyUri = $key -as [Uri]
            $page = $site.PagesByUrl[$key]
            if ($site.Disallow) {
                foreach ($disallow in $site.Disallow) {
                    if ($keyUri.LocalPath -like "*$disallow*") { continue nextPage }
                    if ($keyUri.AbsoluteUri -like "*$disallow*") { continue nextPage }
                }
            }
            if ($page.NoIndex) { continue }
            if ($page.NoSitemap) { continue }
            if ($page.OutputFile.Extension -ne '.html') { continue }
            "<url>"
            "<loc>$key</loc>"
            if ($site.PagesByUrl[$key].Date -is [DateTime]) {
                "<lastmod>$($site.PagesByUrl[$key].Date.ToString('yyyy-MM-dd'))</lastmod>"
            }
            "</url>"
        }
        '</urlset>'
    ) -join ' ' -as [xml]
    if ($siteMapXml) {
        $strWriter = [IO.StringWriter]::new()
        $siteMapXml.Save($strWriter)
        "$strWriter"
    }
}
#endregion sitemap.xml
