require "spec_helper"

describe KeywordStruct do
	it "has a version number" do
		expect(KeywordStruct::VERSION).not_to be nil
	end

	SampleStructClass = KeywordStruct.new(:foo, :bar)

	it 'is initializable by keyword arguments' do
		struct = SampleStructClass.new(foo: 'foo', bar: 'bar')
		expect(struct.foo).to eq 'foo'
		expect(struct.bar).to eq 'bar'
	end

	it 'fails if an argument is missing' do
		expect { SampleStructClass.new(foo: 'foo') }.to raise_error ArgumentError, 'missing keyword: bar'
		expect { SampleStructClass.new }.to raise_error ArgumentError, 'missing keywords: foo, bar'
	end

	it 'can have a custom implementation with a block' do
		CustomStructClass = KeywordStruct.new(:foo, :bar) do
			def upcase_foo
				foo.upcase
			end
		end

		expect(CustomStructClass.new(foo: 'foo', bar: 'bar').upcase_foo).to eq 'FOO'
	end
end
