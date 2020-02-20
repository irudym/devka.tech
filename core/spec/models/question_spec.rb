require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { create(:user) }
  let(:params) { {
    title: 'test question',
    description: 'some text',
    tags: ['tag1', 'tag2', 'tag3'],
    user: user
  }}


  context 'Question creation' do 
    before { @question = Question.create_with_tags!(params) }

    it 'creates a question with title' do
      expect(@question.title).to eq('test question')
    end

    it 'create tags with corresponding text' do
      tag = Tag.find_by(text: 'tag1')
      expect(tag).to be_truthy
    end

    it 'creates a question with tags' do
      expect(@question.tags.count).to eq(3)
    end
  end
end
