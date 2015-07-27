require 'spec_helper'
require 'rails_helper'
require 'pry'

describe "Drop page" , type: :feature do



  # it "displays drop title ", :js => true do
  #   visit "/drops/187471639"
  #   within_frame(find("iframe")) do
  #     expect(page).to have_content("Coffee Machine")
  #   end
  # end

  # it "displays drop title ", :js => true do
  #   visit "/drops/187471639"
  #   within_frame(find("iframe")) do
  #     expect(subject).to have_content("https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/187471639&amp;auto_play=false&amp;hide_related=true&amp;show_user=false&amp;show_comments=false&amp;show_reposts=false&amp;show_bpm=false&amp;sharing=false&amp;liking=false&amp;show_playcount=false&amp;download=false&amp;buying=false&amp;show_artwork=false&amp;visual=true")
  #   end
  # end

  it "gets the right source from SoundCloud API", :js => true, :skip => true do
    visit "/drops/187471639"
    expect(page).to have_selector("iframe[src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/187471639&amp;auto_play=false&amp;hide_related=true&amp;show_user=false&amp;show_comments=false&amp;show_reposts=false&amp;show_bpm=false&amp;sharing=false&amp;liking=false&amp;show_playcount=false&amp;download=false&amp;buying=false&amp;show_artwork=false&amp;visual=true']")
  end

  it "displays the place" do
    visit "/drops/187471639"
    expect(page).to have_content("@SoundCloud HQ")
  end

  # it "has the soundcloud widget" do
  #   visit "drops/187471639"
  #   expect(page).to have_selector("iframe")
  # end

  it "has a form for comments" do
    visit "drops/187472172"
    expect(page).to have_selector("form")
  end

  it "has a button to save the comments" do
    visit "drops/187472172"
    expect(page).to have_selector("input")
  end

  scenario "clicking the like button increases the likes of a drop", js: true do
    visit "/drops/187472038"
    likes_before = page.find("#votes").text.to_i
    click_button "like"
    likes_now = page.find("#votes").text.to_i
    expect(likes_now - likes_before).to eq(1)
  end
end
