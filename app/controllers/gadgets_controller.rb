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

  def gapps_calenders
    @calenders =<<EOF
<?xml version='1.0' encoding='UTF-8'?><feed xmlns='http://www.w3.org/2005/Atom' xmlns:openSearch='http://a9.com/-/spec/opensearchrss/1.0/' xmlns:gCal='http://schemas.google.com/gCal/2005' xmlns:gd='http://schemas.google.com/g/2005'><id>http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full</id><updated>2010-03-30T01:15:27.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>interu@sonicgarden.jp</title><subtitle type='text'>interu@sonicgarden.jp</subtitle><link rel='alternate' type='text/html' href='http://www.google.com/calendar/embed?src=interu@sonicgarden.jp'/><link rel='http://schemas.google.com/g/2005#feed' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full'/><link rel='http://schemas.google.com/g/2005#batch' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/batch'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full?max-results=25&amp;start-min=2010-03-30T00%3A00%3A00&amp;start-max=2010-04-10T23%3A59%3A59'/><author><name>Teruo Adachi</name><email>interu@sonicgarden.jp</email></author><generator version='1.0' uri='http://www.google.com/calendar'>Google Calendar</generator><openSearch:totalResults>4</openSearch:totalResults><openSearch:startIndex>1</openSearch:startIndex><openSearch:itemsPerPage>25</openSearch:itemsPerPage><gCal:timezone value='Asia/Tokyo'/><gCal:timesCleaned value='0'/><entry><id>http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/7r7hdtgg0it3gss803ef9mmogk</id><published>2010-03-30T01:15:27.000Z</published><updated>2010-03-30T01:15:27.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>私用あり</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=N3I3aGR0Z2cwaXQzZ3NzODAzZWY5bW1vZ2sgaW50ZXJ1QHNvbmljZ2FyZGVuLmpw' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/7r7hdtgg0it3gss803ef9mmogk'/><author><name>Teruo Adachi</name><email>interu@sonicgarden.jp</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/7r7hdtgg0it3gss803ef9mmogk/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='interu@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.organizer' valueString='Teruo Adachi'/><gd:when endTime='2010-04-04' startTime='2010-04-03'/><gd:transparency value='http://schemas.google.com/g/2005#event.transparent'/><gd:visibility value='http://schemas.google.com/g/2005#event.default'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='7r7hdtgg0it3gss803ef9mmogk@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/gop399tm7lq2iorm3d6rjhn8dc</id><published>2010-03-30T01:14:49.000Z</published><updated>2010-03-30T01:15:01.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>SG飲み？</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=Z29wMzk5dG03bHEyaW9ybTNkNnJqaG44ZGMgaW50ZXJ1QHNvbmljZ2FyZGVuLmpw' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/gop399tm7lq2iorm3d6rjhn8dc'/><author><name>Teruo Adachi</name><email>interu@sonicgarden.jp</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/gop399tm7lq2iorm3d6rjhn8dc/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='interu@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.organizer' valueString='Teruo Adachi'/><gd:when endTime='2010-03-31T23:00:00.000+09:00' startTime='2010-03-31T20:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gd:visibility value='http://schemas.google.com/g/2005#event.default'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='gop399tm7lq2iorm3d6rjhn8dc@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/8mra4e7sk157fbr5js0eaq5cis</id><published>2010-03-26T02:57:07.000Z</published><updated>2010-03-29T06:07:08.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>客)SKIP-Live打ち合わせ（with BIT）</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=OG1yYTRlN3NrMTU3ZmJyNWpzMGVhcTVjaXMgaW50ZXJ1QHNvbmljZ2FyZGVuLmpw' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/8mra4e7sk157fbr5js0eaq5cis'/><author><name>Teruo Adachi</name><email>interu@sonicgarden.jp</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/8mra4e7sk157fbr5js0eaq5cis/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='fukuda@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.attendee' valueString='Takahiro Fukuda'><gd:attendeeStatus value='http://schemas.google.com/g/2005#event.invited'/></gd:who><gd:who email='mat_aki@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.attendee' valueString='Akihiro Matsumura'><gd:attendeeStatus value='http://schemas.google.com/g/2005#event.accepted'/></gd:who><gd:who email='interu@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.organizer' valueString='Teruo Adachi'><gd:attendeeStatus value='http://schemas.google.com/g/2005#event.accepted'/></gd:who><gd:who email='kuranuki@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.attendee' valueString='Yoshihito Kuranuki'><gd:attendeeStatus value='http://schemas.google.com/g/2005#event.accepted'/></gd:who><gd:when endTime='2010-03-31T12:00:00.000+09:00' startTime='2010-03-31T10:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.transparent'/><gd:visibility value='http://schemas.google.com/g/2005#event.default'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='1'/><gCal:uid value='8mra4e7sk157fbr5js0eaq5cis@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/_6t0kcd226krk4dpi6gp38e1k8osjae268grkadpl6513eghl84s30c1g60o30c1g60o30c1g60o30c1g60o30c1g60o30c1g60o30c0</id><published>2010-02-08T14:49:18.000Z</published><updated>2010-03-29T06:07:08.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>テニス</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=XzZ0MGtjZDIyNmtyazRkcGk2Z3AzOGUxazhvc2phZTI2OGdya2FkcGw2NTEzZWdobDg0czMwYzFnNjBvMzBjMWc2MG8zMGMxZzYwbzMwYzFnNjBvMzBjMWc2MG8zMGMxZzYwbzMwYzBfMjAxMDAyMDlUMTIwMDAwWiBpbnRlcnVAc29uaWNnYXJkZW4uanA' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/interu%40sonicgarden.jp/private/full/_6t0kcd226krk4dpi6gp38e1k8osjae268grkadpl6513eghl84s30c1g60o30c1g60o30c1g60o30c1g60o30c1g60o30c1g60o30c0'/><author><name>beautybeast07@gmail.com</name><email>beautybeast07@gmail.com</email></author><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where/><gd:who email='interu@sonicgarden.jp' rel='http://schemas.google.com/g/2005#event.organizer' valueString='Teruo Adachi'/><gd:recurrence>DTSTART;TZID=Etc/GMT-9:20100209T210000
DTEND;TZID=Etc/GMT-9:20100209T223000
RRULE:FREQ=WEEKLY;BYDAY=TU
BEGIN:VTIMEZONE
TZID:Etc/GMT-9
X-LIC-LOCATION:Etc/GMT-9
BEGIN:STANDARD
TZOFFSETFROM:+0900
TZOFFSETTO:+0900
TZNAME:TLT
DTSTART:19700101T000000
END:STANDARD
END:VTIMEZONE

