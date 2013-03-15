require 'tsv_parser'

describe TsvParser do
  context "parsing a file" do
    let(:text) do <<TEXT
first word\tsecond word
Living\tSocial
Data\tEngineering
TEXT
    end
    subject { TsvParser.new(text) }

    it 'should define attributes based on the file header' do
      subject.attributes.should == [ :first_word, :second_word ]
    end

    it 'should enumerate to produce an object per row' do
      rows = subject.entries
      rows.should have(2).items
      rows[0].first_word.should == "Living"
      rows[0].second_word.should == "Social"
      rows[1].first_word.should == "Data"
      rows[1].second_word.should == "Engineering"
    end
  end
end
