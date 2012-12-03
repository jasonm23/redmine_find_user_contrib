module ContributedHelper
  
  def issue_fields
    "issues.id," + (Issue.new.attributes.keys.collect{|k| "issues." + k}.join ",")
  end

  def journal_fields 
    "journals.id," + (Journal.new.attributes.keys.collect{|k| "journals." + k}.join ",")
  end

  def time_entry_fields
    "time_entries.id," + (TimeEntry.new.attributes.keys.collect{|k| "time_entries." + k}.join",")
  end

end
