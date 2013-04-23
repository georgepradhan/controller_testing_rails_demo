require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    pending
  end

  it "post should be unpublished by default" do
    pending
  end

  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.save

    post.slug.should eq "new-post"
  end
end