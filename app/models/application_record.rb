class ApplicationRecord < ActiveRecord::Base
  # 対応するデータベースのテーブルを用意していないため、書く必要がある
  self.abstract_class = true
end
