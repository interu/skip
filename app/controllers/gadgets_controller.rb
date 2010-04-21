# SKIP(Social Knowledge & Innovation Platform)
# Copyright (C) 2008-2010 TIS Inc.
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

class GadgetsController < ApplicationController
  layout 'gadget'
  protect_from_forgery :only => []
  skip_before_filter :valid_tenant_required, :sso, :login_required, :prepare_session
  before_filter :is_user2current_info


  helper_method :recent_day, :gapps_domain, :site_url

  def gapps_calenders
    oauth_gapps("calender")
    respond_to do |format|
      format.html
    end
  end

  def gapps_mails
    oauth_gapps("mail") 
    respond_to do |format|
      format.html
    end
  end

  def skip_questions
    # TODO:要改修
    @questions = {
      :id_name => 'questions',
      :title_icon => "user_comment",
      :title_name => _('Recent Questions'),
      :pages => BoardEntry.from_recents.question.visible.accessible(current_user).order_new.scoped(:include => [:state, :user]),
      :recent_day => recent_day
    }

    respond_to do |format|
      format.html
    end
  end

  def skip_recents
    @recent_users = {
      :id_name => "recent_users",
      :pages => (current_tenant.users.active.recent(recent_day).order_recent.limit(5) - [current_user]).paginate(:page => target_page("recent_users"), :per_page => per_page),
      :per_page => per_page
    }

    @recent_groups = {
      :id_name => "recent_groups",
      :pages => current_tenant.groups.active.recent(recent_day).order_recent.limit(5).paginate(:page => target_page("recent_groups"), :per_page => per_page),
      :per_page => per_page
    }

    respond_to do |format|
      format.html
    end
  end

  def skip_popular_blogs
    @popular_blogs = {
      :title_name => _('Recent Popular Blogs'),
      :per_page => per_page,
      :pages => BoardEntry.accessible(current_user).scoped(
                  :order => "board_entry_points.access_count DESC, board_entries.last_updated DESC, board_entries.id DESC",
                  :include => [ :user, :state ]
                ).timeline.diary.recent(recent_day.day).paginate(:page => params[:page], :per_page => per_page)
    }
  end

  #TODO:リファクタ
  def infoscoop_header
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def user_role
    # TODO: モック 返す値は仮の値
    tenant = current_user.tenant

    render :json => { :tenant => tenant.id, :type => (tenant.type), :role => current_user.admin? ? "admin" : "user" }
  end

  def skip_publicated_entries_flat
@timelines = {
      :id_name => 'timelines',
      :title_name => _('See all'),
      :per_page => per_page,
      :pages => BoardEntry.from_recents.accessible(current_user).timeline.order_new.scoped(:include => [:state, :user]).paginate(:page => target_page('timelines'), :per_page => per_page)
}
@recent_blogs = {
    :id_name => 'recent_blogs',
    :title_icon => "user",
    :title_name => _('Blogs'),
    :pages => BoardEntry.from_recents.accessible(current_user).entry_type_is(BoardEntry::DIARY).timeline.scoped(:include => [ :user, :state ]).order_new.paginate(:page => target_page('recent_blogs'), :per_page => per_page),
    :per_page => per_page
  }
@recent_bbs = recent_bbs
  end

  def notices
    oauth_gapps("mail")

    @entries = [
      {:title => 'テスト登録', :title_url => 'https://demo2.tempomatic.jp/h2/STRViewNotice.do?noticeId=15&version=0', :status => '[重要]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'},
      {:title => 'wiki文書を使用したお知らせ', :title_url => 'https://demo2.tempomatic.jp/h2/STRViewNotice.do?noticeId=13&version=0', :status => '[通常]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'}
    ]
    #@antennas = BoardEntry.accessible(@current_user).unread(@current_user)
  end

  def leftside_menus

    @external_links = [
      {:title => "勤怠管理", :url => "#", :abst => '出社/退社時に入力してください。'},
      {:title => "業務マニュアル", :url => "#", :abst => '業務で利用するツールの使い方等のマニュアルがまとまっています。'},
      {:title => "営業資料", :url => "#", :abst => '部門別営業資料がまとめて格納されています。'},
    ]
    @action_links = [
      {:title => "メールを書く", :url => "https://mail.google.com/a/#{gapps_domain}/"},
      {:title => "カレンダーを見る", :url => "https://www.google.com/calendar/hosted/#{gapps_domain}/render"},
      {:title => "カレンダーに入力する", :url => "http://www.google.com/calendar/hosted/#{gapps_domain}/event?action=TEMPLATE&text="},
      {:title => "業務報告", :url => "#"},
      {:title => "質問を書く", :url => new_polymorphic_url([current_tenant, current_user, :board_entry], :board_entry => {:aim_type => 'question'})},
      {:title => "ブログを書く", :url => new_polymorphic_url([current_tenant, current_user, :board_entry])},
    ]
  end

  def skip_joined_groups
    @groups = current_user.groups.active.order_active.limit(5)
  end

