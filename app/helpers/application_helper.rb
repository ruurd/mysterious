module ApplicationHelper

  # Return a gender sign
  # @param gender Male if {mM} otherwise female
  # @return gender sign character
  def gendersign(gender)
    if gender == 'M' || gender == 'm'
      '&#9794;'
    else
      '&#9792;'
    end
  end

  # Return a checkmark character
  def checkmark
    '&#10004;'
  end

  #Return the name of a language
  def language_name(loc)
    t("languages.#{loc}")
  end

end
