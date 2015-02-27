require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  describe "#new" do
    
      it "renders a new template" do
        get :new
        expect(response).to render_template(:new)
      end
      it "assigns a new auction instance" do
        get :new
        expect(assigns(:bid)).to be_a_new(Bid)
      end
  end

  describe "#create" do
    
      context "with valid parameters" do
        def valid_request
          post :create, {bid: {
                            ammount: 15
                        }}
        end

        it "adds a auction to the database " do
          expect { valid_request }.to change {Bid.count}.by(1)
        end

        it "redirect to auction show page" do
          valid_request
          expect(response).to redirect_to(auction_path(:auction_id))
        end
      end

      context "with invalid parameters" do
        def invalid_request
          post :create, {bid: {
                            ammount: 8
                        }}
        end
        it "doesn't create a record in the database" do
          expect { invalid_request }.not_to change {Bid.count}
        end

        it "renders the new template" do
          invalid_request
          expect(response).to render_template(:new)
        end

      end
  end

end
