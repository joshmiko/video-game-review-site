require 'rails_helper'

feature 'user interacts with website' do

  # let!(:user) { User.create(username: "User1") }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user creates a new item for review' do
    login_as(user)
    visit new_game_path

    fill_in "Name", with: "Awesome Game"
    fill_in "Developer", with: "dev dude"
    fill_in "Genre", with: "scurry"
    fill_in "Comments", with: "oh wow, much amaze"

    click_button "Add game"

    expect(page).to have_content("Games")

  end

  let!(:game) { FactoryGirl.create(:game) }

  scenario 'user views list of items' do
    login_as(user)
    visit games_path

    expect(page).to have_content("Test Game")

  end

  scenario 'user views details of item in list' do
    login_as(user)
    visit games_path
    click_link "Test Game"

    expect(page).to have_content("ok then")

  end
end
