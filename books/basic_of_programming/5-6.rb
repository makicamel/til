require "minitest/autorun"

def discriminant(a, b, c)
  b**2 - 4 * a * c
end

class DiscriminantTest < Minitest::Test
  def test_discriminant
    assert_equal discriminant(1, 1, 1), -3
    assert_equal discriminant(1, 2, 1), 0
    assert_equal discriminant(2, -1, 2), -15
  end
end