</gd:recurrence><gd:when endTime='2010-04-06T22:30:00.000+09:00' startTime='2010-04-06T21:00:00.000+09:00'/><gd:when endTime='2010-03-30T22:30:00.000+09:00' startTime='2010-03-30T21:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gd:visibility value='http://schemas.google.com/g/2005#event.default'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='7AF4B57B7242484F958FD7E751B7B5A800000000000000000000000000000000'/></entry></feed>
EOF

    respond_to do |format|
      format.html
    end
  end

  def gapps_mails
    @mails =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<feed version="0.3" xmlns="http://purl.org/atom/ns#">
<title>Gmail - Inbox for beautybeast07@gmail.com</title>
<tagline>New messages in your Gmail Inbox</tagline>
<fullcount>7</fullcount>
<link rel="alternate" href="http://mail.google.com/mail" type="text/html" />
<modified>2010-03-16T09:21:00Z</modified>
<entry>
<title>［週刊＠ITイベントカレンダー：3月23～29日号］Flash Builder 4やCatalystなどRIA開発者注目のツール紹介</title>
<summary>このメールは＠ITクラブ・メンバーの皆さんがご自身で興味のある分野 ...</summary>
<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=127663042b82ebf2&amp;view=conv&amp;extsrc=atom" type="text/html" />

<modified>2010-03-16T08:56:31Z</modified>
<issued>2010-03-16T08:56:31Z</issued>
<id>tag:gmail.google.com,2004:1330359609495579634</id>
<author>
<name>membership</name>
<email>membership@atmarkit.co.jp</email>
</author>
</entry>
<entry>
<title>豪華付録つきキャス＆話題の極太麺登場！3/15分売れ筋速報【楽天ランキング市場ニュース】(2010/03/16)</title>
<summary>楽天ランキング市場ニュース 2010年3月16日 No.1416 ランキング市場へ 楽天 ...</summary>

