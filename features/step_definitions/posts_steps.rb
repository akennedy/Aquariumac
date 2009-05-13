Given /^I have posts? titled (.*)$/ do |posts|
  posts.split(', ').each do |post|
    Factory(:post, :subject => post)
  end

end

Then /^I should see (.*) posts?$/ do |count|
  Post.count.should == count.to_i
end

Given /^I have no posts$/ do
  Post.delete_all
end  
