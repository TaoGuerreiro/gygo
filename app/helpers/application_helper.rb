module ApplicationHelper
  def render_flash
    return unless turbo_frame_request?
    turbo_stream.replace "flash-alerts" do
      render "layouts/flash"
    end
  end

  private

  def turbo_frame_request?
    request.headers["Turbo-Frame"].present?
  end
end
