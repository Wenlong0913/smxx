module CastPinyin
  extend ActiveSupport::Concern
  require 'chinese_pinyin'
  class_methods do
    def cast_pinyin_for(*attrs)
      before_validation -> do
        if attrs.last.is_a?(Hash)
          attr_hash = attrs.pop 
          attr_hash.each do |k, v|
            next if self.send(k).blank?
            full_name = k
            en_name = v.to_sym
            self.send(en_name.to_s+'=', Pinyin.t(self.send(full_name)){ |letters| letters[0].upcase }) if self.send(en_name).blank?
          end
        end
        attrs.each do |attr|
          raise '参数格式传入错误' if attr.is_a?(Hash)
          next if self.send(attr).blank?
          full_name = attr
          en_name = (attr.to_s + '_py').to_sym
          self.send(en_name.to_s+'=', Pinyin.t(self.send(full_name)){ |letters| letters[0].upcase }) if self.send(en_name).blank?
        end
      end
    end
  end
end