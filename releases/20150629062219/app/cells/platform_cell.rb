class PlatformCell < Cell::Rails
  helper PlatformsHelper
  def buildings(opts)
    @buildings = opts[:buildings] || {}
    @buildings.delete("_")
    render
  end

  def building_fields(opts)
    @template = "template" if opts[:template]
    @building = opts[:building]
    render
  end
end
