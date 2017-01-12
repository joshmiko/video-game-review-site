require 'rails_helper'

feature 'admin interacts with admin control panel' do

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }

  scenario 'admin visits users index' do
    login_as(admin)
    visit '/admin/home'
    expect(page).to have_content("Users Master List")

    visit admin_users_path

    expect(page).to have_content(user.username)
  end

  scenario 'admin deletes a user' do
    login_as(admin)
    visit '/admin/home'

    visit admin_users_path

    click_link "#{user.username}"
    click_button "Delete User"

    expect(page).to have_content("User was successfully deleted")
  end

  scenario 'admin deletes a game' do
    login_as(admin)
    visit '/admin/home'

    visit admin_games_path

    click_link "#{game.name}"
    click_button "Delete Game"

    expect(page).to have_content("Game was successfully deleted")
  end

  scenario 'admin deletes a review' do
    login_as(admin)

    visit games_path
    click_link "Test Game"
    click_link "Add a Review"

    fill_in "Title", with: "Awesome Game"
    fill_in "Body", with: "whoaa, that's a game"

    click_button "Add review"

    visit '/admin/home'

    visit admin_reviews_path

    click_link "Awesome Game"
    click_button "Delete Review"

    expect(page).to have_content("Review was successfully deleted")
  end

  scenario 'unauthorized users are redirected' do
    login_as(user)
    visit '/admin/users'
    expect(page).to have_content('not authorized')
    expect(current_path).to eq(root_path)
  end

end
