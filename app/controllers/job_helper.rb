module JobHelper

  def sort_by(attribute, list)
    if attribute.eql? "location"
      list.order(:city)
    elsif attribute.eql? "interest"
      list.order('level_of_interest DESC')
    elsif attribute.eql? "company"
      list.order(:company_id)
    else
      list
    end
  end

  def list
    if @location
      Job.where(city: @location)
    elsif @category
      @category.jobs
    else
      set_company.jobs
    end
  end
end
