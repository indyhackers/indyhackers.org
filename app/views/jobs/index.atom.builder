atom_feed do |feed|
  feed.title("IndyHackers Job Board")
  feed.updated(collection.first.updated_at)
 
  collection.each do |job|
    feed.entry([job]) do |entry|
      entry.title(job.title)
      entry.content(job.description.html_safe, :type => 'html')
      entry.author do |author|
        author.name('Miles Z. Sterrett')
      end
    end
  end
end

