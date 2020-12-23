class ExpireProjectJob < ApplicationJob
  queue_as :default

  def perform(project)
    @project = project

    return if project_already_active?

    @project.status = "inactive"
    @project.save! #save ! => If the model is new a record gets created in the database, otherwise the existing record gets updated

    UserMailer.with(project: @project).project_expired_notice.deliver_later
  
  end


  private
  def project_already_active?
    @project.status == "inactive"
  end

end
