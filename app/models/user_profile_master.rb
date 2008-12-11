# SKIP(Social Knowledge & Innovation Platform)
# Copyright (C) 2008 TIS Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

class UserProfileMaster < ActiveRecord::Base
  N_('UserProfileMaster|Input type|text_field')
  N_('UserProfileMaster|Input type|number_and_hyphen_only')
  N_('UserProfileMaster|Input type|rich_text')
  N_('UserProfileMaster|Input type|radio')
  N_('UserProfileMaster|Input type|year_select')
  N_('UserProfileMaster|Input type|select')
  N_('UserProfileMaster|Input type|appendable_select')
  N_('UserProfileMaster|Input type|check_box')
  N_('UserProfileMaster|Input type|prefecture_select')
  N_('UserProfileMaster|Input type|datepicker')

  N_('UserProfileMaster|Required|true')
  N_('UserProfileMaster|Required|false')

  has_many :user_profile_values, :dependent => :destroy
  belongs_to :user_profile_master_category

  validates_presence_of :name
  validates_presence_of :input_type
  validates_presence_of :sort_order
  validates_presence_of :user_profile_master_category_id

  class << self
    def find_with_order_by_sort_order(*args)
      with_scope(:find => { :order => "user_profile_masters.sort_order" } ) do
        find_without_order_by_sort_order(*args)
      end
    end
    alias_method_chain :find, :order_by_sort_order
  end

  def validate
    valid_presence_of_category
  end

  def input_type_processer
    input_type_class_hash[self.input_type].new
  end

  def option_array
    option_values.split(',') if option_values
  end

  def option_array_with_blank
    required ? option_array : option_array.unshift("")
  end

  def self.input_type_option
    input_type_class_hash.keys.map{|key| [_("UserProfileMaster|Input type|#{key}"), key]}
  end

  def self.input_type_class_hash
    h = Hash.new(InputTypeProcesser.freeze)
    h.merge({ 'text_field'             => TextFieldProcesser,
              'number_and_hyphen_only' => NumberAndHyphenOnlyProcesser,
              'rich_text'              => RichTextProcesser,
              'radio'                  => RadioProcesser,
              'year_select'            => YearSelectProcesser,
              'select'                 => SelectProcesser,
              'appendable_select'      => AppendableSelectProcesser,
              'check_box'              => CheckBoxProcesser,
              'prefecture_select'      => PrefectureSelectProcesser,
              'datepicker'             => DatePickerProcesser })
  end
  private
  def input_type_class_hash
    self.class.input_type_class_hash
  end

  def valid_presence_of_category
    unless category = UserProfileMasterCategory.find_by_id(self.user_profile_master_category_id)
      errors.add(:user_profile_master_category_id, _('プロフィールカテゴリに存在しない値です。'))
      return false
    end
    true
  end

  class InputTypeProcesser
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
    include GetText
    bindtextdomain 'skip'

    def to_show_html(value)
      value_str = value ? value.value : ""
      content_tag(:div, h(value_str), :class => "input_value") + content_tag(:div, nil, :class => "input_bottom")
    end

    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      text_field_tag("profile_value[#{master.id}]", h(value_str))
    end

    def validate(master, value)
      value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name }) if master.required and value.value.blank?
    end

    def option_value_validate(master, value)
      value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name }) if master.required and value.value.blank?
      value.errors.add_to_base(_("%{name} は選択される値以外のものが設定されています") % { :name => master.name }) unless master.option_array_with_blank.include?(value.value)
    end
  end

  class TextFieldProcesser < InputTypeProcesser
  end

  class NumberAndHyphenOnlyProcesser < InputTypeProcesser
    def validate(master, value)
      value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name }) if master.required and value.value.blank?
      value.errors.add_to_base(_("%{name} は数字かハイフンで入力してください") % { :name => master.name }) unless value.value =~ /^[0-9\-]*$/
    end
  end

  class RadioProcesser < InputTypeProcesser
    alias :validate :option_value_validate

    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      str = master.option_array.inject("") do |result, val|
        result << radio_button_tag("profile_value[#{master.id}]", val, val == value_str) + label_tag("profile_value_#{master.id}_#{val}", val)
      end
      str << content_tag(:a, _("uncheck selected"), :target => "profile_value[#{master.id}]", :class => "cancel_radio") unless master.required
      str
    end
  end

  class RichTextProcesser < InputTypeProcesser
    include ActionController::UrlWriter
    include ApplicationHelper
    include ActionView::Helpers::SanitizeHelper

    def to_show_html(value)
      value_str = value ? value.value : ""
      symbol = value ? value.user.symbol : nil
      content_tag(:div, render_richtext(value_str, symbol), :class => "input_value rich_value")
    end

    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      text_area_tag("profile_value[#{master.id}]", value_str, :class => "invisible min_fckeditor")
    end
  end

  class YearSelectProcesser < InputTypeProcesser
    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      select_tag("profile_value[#{master.id}]", options_for_select(years(master), value_str))
    end

    def validate(master, value)
      if master.required and value.value.blank?
        value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name })
        return
      end
      value.errors.add_to_base(_("%{name} は4桁の数値で入力して下さい") % { :name => master.name }) unless years(master).include?(value.value)
    end

    private
    def years(master)
      options = (min_year(master)..max_year(master)).to_a
      master.required ? options : [''] + options
    end

    def min_year(master)
      max_year_and_min_year(master.option_values).first
    end

    def max_year(master)
      max_year_and_min_year(master.option_values).last
    end

    def max_year_and_min_year value
      default_min_year = Time.now.year.to_s
      default_max_year = Time.now.year.to_s
      unless value.blank?
        min_year_and_max_year = value.split('-')
        if min_year_and_max_year.size == 1
          min_year = min_year_and_max_year.first
          max_year = min_year < default_max_year ? default_max_year : min_year
          [min_year, max_year]
        elsif min_year_and_max_year.size > 1
          min_year = min_year_and_max_year.first
          max_year = min_year < min_year_and_max_year[1] ? min_year_and_max_year[1] : min_year
          [min_year, max_year]
        end
      else
        [default_min_year, default_max_year]
      end
    end
  end

  class SelectProcesser < InputTypeProcesser
    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      select_tag("profile_value[#{master.id}]", options_for_select(master.option_array_with_blank, value_str))
    end

    alias :validate :option_value_validate
  end

  class AppendableSelectProcesser < InputTypeProcesser
    include ActionView::Helpers::CaptureHelper

    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      result = ""
      result << content_tag(:p) do
        select_tag("profile_value[#{master.id}]", options_for_select(registrated_select_option(master), value_str)) + _("既に登録されている値から選択項目を表示しています")
      end unless registrated_select_option(master).blank?
      result << content_tag(:p) do
        text_field_tag("profile_value[#{master.id}]", (registrated_select_option(master).include?(value_str) ? "" : value_str), :class => "appendable_text") + _('選択項目に無いものを設定する場合はこちらに入力してください')
      end
    end

    private
    def registrated_select_option(master)
      result = master.user_profile_values.find(:all, :select => "count(*) as count, value", :group => "value", :order => "count DESC").map(&:value) || []
      master.required ? result - [""] : result.unshift("").uniq
    end
  end

  class CheckBoxProcesser < InputTypeProcesser
    def to_edit_html(master, value)
      value_arr = value ? value.value : []
      value_arr = value_arr.split(',') if value_arr.is_a?(String)
      master.option_array.inject("") do |result, val|
        result << check_box_tag("profile_value[#{master.id}][]", val, value_arr.include?(val), :id => "profile_value_#{master.id}_#{val}") + label_tag("profile_value_#{master.id}_#{val}", val)
      end
    end

    def validate(master, value)
      value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name }) if master.required and value.value.blank?
      unless value.value.blank? or value.value.is_a?(Array)
        value.errors.add_to_base(_("%{name} に不正な形式が設定されています") % {:name => master.name})
      else
        value_arr = value.value.blank? ? [] : value.value
        if (value_arr - master.option_array).size > 0
          value.errors.add_to_base(_("%{name} は選択される値以外のものが設定されています") % { :name => master.name })
        end
        value.value = value_arr.join(',') if value_arr.is_a?(Array)
      end
    end
  end

  class PrefectureSelectProcesser < InputTypeProcesser
    PREFECTURES = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"].freeze
    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      select_tag("profile_value[#{master.id}]", options_for_select(prefectures(master), value_str))
    end

    def validate(master, value)
      if master.required and value.value.blank?
        value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name })
        return
      end
      value.errors.add_to_base(_("%{name} は選択される値以外のものが設定されています") % { :name => master.name }) unless prefectures(master).include?(value.value)
    end

    private
    def prefectures(master)
      options = master.required ? PREFECTURES : [''] + PREFECTURES
    end
  end

  class DatePickerProcesser < InputTypeProcesser
    def to_edit_html(master, value)
      value_str = value ? value.value : ""
      text_field_tag("profile_value[#{master.id}]", h(value_str), :class => "datepicker", :id => "datepicker_#{master.id}")
    end

    def validate(master, value)
      value.errors.add_to_base(_("%{name} は必須です") % { :name => master.name }) if master.required and value.value.blank?
      begin
        value.value = Date.parse(value.value).strftime('%Y/%m/%d') unless value.value.blank?
      rescue ArgumentError => e
        value.errors.add_to_base(_("%{name} は正しい日付形式で入力して下さい") % { :name => master.name })
      end
    end
  end
end