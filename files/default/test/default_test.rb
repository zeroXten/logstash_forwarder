require 'chef/mixin/shell_out'
include Chef::Mixin::ShellOut

# Documentation can be found here:
#  https://github.com/seattlerb/minitest
#  http://docs.seattlerb.org/minitest/

# Basic tests
class TestBasics < MiniTest::Chef::TestCase
  def test_true
    cmd = shell_out 'true'
    assert_equal(cmd.exitstatus, 0)
  end

  def test_false
    cmd = shell_out 'false'
    assert_equal(cmd.exitstatus, 1)
  end
end
