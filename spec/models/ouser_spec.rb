require 'rails_helper'

# Custom print function
def print arg
    p arg if true
end

RSpec.describe Ouser, type: :model do
    describe "ousers" do

        it 'should have a defaulted fields' do

            ouser = FactoryGirl.build(:ouser)
            # print user
            expect(ouser.name).to eq "Busyra Anwar"
        end

        it 'should allow passed parameters' do

            ouser = FactoryGirl.build(:ouser, name: "Busyra Anwar")
            # print user latitude
            expect(ouser.latitude).to eq 34.0129909 
        end

        # build_stubbed() creates a fake id, build() leaves it nil
        it 'should fill in the id when using .build_stubbed()' do

            ouser = FactoryGirl.build_stubbed(:ouser)
            # print user
            expect(ouser.id).not_to eq nil # What should this equal?

        end

        # create() works as expected and saves the model to the database
        it 'should save to the database when using .create()' do

            ouser = FactoryGirl.create(:ouser)
            # print user
            expect(Ouser.find(ouser.id)).to eq ouser 
        end
    end
end