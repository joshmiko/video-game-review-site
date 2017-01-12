require 'rails_helper'

feature 'user interacts with reviews' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }

  scenario 'user creates a review for an item' do
    login_as(user)
    visit games_path
    click_link "Test Game"
    click_link "Add a Review"

    fill_in "Title", with: "Awesome Game"
    fill_in "Body", with: "whoaa, that's a game"

    click_button "Add review"

    expect(page).to have_content("Awesome Game")
    expect(page).to have_content("Reviewed by: #{user.username}")
  end

  scenario 'user views all reviews for an item' do
    login_as(user)
    visit games_path
    click_link "Test Game"
    click_link "Add a Review"

    fill_in "Title", with: "Awesome Game"
    fill_in "Body", with: "whoaa, that's a game"

    click_button "Add review"

    expect(page).to have_content("What the people are thinking:")
    expect(page).to have_content("whoaa, that's a game")
  end

  scenario 'user edits a review for an item' do
    login_as(user)
    visit games_path
    click_link "Test Game"
    click_link "Add a Review"

    fill_in "Title", with: "Awesome Game"
    fill_in "Body", with: "whoaa, that's a game"

    click_button "Add review"

    click_link "Wanna change your review for: Test Game?"
    click_link "Edit"

    fill_in "Edit Title", with: "Not so awesome game"
    fill_in "Edit Body", with: "whoaa, that's a bummer"

    click_button "Submit Changes"

    expect(page).to have_content("Not so awesome game")
    expect(page).to have_content("whoaa, that's a bummer")
  end

  scenario 'user edits a review for an item' do
    login_as(user)
    visit games_path
    click_link "Test Game"
    click_link "Add a Review"

    fill_in "Title", with: "Awesome Game"
    fill_in "Body", with: "whoaa, that's a game"

    click_button "Add review"

    click_link "Wanna change your review for: Test Game?"
    click_link "Delete Review"

    expect(page).to have_content("Review was deleted")
  end
end
