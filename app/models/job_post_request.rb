class JobPostRequest
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :id, :name, :email, :title, :description, :attachment
  validates_presence_of :name, :email, :title, :description


  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def save
    true
  end

  def persisted?
    false
  end
end
