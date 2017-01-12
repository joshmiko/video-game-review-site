require 'rails_helper'

feature 'user interacts with website' do

  # let!(:user) { User.create(username: "User1") }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }


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

  let!(:user) { FactoryGirl.create(:user, role: 'admin') }

  scenario 'user views list of items' do
    visit games_path

    expect(page).to have_content("Test Game")
  end

  pending scenario 'user views details of item in list' do
    visit games_path
    click_link "Test Game"

    expect(page).to have_content("ok then")
  end

  scenario 'user edits item in list' do
    login_as(user)
    visit games_path
    click_link "Test Game"
    click_link "Edit"

    fill_in "Genre", with: "scary"
    fill_in "Comments", with: "new comment now"
    click_button "Add game"

    expect(page).to have_content("scary")
    expect(page).to have_content("new comment now")
  end

  scenario 'user deletes item in list' do
    login_as(user)
    visit games_path
    click_link "Test Game"
    click_link "Delete Game"

    expect(page).to have_content("Game was successfully deleted")
  end
end
