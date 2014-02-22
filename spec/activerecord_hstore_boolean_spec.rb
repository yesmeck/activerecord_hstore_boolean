require 'spec_helper'

class Product < ActiveRecord::Base
  hstore_boolean_values :properties, :popular
end

describe ActiverecordHstoreBoolean do
  ActiverecordHstoreBoolean::TRUE_VALUES.each do |true_value|
    it 'normalize true value' do
      product = Product.create(properties: { popular: true_value, color: 'white' })
      product.reload
      expect(product.properties['popular']).to be_true
      expect(product.properties['color']).to eq 'white'
    end

  end

  it 'normalize falue value' do
    product = Product.create(properties: { popular: 'false', color: 'white' })
                                           product.reload
    expect(product.properties['popular']).to be_false
    expect(product.properties['color']).to eq 'white'
  end
end
