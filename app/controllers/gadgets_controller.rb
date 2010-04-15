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

    @calenders =<<EOF
    <?xml version='1.0' encoding='UTF-8'?><feed xmlns='http://www.w3.org/2005/Atom' xmlns:openSearch='http://a9.com/-/spec/opensearchrss/1.0/' xmlns:gCal='http://schemas.google.com/gCal/2005' xmlns:gd='http://schemas.google.com/g/2005'><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full</id><updated>2010-04-15T01:47:48.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>skip_office@youroom.sg</title><subtitle type='text'>skip_office@youroom.sg</subtitle><link rel='alternate' type='text/html' href='http://www.google.com/calendar/embed?src=skip_office@youroom.sg'/><link rel='http://schemas.google.com/g/2005#feed' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full'/><link rel='http://schemas.google.com/g/2005#batch' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/batch'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full?max-results=25'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><generator version='1.0' uri='http://www.google.com/calendar'>Google Calendar</generator><openSearch:totalResults>7</openSearch:totalResults><openSearch:startIndex>1</openSearch:startIndex><openSearch:itemsPerPage>25</openSearch:itemsPerPage><gCal:timezone value='Asia/Tokyo'/><gCal:timesCleaned value='0'/><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/schq0oem4m3bqqupags5hii4os</id><published>2010-04-15T01:47:48.000Z</published><updated>2010-04-15T01:47:48.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>避難訓練</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=c2NocTBvZW00bTNicXF1cGFnczVoaWk0b3Mgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/schq0oem4m3bqqupags5hii4os'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/schq0oem4m3bqqupags5hii4os/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-23' startTime='2010-04-22'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.transparent'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='schq0oem4m3bqqupags5hii4os@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/hoqgvhsgsliiehksliiuu7ouo8</id><published>2010-04-15T01:47:29.000Z</published><updated>2010-04-15T01:47:29.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>GAE勉強会</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=aG9xZ3Zoc2dzbGlpZWhrc2xpaXV1N291bzggc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/hoqgvhsgsliiehksliiuu7ouo8'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/hoqgvhsgsliiehksliiuu7ouo8/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-21' startTime='2010-04-20'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.transparent'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='hoqgvhsgsliiehksliiuu7ouo8@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/25mgs5dd2deit3phshmlovq3rg</id><published>2010-04-07T11:47:06.000Z</published><updated>2010-04-15T01:47:04.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>BIT MTG</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=MjVtZ3M1ZGQyZGVpdDNwaHNobWxvdnEzcmcgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/25mgs5dd2deit3phshmlovq3rg'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/25mgs5dd2deit3phshmlovq3rg/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-19T12:30:00.000+09:00' startTime='2010-04-19T10:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='2'/><gCal:uid value='25mgs5dd2deit3phshmlovq3rg@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/2ad5bjnsi3ettddbbnr1d26r70</id><published>2010-04-07T11:47:56.000Z</published><updated>2010-04-15T01:46:49.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>[SO] 画面設計</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=MmFkNWJqbnNpM2V0dGRkYmJucjFkMjZyNzAgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/2ad5bjnsi3ettddbbnr1d26r70'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/2ad5bjnsi3ettddbbnr1d26r70/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-21T16:00:00.000+09:00' startTime='2010-04-21T15:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='2'/><gCal:uid value='2ad5bjnsi3ettddbbnr1d26r70@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/le8slfffs5lfc5o5ndm8sced9g</id><published>0001-12-31T00:00:00.000Z</published><updated>2010-04-15T01:46:36.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>週末打ち上げ</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=bGU4c2xmZmZzNWxmYzVvNW5kbThzY2VkOWcgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/le8slfffs5lfc5o5ndm8sced9g'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/le8slfffs5lfc5o5ndm8sced9g/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-16T21:30:00.000+09:00' startTime='2010-04-16T19:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='2'/><gCal:uid value='le8slfffs5lfc5o5ndm8sced9g@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/47aeepvarcsmkd1hdai5q43bnc</id><published>2010-04-07T11:46:07.000Z</published><updated>2010-04-14T10:17:57.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>ガジェット仕様検討</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=NDdhZWVwdmFyY3Nta2QxaGRhaTVxNDNibmMgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/47aeepvarcsmkd1hdai5q43bnc'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/47aeepvarcsmkd1hdai5q43bnc/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-21T20:30:00.000+09:00' startTime='2010-04-21T19:30:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='1'/><gCal:uid value='47aeepvarcsmkd1hdai5q43bnc@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/pkpn49ghbrmk82eakt2jea7j6s</id><published>2010-04-08T07:34:19.000Z</published><updated>2010-04-08T07:34:19.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>WG検討MTG</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=cGtwbjQ5Z2hicm1rODJlYWt0MmplYTdqNnMgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/pkpn49ghbrmk82eakt2jea7j6s'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/pkpn49ghbrmk82eakt2jea7j6s/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='デモユーザSKIP_Office'/><gd:when endTime='2010-04-16T15:00:00.000+09:00' startTime='2010-04-16T14:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='pkpn49ghbrmk82eakt2jea7j6s@google.com'/></entry></feed>
