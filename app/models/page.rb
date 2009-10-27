class Page < ActiveRecord::Base
  acts_as_tree

  attr_reader :new_history

  has_many :histories, :order => "histories.revision DESC"
  validates_associated :new_history, :if => :new_history, :on => :create
  validates_presence_of :content, :on => :create
  validates_inclusion_of :format_type, :in => %w[hiki html]

  after_save :reset_history_caches

  named_scope :fulltext, proc{|keyword|
    hids = History.find_all_by_head_content(keyword).map(&:page_id)
    if hids.empty?
      { :conditions => "1 = 2" } # force false
    else
      { :conditions => ["#{quoted_table_name}.id IN (?)", hids] }
    end
  }

  named_scope :admin_fulltext, proc{|keyword|
    return {} if keyword.blank?
    w = "%#{keyword}%"

    hids = History.find_all_by_head_content(keyword).map(&:page_id)
    if hids.empty?
      { :conditions => ["#{quoted_table_name}.display_name LIKE ?", w] } # force false
    else
      { :conditions => ["#{quoted_table_name}.id IN (?) OR #{quoted_table_name}.display_name LIKE ?", hids, w] }
    end
  }

  def content(revision=nil)
    if revision.nil?
      (history = @new_history || head) ? history.content.data : ""
    else
      histories.detect{|h| h.revision ==revision.to_i }.content.data
    end
  end

  def head
    histories.first
  end

  def edit(content, user)
    return if content == self.content
    self.updated_at = Time.now.utc
    @new_history = histories.build(:content => Content.new(:data=>content),
                                   :user => user,
                                   :revision => revision.succ)
  end

  def revision
    new_record? ? 0 :(@revision ||= load_revision)
  end

  private
  def reset_history_caches
    @revision = @new_history = nil
  end

  def load_revision
    histories.maximum(:revision) || 0
  end

end