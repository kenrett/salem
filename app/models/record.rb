class Record < ActiveRecord::Base
  attr_accessible :provider_id, :provider_name, :provider_fye, :report_type, :report_num, :paid_from, :paid_to, :report_run_date, :service_period_num, :service_period_from, :service_period_thru, :service_from, :service_thru, :patient_name, :patient_control_num, :med_record_num, :hic_num, :receipt_date, :paid_date, :dcn, :bill_freq, :trans_type, :pricer_rtn_cd, :processor_id, :zip_code, :esrd_condition_code, :weight, :height, :birth_date, :claim_num, :rev_code, :description, :hcpcs, :panel_code, :trip_mile_ind, :units, :charges, :gross_fee_amt, :gross_reimb, :gapc, :outlier, :deductibles, :cash_deduct, :blood_deduct, :coins, :msp, :med_days, :esrd_rdctn_ntwk_payments, :msp_recon, :other_adjs, :line_item_reimb, :elected_coins, :mods, :service_ind, :pymt_ind, :dscnt_fct, :tob_incl, :apc, :undup_days, :hours, :gross_fee_reimb, :stndrd_ovrhd_amount, :tot_gross_fee_sched, :psr_report, :net_reimb, :msp_cash_deduct, :msp_blood_deduct, :msp_deductibles, :msp_coins, :patient_cbsa, :claim_interest, :claim_report_splits, :low_volume, :rebilling_adjustment

  def description
    "#{report_type}, #{patient_name}, " + parse_time(service_from) + ", " + parse_time(service_thru) + ", " + parse_time(paid_date) + ", " + parse_quotes(hic_num) + ", #{gross_reimb}, #{cash_deduct}, #{blood_deduct}, #{coins}, #{net_reimb}" 
  end

  def parse_time(col)
    col.gsub(/(\d{4})(.+)/, '\1')
  end

  def parse_quotes(col)
    col.gsub(/\D/, "")
  end
end
