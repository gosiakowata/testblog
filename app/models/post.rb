class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :tags, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false

  validates_presence_of :body, :title

  belongs_to :user

  def tags_array
  	"#{tags}".split(',')
  end
end
