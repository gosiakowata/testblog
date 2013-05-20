class PostDecorator < Draper::Decorator
  decorates :post
  delegate_all

  def friendly_title
  	model.title.downcase.downcase.gsub(' ', '-')
  end
end
