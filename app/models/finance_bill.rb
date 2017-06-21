class FinanceBill < ApplicationRecord
  audited
  enum status: {
      open: 0,      # 申请中
      checked: 1,   # 已审核
      cashed: 2,    # 已打款
    }
end
