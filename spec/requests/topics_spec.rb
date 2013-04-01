require 'spec_helper'

describe "Topics" do
  describe "GET /topics" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get topics_path
      response.status.should be(200)
    end
  end

  describe "Creating new topic" do
  	it "should display a page for creating new topic" do
  		get 'topics/new'
  		response.should be_success
  	end

  	context "with invalid parameters" do
  		before do
  		end

  		let (:invalid) { {topic: {name:"", description:""}}}

	  	it "should not create a new record in the database with invliad parameters" do
	  		invalid_parameter = {topic: {name: "", desription: "test"}}
	  		expect {post "topics#create", invalid_parameter}.to_not change {Topic.count}
	  	end

	  	it "Should render the new template again" do
	  		invalid_parameter = {topic: {name: "", description:""}}
	  		post "topics#create", invalid_parameter
	  		response.should render_template("new")
	  	end
	end

  end	

  describe "Updating a topic" do
  	let(:topic) { Topic.create(name:"Test topic", description:"Test description") }

  	context "Showing the edit page for the topic" do
  		it "should " do 
  			get "topics#edit", {id:topic.id}
  			assigns(:topic).should eg(topic)
  		end
  	end



  end
end
