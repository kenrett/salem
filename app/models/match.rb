require 'csv'

class Match < ActiveRecord::Base
  attr_accessible :serv_area_name,:iop,:hsp_account_id,:pat_mrn_id,:pat_name,:medicare_id,:medicaid_id,:account_class,:har_adm_date,:har_disch_date,:prim_enc_csn_id,:dsch_department,:fc_on_transaction,:payor_on_transaction,:payor_on_bucket,:fin_class_name_1,:payor_name_1,:fin_class_name_2,:payor_name_2,:fin_class_name_3,:payor_name_3,:fin_class_name_4,:payor_name_4,:total_selfpay_payments,:total_non_medicare_insurance_pymts,:total_medicare_insurance_pymts,:total_contractual_adj,:balance_primary_coverage,:transaction_type,:write_off_date,:service_date,:tx_comment,:y,:proc_id,:proc_code,:proc_name,:transaction_amount,:x,:bucket_id,:bucket_type,:claim_form
# started at 12:40

  # def description
  #   # m = Match NEEDS FIXING
  #   # "#{pat_name}, #{}" + parse_time(har_adm_date) + parse_time(har_disch_date + parse_time(paid_date) + " #{}"
  # end

  # def parse_time(col)
  #   col.gsub(/(\d{4})(.+)/, '\1')
  # end

  def self.match
    matches = Match.limit(100)
    records = Record.limit(100)
    all_matches = []

    matches.each do |match|
      puts "<<<<First loop!>>>>"
      records.each do |record|
        puts "Second loop!"
        binding.pry
        if Date.strptime(match.har_adm_date, '%m/%d/%Y') == Date.strptime(record.service_from, '%Y-%m-%d') && match.medicare_id == record.hic_num.gsub(/\W/, '')
          all_matches << "#{record.report_type},#{match.pat_name},#{Date.strptime(record.service_from, '%Y-%m-%d')},#{Date.strptime(record.service_thru, '%Y-%m-%d')},#{Date.strptime(record.paid_date, '%Y-%m-%d')},#{record.hic_num.gsub(/\W/, '')},#{record.gross_reimb},#{record.cash_deduct},#{record.blood_deduct},#{record.coins},#{record.net_reimb}"
        end
      end
    end
    # CSV.open("finished.csv", "w") do |csv|
    #  csv << all_matches.each
    # end
  end

    # def self.prep
    #   m = Match.all
    #   medicare_ids = []
    #   adm_dates = []
    #   correct_dates = []
    #   m.each do |x|
    #     medicare_ids << x.medicare_id
    #     adm_dates << x.har_adm_date.gsub(/\s[a-zA-Z]+/, "")
    #     adm_dates.each do |date| 
    #       correct_dates << Date.strptime(date, '%m/%d/%Y')
    #     end
    #   end
    #   r = Record.limit(5000)
    #   hic_nums = []
    #   service_froms = []
    #   corrected = []
    #   r.each do |x|
    #     hic_nums << x.hic_num 
    #     service_froms << x.service_from.gsub(/\s\d+:\d{2}:\d{2}/, "").gsub(/\s[a-zA-Z]+/, "")
    #     service_froms.each do |date|
    #       corrected << Date.strptime(date, '%Y-%m-%d')
    #     end
    #   end
    #   y = hic_nums.zip(corrected)
    #   z = medicare_ids.zip(correct_dates)
    #   binding.pry
    # end
  end
