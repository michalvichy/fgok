# Paths helper
module NavigationHelpers
  # rubocop:disable all
  def path_to(page_name)
    case page_name
    when /home/ then root_path
    else fail %Q(Can't find mapping from "#{page_name}" to a path.)
    end
  end
  # rubocop:enable all
end

World(NavigationHelpers)
