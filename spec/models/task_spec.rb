require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { FactoryBot.build(:task) }

  describe 'バリデーション' do
    context 'タイトルとタスク内容' do
      it 'valide with a task name and contents' do
        expect(task).to be_valid
      end
      it "invalid task name" do
        @task = Task.new(name: nil)
        expect(task.errors[:name]).to include("can't be blank")
      end
      it 'invalid contents' do
        task.description = ''
        expect(task).to_not be_valid
      end
    end

    context '期限' do
    end
  end
end