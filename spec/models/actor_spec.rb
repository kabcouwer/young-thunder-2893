require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors}
    it { should have_many(:movies).through(:movie_actors)}
  end

  describe 'class methods' do
    it '.youngest_to_oldest' do
      Actor.destroy_all
      actor1 = Actor.create!(name: 'Laura Dern', age: 30)
      actor2 = Actor.create!(name: 'Samuel L. Jackson', age: 35)
      actor3 = Actor.create!(name: 'Ariana Richards', age: 20)

      expect(Actor.youngest_to_oldest).to eq([actor3, actor1, actor2])
    end

    it '.average_age' do
      actor1 = Actor.create!(name: 'Laura Dern', age: 30)
      actor2 = Actor.create!(name: 'Samuel L. Jackson', age: 35)
      actor3 = Actor.create!(name: 'Ariana Richards', age: 20)

      expect(Actor.average_age).to eq(28)
    end
  end
end
