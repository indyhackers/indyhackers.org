require "net/http"
namespace :sitemap do
  desc "Submit to Google, Bing"
  task :submit do
    # http://www.google.com/webmasters/sitemaps/ping?sitemap=http://YOURWEBSITE.COM/sitemap-file.xml
    uri = URI("http://www.google.com/webmasters/sitemaps/ping?sitemap=http://indyhackers.org/sitemap.xml")
    Net::HTTP.get(uri)

    # http://www.bing.com/webmaster/ping.aspx?siteMap=http://YOURrssfeedURL.COM
    uri = URI("http://www.bing.com/webmaster/ping.aspx?siteMap=http://indyhackers.org/sitemap.xml")
    Net::HTTP.get(uri)
  end
end
