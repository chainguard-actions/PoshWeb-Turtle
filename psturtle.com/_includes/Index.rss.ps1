<#
.SYNOPSIS
    Includes `index.rss`
.DESCRIPTION
    Includes the content for an `index.rss`.

    This should be called after the build to generate an RSS feed for the site.
#>
#region index.rss
if (-not $Site.NoRss) {
    $pagesByDate = @($site.PagesByUrl.GetEnumerator() | 
        Sort-Object { $_.Value.Date } -Descending)
    $lastPubDate = if ($pagesByDate.Values.Date) {
        $pagesByDate[0].Value.Date.ToString('R')
    } else {
        $lastBuildTime.ToString('R')
    }
    $rssXml = @(
        '<rss version="2.0">'
            '<channel>'
            "<title>$([Security.SecurityElement]::Escape($(
                if ($site.Title) { $site.Title } else { $site.CNAME }
            )))</title>"
            "<link>$($site.RootUrl)</link>"        
            "<description>$([Security.SecurityElement]::Escape($(
                if ($site.Description) { $site.Description } else { $site.Title }
            )))</description>"
            "<pubDate>$($lastPubDate)</pubDate>"
            "<lastBuildDate>$($lastBuildTime.ToString('R'))</lastBuildDate>"
            "<language>$([Security.SecurityElement]::Escape($site.Language))</language>"        
            :nextPage foreach ($keyValue in $pagesByDate) {
                $key = $keyValue.Key
                $keyUri = $key -as [Uri]
                $page = $keyValue.Value
                if ($site.Disallow) {
                    foreach ($disallow in $site.Disallow) {
                        if ($keyUri.LocalPath -like "*$disallow*") { continue nextPage }
                        if ($keyUri.AbsoluteUri -like "*$disallow*") { continue nextPage }
                    }
                }
                if ($site.PagesByUrl[$key].NoIndex) { continue }
                if ($site.PagesByUrl[$key].NoSitemap) { continue }
                if ($site.PagesByUrl[$key].OutputFile.Extension -ne '.html') { continue }
                "<item>"
                "<title>$([Security.SecurityElement]::Escape($(
                    if ($page.Title) { $page.Title }
                    elseif ($site.Title) { $site.Title }
                    else { $site.CNAME }
                )))</title>"
                if ($site.PagesByUrl[$key].Date -is [DateTime]) {
                    "<pubDate>$($site.PagesByUrl[$key].Date.ToString('R'))</pubDate>"
                }
                "<description>$([Security.SecurityElement]::Escape($(
                    if ($page.Description) { $page.Description }
                    elseif ($site.Description) { $site.Description }
                )))</description>"
                "<link>$key</link>"
                "<guid isPermaLink='true'>$key</guid>"
                "</item>"
            }
            '</channel>'
        '</rss>'
    ) -join ' ' -as [xml]
    
    if ($rssXml) {        
        $stringWriter = [IO.StringWriter]::new()
        $rssXml.Save($stringWriter)
        "$stringWriter"
    }
}
#endregion index.rss

