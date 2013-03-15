describe Datafile do
  before(:all) { @data = File.read('example_input.tab') }

  let(:rows) { TsvParser.new(input) }
  subject { Datafile.new(rows) }

  context "loading a single row" do
    let(:input) { @data.split("\n")[0..1].join("\n") }

    it 'should create a merchant' do
      expect { subject.save }.to change(Merchant, :count).by(1)
    end
    it 'should create an item' do
      expect { subject.save }.to change(Item, :count).by(1)
    end
    it 'should create a purchaser' do
      expect { subject.save }.to change(Purchaser, :count).by(1)
    end
    it 'should create a purchase' do
      expect { subject.save }.to change(Purchase, :count).by(1)
    end
    it "should report the purchase's gross revenue as the total" do
      subject.save
      subject.total_gross_revenue.should == Purchase.last.gross_revenue
    end
  end

  context "loading the whole file" do
    let(:input) { @data }

    it 'should track the total gross revenue' do
      expect do
        subject.save
      end.to change(subject, :total_gross_revenue).by(95.to_money)
    end
  end
end
