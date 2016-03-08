describe WikisController do

  describe "#index" do
    it "should return an array of Wikis" do
      #Setup
        wiki = Wiki.create
      #Execution
        get :index
      #Validation
        expect(assigns(:wikis)).to eq([wiki])
    end
  end
end