EOF
    respond_to do |format|
      format.html
    end
  end

  def gapps_mails
    @mails =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<feed version="0.3" xmlns="http://purl.org/atom/ns#">
<title>Gmail - Inbox for skip_office@youroom.sg</title>
<tagline>New messages in your Gmail Inbox</tagline>
<fullcount>3</fullcount>
<link rel="alternate" href="http://mail.google.com/a/youroom.sg" type="text/html" />
<modified>2010-04-07T12:12:04Z</modified>
<entry>
<title>色やテーマを使って Gmail のデザインを自由に設定</title>
<summary>設定] の [テーマ] タブから、色やテーマを指定して受信トレイをより ...</summary>
<link rel="alternate" href="http://mail.google.com/a/youroom.sg?account_id=skip_office%40youroom.sg&amp;message_id=127d8156af352cdd&amp;view=conv&amp;extsrc=atom" type="text/html" />

<modified>2010-04-07T11:43:54Z</modified>
<issued>2010-04-07T11:43:54Z</issued>
<id>tag:gmail.google.com,2004:1332363274078203101</id>
<author>
<name>Gmail チーム</name>
<email>mail-noreply@google.com</email>
</author>
</entry>
<entry>
<title>携帯電話で Gmail にアクセス</title>
<summary>外出先でちょっとした空き時間でもケータイから Gmail を使ってメールを ...</summary>

<link rel="alternate" href="http://mail.google.com/a/youroom.sg?account_id=skip_office%40youroom.sg&amp;message_id=127d8156a691a0c9&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-04-07T11:43:54Z</modified>
<issued>2010-04-07T11:43:54Z</issued>
<id>tag:gmail.google.com,2004:1332363273933267145</id>
<author>
<name>Gmail チーム</name>
<email>mail-noreply@google.com</email>
</author>
</entry>
<entry>
<title>Gmail の使用を開始する</title>

<summary>Gmail ならメールがもっと便利に、もっと楽しくなります。 フォルダに ...</summary>
<link rel="alternate" href="http://mail.google.com/a/youroom.sg?account_id=skip_office%40youroom.sg&amp;message_id=127d81569a181f95&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-04-07T11:43:54Z</modified>
<issued>2010-04-07T11:43:54Z</issued>
<id>tag:gmail.google.com,2004:1332363273723977621</id>
<author>
<name>Gmail チーム</name>
<email>mail-noreply@google.com</email>
</author>
</entry>
</feed>

EOF

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

  def tenpo_notices
    @entries = [
      {:title => 'テスト登録', :title_url => 'https://demo2.tempomatic.jp/h2/STRViewNotice.do?noticeId=15&version=0', :status => '[重要]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'},
      {:title => 'wiki文書を使用したお知らせ', :title_url => 'https://demo2.tempomatic.jp/h2/STRViewNotice.do?noticeId=13&version=0', :status => '[通常]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'}
    ]

    respond_to do |format|
      format.html
    end
  end

  def skip_notices
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
    # TODO: モック tenantやuserからロールを判定して返すように
    render :json => { :role => "gapps" }
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
    @mails =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<feed version="0.3" xmlns="http://purl.org/atom/ns#">
