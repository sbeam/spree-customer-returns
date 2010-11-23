require File.dirname(__FILE__) + '/../test_helper'

class CustomerReturnsExtensionTest < Test::Unit::TestCase
  
  # Replace this with your real tests.
  def test_this_extension
    flunk
  end
  
  def test_initialization
    assert_equal File.join(File.expand_path(Rails.root), 'vendor', 'extensions', 'customer_returns'), CustomerReturnsExtension.root
    assert_equal 'Customer Returns', CustomerReturnsExtension.extension_name
  end
  
end
