require("minitest/autorun")
require('minitest/reporters')
require_relative('../card.rb')
require_relative('../card_game.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCardGame < MiniTest::Test

  def setup()
    @card1 = Card.new('Club', 3)
    @card2 = Card.new('Hearts', 5)
    @card3 = Card.new('Diamond', 14)
    @cards = [@card1, @card2]
  end

  def test_get_suit()
    assert_equal('Hearts', @card2.suit())
  end

  def test_get_value()
    assert_equal(3, @card1.value())
  end

  def test_check_for_ace__true()
    assert_equal(true, CardGame.check_for_ace(@card3))
  end

  def test_check_for_ace__false()
    assert_equal(false, CardGame.check_for_ace(@card1))
  end

  def test_highest_card()
    assert_equal(@card2, CardGame.highest_card(@card1, @card2))
    assert_equal(@card3, CardGame.highest_card(@card1, @card3))
  end

  def test_cards_total()
    cards_total = "You have a total of 8"
    assert_equal(cards_total, CardGame.cards_total(@cards))
  end

end
