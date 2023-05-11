xml.instruct! :xml, version: "1.0"
xml.tag! "urlset", "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @other_routes.each do |other|
    xml.url do
      xml.loc("http://www.indyhackers.org#{other}")
      xml.changefreq("daily")
    end
  end
  @jobs.each do |job|
    xml.url do
      xml.loc job_url(job)
      xml.changefreq("daily")
    end
  end
end
