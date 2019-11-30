require 'spec_helper'

RSpec.describe Utils::UnionFind do
  it 'can deal with simple situations' do
    u = Utils::UnionFind.new(10)
    u.unite(3, 4)
    u.unite(4, 9)
    expect(u.connected?(1, 4)).to be false
    expect(u.nb_sets).to be 8
  end

  it 'can deal with complex situations' do
    u = Utils::UnionFind.new(10)
    u.unite(3, 4)
    u.unite(4, 9)
    u.unite(8, 0)
    u.unite(2, 3)
    u.unite(5, 6)
    u.unite(5, 9)
    u.unite(7, 3)
    expect(u.connected?(8, 0)).to be true
    (2..10).each do |v|
      expect(u.connected?(1, v)).to be false
    end
    expect(u.connected?(2, 3)).to be true
    expect(u.connected?(4, 3)).to be true
    expect(u.connected?(5, 3)).to be true
    expect(u.connected?(6, 3)).to be true
    expect(u.connected?(7, 3)).to be true
    expect(u.connected?(8, 3)).to be false
    expect(u.connected?(0, 3)).to be false
    expect(u.nb_sets).to be 3
  end
end
