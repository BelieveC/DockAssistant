class AppointmentPdf < Prawn::Document
  def initialize(appointment, qr, view)
    super()
    @appointment = appointment
    @view = view
    date = DateTime.parse(@appointment.datetime.to_s)
    formatted_date = date.strftime('%a %b %d %H:%M:%S')
    text "Boston Dock Management Ticket", size: 35, align: :center
    move_down 30
    print_qr_code("{ id: #{ @appointment.id }, datetime: #{@appointment.datetime}, vendor: #{ @appointment.vendor.name }, dock: #{ @appointment.dock.name }}",extent: 140)
    bounding_box([150,660], :width => 300, :height => 400) do
      font "Helvetica"
      text_box "Appointment #{ @appointment.id }", align: :center, size: 30
      font_size 14
      move_down 40
      text "Vender name: #{ @appointment.vendor.name }"
      text "Time: #{formatted_date}"
      text "Dock name: #{ @appointment.dock.name }"
    end
    move_down 20
  end

  def logo
    logopath = "#{Rails.root}/app/assets/images/ship.jpg"
    image logopath, width: 197, height: 91
    move_down 10
    draw_text 'Receipt', at: [220, 575], size: 22
  end
end
