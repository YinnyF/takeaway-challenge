require 'menu'

describe Menu do
  context 'with no dishes' do
    it { is_expected.to respond_to(:list_of_dishes) }

    it 'starts off with no dishes in list of dishes' do
      expect(subject.list_of_dishes).to eq []
    end
  end

  context '#add_dish' do
    let(:price) { 3.00 }
    let(:dish) { instance_double(Dish, name: 'Fries') }

    it { is_expected.to respond_to(:add_dish).with(2).argument }

    it 'can add a dish that can be read in list of dishes' do
      subject.add_dish(dish, price)
      expect(subject.list_of_dishes).to eq [{ dish: dish, price: price }]
    end

    it 'can have more than one dish in the list of dishes' do
      dishes = []
      10.times { subject.add_dish(dish, price); dishes << { dish: dish, price: price } }

      expect(subject.list_of_dishes).to eq dishes
    end
  end
end
