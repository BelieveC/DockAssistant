namespace :export do
  desc "Prints Dock.all in a seeds.rb way."
  task :seeds_format => :environment do
    Dock.order(:id).all.each do |dock|
      puts "Dock.create(#{dock.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    DockWorker.order(:id).all.each do |dock_worker|
      puts "DockWorker.create(#{dock_worker.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    State.order(:id).all.each do |state|
      puts "State.create(#{state.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    Vendor.order(:id).all.each do |vendor|
      puts "Vendor.create(#{vendor.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    Appointment.order(:id).all.each do |appointment|
      puts "Appointment.create(#{appointment.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    DockSchedule.order(:id).all.each do |dockschedule|
      puts "DockSchedule.create(#{dockschedule.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    Reservation.order(:id).all.each do |reservation|
      puts "Reservation.create(#{reservation.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    Shipment.order(:id).all.each do |shipment|
      puts "Shipment.create(#{shipment.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    Timeslot.order(:id).all.each do |timeslot|
      puts "Timeslot.create(#{timeslot.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    WorkerSchedule.order(:id).all.each do |workerschedule|
      puts "WorkerSchedule.create(#{workerschedule.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end