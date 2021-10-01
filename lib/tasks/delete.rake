# frozen_string_literal: true

namespace :delete do
  desc 'Delete orders that are in progress older than 1 day'
  task old_inprogress_orders: :environment do
    puts 'Deleting inprogress Orders'
    Order.where('created_at < ?', 1.day.ago).where(status: :inprogress).each(&:destroy)
    puts 'Orders Deleted Successfully'
  end
end