private
  def is_user2current_info
    if request_of_infoscoop?
      #is_user = params["is-user"] || request.headers["is-user"]
      #@current_user = User.find_by_openid_identifier(is_user)
      is_user = "interu@sonicgarden.jp"
      @current_user = User.find_by_email(is_user)

      @current_tenant = @current_user.tenant
    else
      render :text => "不正なリクエストと認識しました。リクエストの改ざん等を行っていない際にこの画面が表示された場合は、こちらまでご連絡ください。"
    end
  end

  def request_of_infoscoop?
    if GlobalInitialSetting['infoscoop_addr']
      GlobalInitialSetting['infoscoop_addr'].include?(request.remote_addr)
    else
      logger.info "GlobalInitialSetting['infoscoop_addr'] is nil"
      false
    end
  end

  def target_page target = nil
    if target
      target_key2current_pages = cookies[:target_key2current_pages]
      if target_key2current_pages.blank?
        params[:page]
      else
        params[:page] || JSON.parse(target_key2current_pages)[target] || 1
      end
    else
      params[:page]
    end
  end

  def per_page
    5
  end

  def recent_day
    10
  end

  def site_url
    GlobalInitialSetting['protocol'] + GlobalInitialSetting['host_and_port']
  end

  def gapps_domain
    "youroom.sg"
  end

  ### for flat
    def recent_bbs
    recent_bbs = []
    gid_by_category = Group.gid_by_category
    current_tenant.group_categories.ascend_by_sort_order.each do |category|
      options = { :group_symbols => gid_by_category[category.id], :per_page => per_page }
      recent_bbs << find_recent_bbs_as_locals(category.code.downcase, options)
    end
    recent_bbs
  end
  def find_recent_bbs_as_locals code, options = {}
    category = current_tenant.group_categories.find_by_code(code)
    id_name = category.code.downcase
    pages = BoardEntry.from_recents.accessible(current_user).entry_type_is(BoardEntry::GROUP_BBS).timeline.scoped(:include => [ :user, :state ]).order_new.paginate(:page => target_page(id_name), :per_page => per_page)

    locals = {
      :id_name => id_name,
      :title_icon => "group",
      :title_name => category.name,
      :per_page => per_page,
      :pages => pages
    }
  end


  def oauth_gapps app_name
    require 'oauth'
    if current_tenant.oauth_token
      current_tenant.oauth_token.key = @consumer_key
      current_tenant.oauth_token.secret = @consumer_secret
    end

    access_url = case app_name
    when "mail"
      "https://mail.google.com/a/#{gapps_domain}/feed/atom?xoauth_requestor_id=#{current_user.email}"
    when "calender"
      "https://www.google.com/calendar/feeds/default/private/full?xoauth_requestor_id=#{current_user.email}"
    end

    oauth_consumer = OAuth::Consumer.new(
       @consumer_key,
       @consumer_secret,
       {
         :site => "https://www.google.com",
         :scheme => :header,
         :http_method => :post,
         :request_token_path => "/accounts/OAuthGetRequestToken",
         :access_token_path  => "/accounts/OAuthGetAccessToken",
         :authorize_path     => "/accounts/OAuthAuthorizeToken"
       }
    )

    access_token = OAuth::AccessToken.new oauth_consumer
    response = access_token.get(access_url)
    case response
    when Net::HTTPSuccess
      @contents = feed2array(response.body)
    when Net::HTTPRedirection
      response = access_token.get(response['Location'])
      @contents = feed2array(response.body)
    else
      RAILS_DEFAULT_LOGGER.error "Failed to get user info via OAuth"
      flash[:notice] = "Authentication failed"
      redirect_to :action => :index
      return
    end
  end

  def feed2array xml
    REXML::Document.new(xml).elements.to_a('//feed/entry')
  end
end
