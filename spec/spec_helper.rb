require 'simplecov'
SimpleCov.start

require File.dirname(__FILE__) + "/../lib/pag_seguro"

class HaveAttributeAccessor
  def initialize(attribute)
    @attribute = attribute
  end
  
  def matches?(target)
    @target = target
    @target.respond_to?(:"#{@attribute}").should == true
    @target.respond_to?(:"#{@attribute}=").should == true
  end
  
  def failure_message
    "expected #{@target.inspect} to have '#{@expected}' attribute accessor"
  end
  
  def negative_failure_message
    "expected #{@target.inspect} not to have '#{@expected}' attribute accessor"
  end
end

def have_attribute_accessor(attribute)
  HaveAttributeAccessor.new(attribute)
end