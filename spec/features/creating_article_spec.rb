require "rails_helper"

RSpec.feature "Creating articles" do
    scenario "A user fails to create a new article" do
        visit "/"
        click_link "New Article"
        fill_in "Title", with: ""
        fill_in "Body", with: ""
        click_button "Create Article"
        expect(page).to have_content ("Article has not been created")
        expect(page).to have_content ("The title can't be blank")
        expect(page).to have_content ("The body can't be blank")
        expect(page.current_path).to eq(articles_path)
    end

end