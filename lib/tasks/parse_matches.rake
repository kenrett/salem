require 'csv'

namespace:db do
  desc "Pass a CSV of matches to create respective entries in the database"
  task :parse_matches, [:filename] => :environment do |t, args|
    CSV.foreach(args.filename, headers: true, header_converters: :symbol) do |row|
      print "."
        # binding.pry
        x = Match.new(
          serv_area_name:       row[:serv_area_name],
          iop:                  row[:iop],
          hsp_account_id:       row[:hsp_account_id],
          pat_mrn_id:           row[:pat_mrn_id],
          pat_name:             row[:pat_name],
          medicaid_id:          row[:medicaid_id],
          account_class:        row[:account_class],
          har_adm_date:         row[:har_adm_date],
          har_disch_date:       row[:har_disch_date],
          prim_enc_csn_id:      row[:prim_enc_csn_id],
          dsch_department:      row[:dsch_department],
          fc_on_transaction:    row[:fc_on_transaction],
          payor_on_transaction: row[:payor_on_transaction],
          payor_on_bucket:      row[:payor_on_bucket],
          fin_class_name_1:     row[:fin_class_name_1],
          payor_name_1:         row[:payor_name_1],
          fin_class_name_2:     row[:fin_class_name_2],
          payor_name_2:         row[:payor_name_2],
          fin_class_name_3:     row[:fin_class_name_3],
          payor_name_3:         row[:payor_name_3],
          fin_class_name_4:     row[:fin_class_name_4],
          payor_name_4:         row[:payor_name_4],
          total_selfpay_payments:             row[:total_selfpay_payments],
          total_non_medicare_insurance_pymts: row[:total_non_medicare_insurance_pymts],
          total_medicare_insurance_pymts:     row[:total_medicare_insurance_pymts],
          total_contractual_adj:              row[:total_contractual_adj],
          balance_primary_coverage:           row[:balance_primary_coverage],
          transaction_type:     row[:transaction_type],
          write_off_date:       row[:write_off_date],
          service_date:         row[:service_date],
          tx_comment:           row[:tx_comment],
          y:                    row[:y],
          proc_id:              row[:proc_id],
          proc_code:            row[:proc_code],
          proc_name:            row[:proc_name],
          transaction_amount:   row[:transaction_amount],
          x:                    row[:x],
          bucket_id:            row[:bucket_id],
          bucket_type:          row[:bucket_type],
          claim_form:           row[:claim_form]
          )
        x.save!
        end
    end
end