require "codewars"

describe "Codewars Ranking System" do

	let(:user) {User.new} 
	
	it "new user should be ranked -8" do
		expect(user.rank).to eq(-8)
	end

	it "new user's progress should be 0" do
		expect(user.progress).to eq(0)
	end

	it "progress should be 10 if new user does a kata one level up" do
		user.inc_progress(-7)
		expect(user.progress).to eq(10)
	end

	it "progress should be 40 when doing kata 2 levels up" do
		user.inc_progress(-6)
		expect(user.progress).to eq(40)
	end

	it "progress should be 60 and rank should be -7 if doing activity ranked -4" do
		user.inc_progress(-4)
		expect(user.progress).to eq(60)
		expect(user.rank).to eq(-7)
	end

	it "user should have +90 progress when doing kata three levels up" do
		user.inc_progress(-5)
		expect(user.progress).to eq(90)
	end

	it "user's progress should be 0 if progress is +100 and rank goes up" do
		user.inc_progress(-7)
		user.inc_progress(-5)
		expect(user.progress).to eq(0)
		expect(user.rank).to eq(-7)
	end


	it "user's progress should be 10 if a user ranked -1 completes activity ranked 1" do		
		user.rank = -1
		user.inc_progress(1)
		expect(user.progress).to eq(10)
	end

	it "user's progress should be 1 if a user ranked 1 completes activity one level down" do		
		user.rank = 1
		user.inc_progress(-1)
		expect(user.progress).to eq(1)
	end

	it "user's progress should be 0 if a user ranked 1 completes activity two levels down" do		
		user.rank = 1
		user.inc_progress(-2)
		expect(user.progress).to eq(0)
	end

	it "user's progress should be 0 and rank should be 8" do		
		user.rank = 8
		user.inc_progress(8)
		expect(user.progress).to eq(0)
		expect(user.rank).to eq(8)
	end

	it "should throw an error" do		
		expect { user.inc_progress(9) }.to raise_error
	end

end