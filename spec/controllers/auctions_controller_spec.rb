require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  let(:auction)   { create(:auction) }
  let(:auction_1) { create(:auction) }

  describe "#new" do
    
      it "renders a new template" do
        get :new
        expect(response).to render_template(:new)
      end
      it "assigns a new auction instance" do
        get :new
        expect(assigns(:auction)).to be_a_new(Auction)
      end
  end

  describe "#create" do
    
      context "with valid parameters" do
        def valid_request
          post :create, {auction: {
                            title: "valid auction title",
                            description: "valid descritpion",
                            reserve: 1000,
                            end_date: (Time.now + 10.days),
                            currentprice: 10
                        }}
        end

        it "adds a auction to the database " do
          expect { valid_request }.to change { Auction.count }.by(1)
        end

        it "redirect to auction show page" do
          valid_request
          expect(response).to redirect_to(auction_path(Auction.last))
        end
      end

      context "with invalid parameters" do
        def invalid_request
          post :create, {auction: {
                            description: "valid descritpion",
                            reserve: 1000,
                            due_date: (Time.now + 10.days),
                            currentprice: 10
                        }}
        end
        it "doesn't create a record in the database" do
          expect { invalid_request }.not_to change {Auction.count}
        end

        it "renders the new template" do
          invalid_request
          expect(response).to render_template(:new)
        end

      end
  end


    describe "#show" do
    # it "assigns a auction instance varialbe with passed id" do
    #   get :show, id: auction.id
    #   expect(assigns(:auction)).to eq(auction)
    # end

    it "renders the show template" do
      get :show, id: auction.id
      expect(response).to render_template(:show)
    end
  end

  describe "#index" do

    # it "assigns auctions instance variable to created auctions" do
    #   auction
    #   auction_1
    #   get :index
    #   expect(assigns(:auctions)).to eq([auction, auction_1])
    # end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end


  describe "#edit" do

        it "renders the edit template" do
          expect(response).to render_template(:edit)
        end

        # it "retrieves the auction with passed id and stores it in instance var" do
        #   expect(assigns(:auction)).to eq(auction)
        # end
      
  end

  describe "#update" do

        context "with valid request" do
          before do
            patch :update, id: auction.id, auction: {title: "new title"}
          end

          it "redirects to the auction show page" do
            expect(response).to redirect_to(auction_path(auction))
          end

          it "changes the title of the auction if it's different" do
            expect(auction.reload.title).to eq("new title")
          end

        end

        context "with invalid params" do
          before { patch :update, id: auction.id, auction: {title: ""} }

          it "renders the edit page" do
            expect(response).to render_template(:edit)
          end

          it "doesn't change the database" do
            expect(auction.reload.reserve).not_to eq(1002)
          end

        end
  end

  describe "#destroy" do
    let!(:auction)   { create(:auction) }
    
        it "deletes the auction from the database" do
          expect { delete :destroy, id: auction.id }.to change { Auction.count }.by(-1)
        end
        it "redirect to the home page (root path)" do
          delete :destroy, id: auction.id
          expect(response).to redirect_to root_path
        end

  end




end


