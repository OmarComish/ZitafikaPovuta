require "rails_helper"

RSpec.feature "Creating articles" do
    before do
        @article = Article.create(title: "Sample article", body: "content for sample article")
    end
    scenario "A user lists all article" do
        visit "/"
        click_link @article.title
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
    end
end