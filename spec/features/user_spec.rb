require 'spec_helper'

feature 'User browsing the website' do
  let!(:post) {FactoryGirl.create(:post)}
  context "on homepage" do
    it "sees a list of recent posts titles" do
      recent_posts = post
      visit root_path
      # save_and_open_page
      page.has_content? recent_posts.title
      # given a user and a list of posts
      # user visits the homepage
      # user can see the posts titles
    end

    it "can click on titles of recent posts and should be on the post show page" do
      # post # need this here to "lazy load" the let(:post) if we don't use let!(:post)
      visit root_path
      # save_and_open_page # when rspec runs, a page will open with what capybara sees. This is from the launchy gem.
      click_link post.title
      current_url.should eql "http://www.example.com/posts/#{post.id}" 

      # given a user and a list of posts
      # user visits the homepage
      # when a user can clicks on a post title they should be on the post show page
    end
  end

  context "post show page" do
    it "sees title and body of the post" do
      visit root_path
      click_link post.title
      page.has_content? post.title
      page.has_content? post.content
      # given a user and post(s)
      # user visits the post show page
      # user should see the post title
      # user should see the post body
    end
  end
end
