Factory.define :job do |j|
  j.title 'Awesome Job'
  j.description <<-MARKDOWN
  This is an awesome job. You can tell this is an awesome job by the bullet points.
    + Has awesome people
    + Has awesome perks
    + Has coffee
    + Has awesome workplace (psst, it's your home)
    + Has awesome moneys (we pay in yen)
  MARKDOWN
end
