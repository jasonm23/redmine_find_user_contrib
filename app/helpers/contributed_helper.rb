module ContributedHelper
  
  def issue_fields
    "issues.id," + (Issue.new.attributes.keys.collect{|k| "issues." + k}.join ",")
  end

  def journal_fields 
    "journal.id," + (Journal.new.attributes.keys.collect{|k| "journal." + k}.join ",")
  end

end
