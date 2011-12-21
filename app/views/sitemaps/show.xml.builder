base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=> '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @other_routes.each do |other|
    xml.url {
      xml.loc("http://www.indyhackers.org#{other}")
      xml.changefreq("daily")
    }
  end
  @jobs.each do |job|
    xml.url {
      xml.loc("http://www.indyhackers.org/jobs/#{job.slug}")
      xml.changefreq("daily")
    }
  end
  @posts.each do |post|
    xml.url {
      xml.loc("http://www.indyhackers.org/blog/#{post.slug}")
      xml.changefreq("daily")
    }
  end
end
