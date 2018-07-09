require "rails_helper"

RSpec.feature "Creating articles" do
    before do
        @article1 = Article.create(title: "create new article", body: "filling the body for the first new article")
        @article2 = Article.create(title: "create new article", body: "filling the body for the second new article")
    end

    scenario "A user lists all articles" do
        visit "/"
        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)
    end

    scenario "A user has no articles" do
        Article.delete_all
        visit "/"
        expect(page).not_to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)
        
        within("h1#no-articles") do
          expect(page).to have_content("No articles created")
        end
    end
end