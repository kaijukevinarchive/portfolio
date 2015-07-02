require 'rails_helper'

describe "the add project process" do 
	it "will add a project to a skill" do 
		skill = Skill.create(name: "Javascript", description: "Another language")
		visit skill_path(skill)
		click_link "Add a project"
		fill_in "Name", with: "Prime numbers"
		fill_in "Description", with: "A prime number finder"
		fill_in "Link", with: "metroidprimes.com"
		click_on "Submit"

		expect(page).to have_content "Another language"
	end 

	it "will show errors if the form is blank" do 
		skill = Skill.create(name: "Javascript", description: "Another language")
		visit skill_path(skill)
		click_link "Add a project"
		click_on "Submit"

		expect(page).to have_content "errors"
	end
end