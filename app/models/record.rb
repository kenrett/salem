class Record < ActiveRecord::Base
  attr_accessible :report_type, :patient_name, :service_from, :service_thru, :paid_date, :hic_num, :gross_reimb, :cash_deduct, :blood_deduct, :coins, :net_reimb

end