<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=127662ee928ca7e3&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-03-16T08:55:02Z</modified>
<issued>2010-03-16T08:55:02Z</issued>
<id>tag:gmail.google.com,2004:1330359516734990307</id>
<author>
<name>楽天ランキング市場ニュース</name>
<email>ranking@emagazine.rakuten.co.jp</email>
</author>
</entry>
<entry>
<title>【4月17日】あなたの人生を変える「話し方」を手に入れませんか？</title>

<summary>日経ビジネスアソシエ スキルアップセミナー ...</summary>
<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=12765d667cb1f5bf&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-03-16T07:18:22Z</modified>
<issued>2010-03-16T07:18:22Z</issued>
<id>tag:gmail.google.com,2004:1330353434694645183</id>
<author>
<name>groupb</name>
<email>groupb@nikkeibp.co.jp</email>
</author>
</entry>
<entry>

<title>50ポイントプレゼント！締め切りまであと7日！【楽天アフィリエイト】(2010/03/16)</title>
<summary>楽天ツールバー】検索で毎日ポイントが貯まる！ Windows XP SP2をご利用で ...</summary>
<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=12765bb4ac00fdbc&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-03-16T06:48:45Z</modified>
<issued>2010-03-16T06:48:45Z</issued>
<id>tag:gmail.google.com,2004:1330351571472547260</id>
<author>
<name>楽天アフィリエイト</name>
<email>affiliate@emagazine.rakuten.co.jp</email>
</author>

</entry>
<entry>
<title>[mixi] サンシャイン牧場 / 桜が咲き誇る季節になりました、緑溢れる自然の中で一… (アプリ更新情報)</title>
<summary>http://mixi.jp ...</summary>
<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=127659538665efe8&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-03-16T06:07:10Z</modified>
<issued>2010-03-16T06:07:10Z</issued>
<id>tag:gmail.google.com,2004:1330348955206545384</id>
<author>
<name>mixi</name>
<email>news@mixi.jp</email>

</author>
</entry>
<entry>
<title>400ポイント付き★サントリー『セサミンEプラス』ゴマのちからを1粒に【楽天カードニュース】(2010/03/16)</title>
<summary>楽天カードニュース 2010/03/16 ...</summary>
<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=127659150fba84a9&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-03-16T06:02:54Z</modified>
<issued>2010-03-16T06:02:54Z</issued>
<id>tag:gmail.google.com,2004:1330348686927627433</id>
<author>
<name>楽天カードニュース</name>

<email>cardnews@enavi.rakuten-kc.co.jp</email>
</author>
</entry>
<entry>
<title>クラウドホワイトペーパー無料プレゼント！[SEMS News 号外 2010-03-16]</title>
<summary>SEMSニュース 号外 (2010.03.16) http://sems.shoeisha.com ...</summary>
<link rel="alternate" href="http://mail.google.com/mail?account_id=beautybeast07%40gmail.com&amp;message_id=127645d41b8b0745&amp;view=conv&amp;extsrc=atom" type="text/html" />
<modified>2010-03-16T24:26:25Z</modified>
<issued>2010-03-16T24:26:25Z</issued>
<id>tag:gmail.google.com,2004:1330327517232039749</id>
<author>

<name>SEMS事務局</name>
<email>sems_support@sems.shoeisha.com</email>
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
      {:title => 'テスト登録', :title_url => 'http://www.google.co.jp', :status => '[重要]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'},
      {:title => 'wiki文書を使用したお知らせ', :title_url => 'http://www.google.co.jp', :status => '[通常]', :from => 'ネクスウェイ', :from_url => 'http://www.google.co.jp'}
    ]

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def skip_recent_users
    @recent_users = current_tenant.users.active.recent(recent_day).order_recent.limit(5) - [current_user]

    respond_to do |format|
      format.html
    end
  end

  def skip_recent_groups
    @recent_groups = current_tenant.groups.active.recent(recent_day).order_recent.limit(5)

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

  #TODO:リファクタ
  def infoscoop_header
    respond_to do |format|
      format.html { render :layout => false }
    end
  end


private
  def recent_day
    10
  end

  def is_user2current_info
    #is_user = params["is-user"]
    is_user = "interu@sonicgarden.jp"

    @current_user = User.find_by_email(is_user)
    @current_tenant = @current_user.tenant
  end

  def per_page
    10
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


end
