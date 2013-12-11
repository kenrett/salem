class Match < ActiveRecord::Base
  attr_accessible :serv_area_name,:iop,:hsp_account_id,:pat_mrn_id,:pat_name,:medicare_id,:medicaid_id,:account_class,:har_adm_date,:har_disch_date,:prim_enc_csn_id,:dsch_department,:fc_on_transaction,:payor_on_transaction,:payor_on_bucket,:fin_class_name_1,:payor_name_1,:fin_class_name_2,:payor_name_2,:fin_class_name_3,:payor_name_3,:fin_class_name_4,:payor_name_4,:total_selfpay_payments,:total_non_medicare_insurance_pymts,:total_medicare_insurance_pymts,:total_contractual_adj,:balance_primary_coverage,:transaction_type,:write_off_date,:service_date,:tx_comment,:y,:proc_id,:proc_code,:proc_name,:transaction_amount,:x,:bucket_id,:bucket_type,:claim_form

end
