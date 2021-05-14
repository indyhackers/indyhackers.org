atom_feed language: 'en-US' do |feed|
  feed.title('IndyHackers Job Board')
  feed.updated(@jobs.first.created_at)

  @jobs.each do |job|
    feed.entry(job) do |entry|
      salary = job.salary.present? ? " (#{job.salary})" : ''
      entry.title("#{job.title} at #{job.company}#{salary}")
      entry.content(MARKDOWN.render(job.description).html_safe, type: 'html')
      entry.author do |author|
        author.name('IndyHackers')
      end
    end
  end
end
