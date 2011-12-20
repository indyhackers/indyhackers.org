atom_feed :language => 'en-US' do |feed|
  feed.title("The IndyHackers Blog")
  feed.updated(collection.first.created_at)

  collection.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body_html.html_safe, :type => 'html')
      entry.author do |author|
        author.name('MilesZS')
      end
    end
  end
end
