require "rails_helper"
require "cancan/matchers"

describe "Ability" do
  describe "as guest" do
    it "can only view questions" do
      ability = Ability.new(nil)
      expect(ability).to be_able_to(:index, :question)
      expect(ability).to be_able_to(:show, :questions)
      expect(ability).not_to be_able_to(:create, :questions)
      expect(ability).not_to be_able_to(:update, :questions)
      expect(ability).not_to be_able_to(:delete, :questions)
    end
  end

  describe "as normal user" do
    it "can update himself, but not other users" do
      user = FactoryGirl.build(:regular_user)
      ability = Ability.new(user)

      expect(ability).to be_able_to(:index, :questions)
      expect(ability).to be_able_to(:show, :questions)
      # expect(ability).to be_able_to(:create, :questions, :user_id => user.id)
      # expect(ability).to be_able_to(:update, :questions, :user_id => user.id)
      # expect(ability).to be_able_to(:delete, :questions, :user_id => user.id)
    end

  end

  describe "as admin" do
    it "can access all" do
      user = FactoryGirl.build(:admin_user)
      ability = Ability.new(user)
      expect(ability).to be_able_to(:access, :all)
    end
  end
end