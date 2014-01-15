require 'rspec'
require './sorted_array.rb'

shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do
         # pending "fill this spec in with a meaningful example"
        sorted_array.map {|el| el*2}.should eq [4,6,8,14,18]
        end
      end
    end

    describe "that update the original array" do
      describe :map! do

        #sorted_array.map! {|el| el}.should !=original_array
      #end
     

        #original_array = sorted_array.internal_arr
        #expect { sorted_array.map! {|el| el } }.to change { original_array }
      

        it 'the original array should be updated' do
          #new_array=sorted_array.internal_arr.map {|el| el}.should eq source
          pending "fill this spec in with a meaningful example"
          #to_change ?
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          #sorted_array.map! {|el| el }.should eq internal_arr


          pending "this is just the same as the example above"
        end
      end
    end
  end

  describe :find do
  
    describe 'given a block' do
    it "does not currently have any examples for it" do
      sorted_array.find {|el| el % 7==0}.should eq 7
    end
      #pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-find"
    end
  end

  describe :inject do
    context 'when passed no accumulator' do
      it 'should accumulate from the first element' do #making a sum of the array
        sorted_array.inject {|acc,el| acc+el}.should ==25
      end
    end

    context 'when passed an accumulator' do
      it 'should accumulate starting with that value' do #5 plus sum of the array
        sorted_array.inject(5) {|acc,el| acc+el}.should==30
      end
    end
  end
end