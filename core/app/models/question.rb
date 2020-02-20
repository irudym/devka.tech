class Question < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  def self.create_with_tags!(params)
    question = Question.create!(params.except(:tags))

    tag_list = params[:tags].map do |tag|
      check_tag = Tag.find_by(text: tag)
      if check_tag
        question.tags << check_tag
      else
        question.tags << Tag.create!(text: tag)
      end
    end
    
    question
  end
end