<title>Gmail - Inbox for skip_office@youroom.sg</title>
<tagline>New messages in your Gmail Inbox</tagline>
<fullcount>3</fullcount>
<link rel="alternate" href="http://mail.google.com/a/youroom.sg" type="text/html" />
<modified>2010-04-07T12:12:04Z</modified>
<entry>
<title>色やテーマを使って Gmail のデザインを自由に設定</title>
<summary>設定] の [テーマ] タブから、色やテーマを指定して受信トレイをより ...</summary>
<link rel="alternate" href="http://mail.google.com/a/youroom.sg?account_id=skip_office%40youroom.sg&amp;message_id=127d8156af352cdd&amp;view=conv&amp;extsrc=atom" type="text/html" />

<modified>2010-04-07T11:43:54Z</modified>
<issued>2010-04-07T11:43:54Z</issued>
<id>tag:gmail.google.com,2004:1332363274078203101</id>
<author>
<name>Gmail チーム</name>
<email>mail-noreply@google.com</email>
</author>
</entry>
<entry>
<title>携帯電話で Gmail にアクセス</title>
<summary>外出先でちょっとした空き時間でもケータイから Gmail を使ってメールを ...</summary>

<link rel="alternate" href="http://mail.google.com/a/youroom.sg?account_id=skip_office%40youroom.sg&amp;message_id=127d8156a691a0c9&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-04-07T11:43:54Z</modified>
<issued>2010-04-07T11:43:54Z</issued>
<id>tag:gmail.google.com,2004:1332363273933267145</id>
<author>
<name>Gmail チーム</name>
<email>mail-noreply@google.com</email>
</author>
</entry>
<entry>
<title>Gmail の使用を開始する</title>

<summary>Gmail ならメールがもっと便利に、もっと楽しくなります。 フォルダに ...</summary>
<link rel="alternate" href="http://mail.google.com/a/youroom.sg?account_id=skip_office%40youroom.sg&amp;message_id=127d81569a181f95&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-04-07T11:43:54Z</modified>
<issued>2010-04-07T11:43:54Z</issued>
<id>tag:gmail.google.com,2004:1332363273723977621</id>
<author>
<name>Gmail チーム</name>
<email>mail-noreply@google.com</email>
</author>
</entry>
</feed>
EOF
    @entries = [
      {:title => 'テスト登録', :title_url => 'https://demo2.tempomatic.jp/h2/STRViewNotice.do?noticeId=15&version=0', :status => '[重要]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'},
      {:title => 'wiki文書を使用したお知らせ', :title_url => 'https://demo2.tempomatic.jp/h2/STRViewNotice.do?noticeId=13&version=0', :status => '[通常]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'}
    ]

  end

  def leftside_menus 

    @external_links = [
      {:title => "勤怠管理", :url => "#"},
      {:title => "業務マニュアル", :url => "#"},
      {:title => "営業資料", :url => "#"},
    ]
    @action_links = [
      {:title => "メールを書く", :url => "https://mail.google.com/a/#{gapps_domain}/"},
      {:title => "スケジュールを見る", :url => "https://www.google.com/calendar/hosted/#{gapps_domain}/render"},
      {:title => "スケジュールを入力する", :url => "http://www.google.com/calendar/hosted/#{gapps_domain}/event?action=TEMPLATE&text="},
      {:title => "業務報告", :url => "#"},
      {:title => "質問を書く", :url => new_polymorphic_url([current_tenant, current_user, :board_entry], :board_entry => {:aim_type => 'question'})},
      {:title => "ブログを書く", :url => new_polymorphic_url([current_tenant, current_user, :board_entry])},
    ]
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

end
