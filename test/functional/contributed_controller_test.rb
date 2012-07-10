require File.dirname(__FILE__) + '/../test_helper'

class ContributedControllerTest < ActionController::TestCase

  def test_access_user_model
    assert User.all.is? Array
  end
    
  def test_access_issue_model
    assert Issue.all.is? Array
  end

  def test_access_journal_model
    assert Journal.all.is? Array
  end

end
