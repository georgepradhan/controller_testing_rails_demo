require 'spec_helper'

describe Post do
  let(:post) { FactoryGirl.create(:post) }
  # let(:post) { Post.create(title: "Title", content: "Content") }

  it "title should be automatically titleized before save" do
    post.title.should eql "Title"
  end

  it "post should be unpublished by default" do
    post.is_published.should be_false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
