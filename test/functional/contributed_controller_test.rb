require File.dirname(__FILE__) + '/../test_helper'

class ContributedControllerTest < ActionController::TestCase

  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_access_user_model
    assert User.all.is? Array
  end

  def test_user_structure
    assert User.inspect == "User(id: integer, login: string, hashed_password: string, firstname: string, lastname: string, mail: string, admin: boolean, status: integer, last_login_on: datetime, language: string, auth_source_id: integer, created_on: datetime, updated_on: datetime, type: string, identity_url: string, mail_notification: string, salt: string)"
  end
    
  def test_access_issue_model
    assert Issue.all.is? Array
  end

  def test_issue_structure
    assert Issue.inspect == "Issue(id: integer, tracker_id: integer, project_id: integer, subject: string, description: text, due_date: date, category_id: integer, status_id: integer, assigned_to_id: integer, priority_id: integer, fixed_version_id: integer, author_id: integer, lock_version: integer, created_on: datetime, updated_on: datetime, start_date: date, done_ratio: integer, estimated_hours: float, parent_id: integer, root_id: integer, lft: integer, rgt: integer, is_private: boolean)"
  end

  def test_access_journal_model
    assert Journal.all.is? Array
  end

  def test_journal_structure
    assert Journal.inspect == "Journal(id: integer, journalized_id: integer, journalized_type: string, user_id: integer, notes: text, created_on: datetime)"
  end  

end
