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

  helper_method :recent_day

  def gapps_calenders

    if params[:calender_id] == "youroom.sg_hqje4mph22jlsipkqut5ljvll8@group.calendar.google.com"
      @calenders =<<EOF
      <?xml version='1.0' encoding='UTF-8'?><feed xmlns='http://www.w3.org/2005/Atom' xmlns:openSearch='http://a9.com/-/spec/opensearchrss/1.0/' xmlns:gCal='http://schemas.google.com/gCal/2005' xmlns:gd='http://schemas.google.com/g/2005'><id>http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full</id><updated>2010-04-08T07:52:28.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>クラウドビジネス部</title><subtitle type='text'>テスト</subtitle><link rel='alternate' type='text/html' href='http://www.google.com/calendar/embed?src=youroom.sg_hqje4mph22jlsipkqut5ljvll8@group.calendar.google.com'/><link rel='http://schemas.google.com/g/2005#feed' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full'/><link rel='http://schemas.google.com/g/2005#batch' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/batch'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full?max-results=25'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><generator version='1.0' uri='http://www.google.com/calendar'>Google Calendar</generator><openSearch:totalResults>4</openSearch:totalResults><openSearch:startIndex>1</openSearch:startIndex><openSearch:itemsPerPage>25</openSearch:itemsPerPage><gCal:timezone value='Asia/Tokyo'/><gCal:timesCleaned value='0'/><gd:where valueString=''/><entry><id>http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/jkeqs8q1p2ba75jc1gha1471oc</id><published>2010-04-08T07:32:42.000Z</published><updated>2010-04-08T07:32:42.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>SGCWG</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=amtlcXM4cTFwMmJhNzVqYzFnaGExNDcxb2MgeW91cm9vbS5zZ19ocWplNG1waDIyamxzaXBrcXV0NWxqdmxsOEBn' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/jkeqs8q1p2ba75jc1gha1471oc'/><author><name>クラウドビジネス部</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/jkeqs8q1p2ba75jc1gha1471oc/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_hqje4mph22jlsipkqut5ljvll8@group.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='クラウドビジネス部'/><gd:when endTime='2010-04-24T20:00:00.000+09:00' startTime='2010-04-24T10:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='jkeqs8q1p2ba75jc1gha1471oc@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/6vv94b98n5mtq4n7k84kl9ut84</id><published>2010-04-08T07:32:00.000Z</published><updated>2010-04-08T07:32:00.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>クラウドWG</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=NnZ2OTRiOThuNW10cTRuN2s4NGtsOXV0ODQgeW91cm9vbS5zZ19ocWplNG1waDIyamxzaXBrcXV0NWxqdmxsOEBn' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/6vv94b98n5mtq4n7k84kl9ut84'/><author><name>クラウドビジネス部</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/6vv94b98n5mtq4n7k84kl9ut84/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_hqje4mph22jlsipkqut5ljvll8@group.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='クラウドビジネス部'/><gd:when endTime='2010-04-16' startTime='2010-04-15'/><gd:transparency value='http://schemas.google.com/g/2005#event.transparent'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='6vv94b98n5mtq4n7k84kl9ut84@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/ljd8gpvdkvu2b2c01mp3c8jhf0</id><published>2010-04-08T07:31:18.000Z</published><updated>2010-04-08T07:31:18.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>RightScale勉強会</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=bGpkOGdwdmRrdnUyYjJjMDFtcDNjOGpoZjAgeW91cm9vbS5zZ19ocWplNG1waDIyamxzaXBrcXV0NWxqdmxsOEBn' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/ljd8gpvdkvu2b2c01mp3c8jhf0'/><author><name>クラウドビジネス部</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/ljd8gpvdkvu2b2c01mp3c8jhf0/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_hqje4mph22jlsipkqut5ljvll8@group.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='クラウドビジネス部'/><gd:when endTime='2010-04-17T12:00:00.000+09:00' startTime='2010-04-17T10:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='ljd8gpvdkvu2b2c01mp3c8jhf0@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/3nv5kt4m6qkt8cmhvhk1ihk0sc</id><published>2010-04-08T07:30:46.000Z</published><updated>2010-04-08T07:30:46.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>EC2 新規ビジネス案検討会</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=M252NWt0NG02cWt0OGNtaHZoazFpaGswc2MgeW91cm9vbS5zZ19ocWplNG1waDIyamxzaXBrcXV0NWxqdmxsOEBn' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/3nv5kt4m6qkt8cmhvhk1ihk0sc'/><author><name>クラウドビジネス部</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_hqje4mph22jlsipkqut5ljvll8%40group.calendar.google.com/public/full/3nv5kt4m6qkt8cmhvhk1ihk0sc/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_hqje4mph22jlsipkqut5ljvll8@group.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='クラウドビジネス部'/><gd:when endTime='2010-04-10T16:00:00.000+09:00' startTime='2010-04-10T15:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='3nv5kt4m6qkt8cmhvhk1ihk0sc@google.com'/></entry></feed>
EOF
    elsif params[:calender_id] == "youroom.sg_33383233373732372d333533@resource.calendar.google.com"

      @calenders =<<EOF
<?xml version='1.0' encoding='UTF-8'?><feed xmlns='http://www.w3.org/2005/Atom' xmlns:openSearch='http://a9.com/-/spec/opensearchrss/1.0/' xmlns:gCal='http://schemas.google.com/gCal/2005' xmlns:gd='http://schemas.google.com/g/2005'><id>http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full</id><updated>2010-04-08T07:59:05.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>会議室1</title><subtitle type='text'>会議室1</subtitle><link rel='alternate' type='text/html' href='http://www.google.com/calendar/embed?src=youroom.sg_33383233373732372d333533@resource.calendar.google.com'/><link rel='http://schemas.google.com/g/2005#feed' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full'/><link rel='http://schemas.google.com/g/2005#batch' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/batch'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full?max-results=25'/><author><name>会議室1</name></author><generator version='1.0' uri='http://www.google.com/calendar'>Google Calendar</generator><openSearch:totalResults>3</openSearch:totalResults><openSearch:startIndex>1</openSearch:startIndex><openSearch:itemsPerPage>25</openSearch:itemsPerPage><gCal:timezone value='Asia/Tokyo'/><gCal:timesCleaned value='0'/><entry><id>http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/7d372fh73l5r6bn2a3gab6gpag</id><published>2010-04-08T07:37:49.000Z</published><updated>2010-04-08T07:37:49.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>チーム週次報告</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=N2QzNzJmaDczbDVyNmJuMmEzZ2FiNmdwYWcgeW91cm9vbS5zZ18zMzM4MzIzMzM3MzczMjM3MmQzMzM1MzNAcmVzb3VyY2UuY2FsZW5kYXIuZ29vZ2xlLmNvbQ' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/7d372fh73l5r6bn2a3gab6gpag'/><author><name>会議室1</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/7d372fh73l5r6bn2a3gab6gpag/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_33383233373732372d333533@resource.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='会議室1'><gCal:resource value='true'/></gd:who><gd:when endTime='2010-04-15' startTime='2010-04-14'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='7d372fh73l5r6bn2a3gab6gpag@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/tv4s46gf5cdctdq0flmujjbrkg</id><published>2010-04-08T07:36:02.000Z</published><updated>2010-04-08T07:36:03.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>月次報告会</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=dHY0czQ2Z2Y1Y2RjdGRxMGZsbXVqamJya2cgeW91cm9vbS5zZ18zMzM4MzIzMzM3MzczMjM3MmQzMzM1MzNAcmVzb3VyY2UuY2FsZW5kYXIuZ29vZ2xlLmNvbQ' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/tv4s46gf5cdctdq0flmujjbrkg'/><author><name>会議室1</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/tv4s46gf5cdctdq0flmujjbrkg/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_33383233373732372d333533@resource.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='会議室1'><gCal:resource value='true'/></gd:who><gd:when endTime='2010-04-21' startTime='2010-04-20'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='tv4s46gf5cdctdq0flmujjbrkg@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/hgr8rrvm8cspgc7slotvuupaek</id><published>2010-04-07T04:34:54.000Z</published><updated>2010-04-07T04:34:54.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>テスト</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/event?eid=aGdyOHJydm04Y3NwZ2M3c2xvdHZ1dXBhZWsgeW91cm9vbS5zZ18zMzM4MzIzMzM3MzczMjM3MmQzMzM1MzNAcmVzb3VyY2UuY2FsZW5kYXIuZ29vZ2xlLmNvbQ' title='alternate'/><link rel='self' type='application/atom+xml' href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/hgr8rrvm8cspgc7slotvuupaek'/><author><name>会議室1</name></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/youroom.sg_33383233373732372d333533%40resource.calendar.google.com/public/full/hgr8rrvm8cspgc7slotvuupaek/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='youroom.sg_33383233373732372d333533@resource.calendar.google.com' rel='http://schemas.google.com/g/2005#event.organizer' valueString='会議室1'><gCal:resource value='true'/></gd:who><gd:when endTime='2010-04-06T15:00:00.000+09:00' startTime='2010-04-06T14:00:00.000+09:00'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='hgr8rrvm8cspgc7slotvuupaek@google.com'/></entry></feed>
EOF

    else
      @calenders =<<EOF
<?xml version='1.0' encoding='UTF-8'?><feed xmlns='http://www.w3.org/2005/Atom' xmlns:openSearch='http://a9.com/-/spec/opensearchrss/1.0/' xmlns:gCal='http://schemas.google.com/gCal/2005' xmlns:gd='http://schemas.google.com/g/2005'><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full</id><updated>2010-04-07T12:04:08.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>skip_office@youroom.sg</title><subtitle type='text'>skip_office@youroom.sg</subtitle><link rel='alternate' type='text/html' href='http://www.google.com/calendar/embed?src=skip_office@youroom.sg'/><link rel='http://schemas.google.com/g/2005#feed' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full'/><link rel='http://schemas.google.com/g/2005#batch' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/batch'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full?max-results=25'/><author><name>デモユーザSKIP_Office</name><email>skip_office@youroom.sg</email></author><generator version='1.0' uri='http://www.google.com/calendar'>Google Calendar</generator><openSearch:totalResults>5</openSearch:totalResults><openSearch:startIndex>1</openSearch:startIndex><openSearch:itemsPerPage>25</openSearch:itemsPerPage><gCal:timezone value='Asia/Tokyo'/><gCal:timesCleaned value='0'/><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/2ad5bjnsi3ettddbbnr1d26r70</id><published>2010-04-07T11:47:56.000Z</published><updated>2010-04-07T11:47:56.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>[SO] 画面設計</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=MmFkNWJqbnNpM2V0dGRkYmJucjFkMjZyNzAgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/2ad5bjnsi3ettddbbnr1d26r70'/><author><name>skip_office@youroom.sg</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/2ad5bjnsi3ettddbbnr1d26r70/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='skip_office@youroom.sg'/><gd:when endTime='2010-04-14T16:00:00.000+09:00' startTime='2010-04-14T15:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='2ad5bjnsi3ettddbbnr1d26r70@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/25mgs5dd2deit3phshmlovq3rg</id><published>2010-04-07T11:47:06.000Z</published><updated>2010-04-07T11:47:06.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>BIT MTG</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=MjVtZ3M1ZGQyZGVpdDNwaHNobWxvdnEzcmcgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/25mgs5dd2deit3phshmlovq3rg'/><author><name>skip_office@youroom.sg</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/25mgs5dd2deit3phshmlovq3rg/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='skip_office@youroom.sg'/><gd:when endTime='2010-04-14T12:30:00.000+09:00' startTime='2010-04-14T10:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='25mgs5dd2deit3phshmlovq3rg@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/le8slfffs5lfc5o5ndm8sced9g</id><published>0001-12-31T00:00:00.000Z</published><updated>2010-04-07T11:46:46.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>週末打ち上げ</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=bGU4c2xmZmZzNWxmYzVvNW5kbThzY2VkOWdfMjAxMDA0MTZUMTAwMDAwWiBza2lwX29mZmljZUB5b3Vyb29tLnNn' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/le8slfffs5lfc5o5ndm8sced9g'/><author><name>skip_office@youroom.sg</name><email>skip_office@youroom.sg</email></author><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='skip_office@youroom.sg'/><gd:recurrence>DTSTART;TZID=Asia/Tokyo:20100416T190000
DTEND;TZID=Asia/Tokyo:20100416T213000
RRULE:FREQ=WEEKLY;BYDAY=FR;WKST=MO
BEGIN:VTIMEZONE
TZID:Asia/Tokyo
X-LIC-LOCATION:Asia/Tokyo
BEGIN:STANDARD
TZOFFSETFROM:+0900
TZOFFSETTO:+0900
TZNAME:JST
DTSTART:19700101T000000
END:STANDARD
END:VTIMEZONE

</gd:recurrence><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='1'/><gCal:uid value='le8slfffs5lfc5o5ndm8sced9g@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/47aeepvarcsmkd1hdai5q43bnc</id><published>2010-04-07T11:46:07.000Z</published><updated>2010-04-07T11:46:07.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>ガジェット仕様検討</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=NDdhZWVwdmFyY3Nta2QxaGRhaTVxNDNibmMgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/47aeepvarcsmkd1hdai5q43bnc'/><author><name>skip_office@youroom.sg</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/47aeepvarcsmkd1hdai5q43bnc/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString=''/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='skip_office@youroom.sg'/><gd:when endTime='2010-04-09T20:30:00.000+09:00' startTime='2010-04-09T19:30:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='47aeepvarcsmkd1hdai5q43bnc@google.com'/></entry><entry><id>http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/0dcr5k843ht5djn9lv4tr93h6k</id><published>2010-04-07T11:45:26.000Z</published><updated>2010-04-07T11:45:26.000Z</updated><category scheme='http://schemas.google.com/g/2005#kind' term='http://schemas.google.com/g/2005#event'/><title type='text'>[SO] 機能設計</title><content type='text'/><link rel='alternate' type='text/html' href='http://www.google.com/calendar/hosted/youroom.sg/event?eid=MGRjcjVrODQzaHQ1ZGpuOWx2NHRyOTNoNmsgc2tpcF9vZmZpY2VAeW91cm9vbS5zZw' title='alternate'/><link rel='self' type='application/atom+xml' href='https://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/0dcr5k843ht5djn9lv4tr93h6k'/><author><name>skip_office@youroom.sg</name><email>skip_office@youroom.sg</email></author><gd:comments><gd:feedLink href='http://www.google.com/calendar/feeds/skip_office%40youroom.sg/private-e2b2a9b6e61f679baf31d475e4120695/full/0dcr5k843ht5djn9lv4tr93h6k/comments'/></gd:comments><gd:eventStatus value='http://schemas.google.com/g/2005#event.confirmed'/><gd:where valueString='10F'/><gd:who email='skip_office@youroom.sg' rel='http://schemas.google.com/g/2005#event.organizer' valueString='skip_office@youroom.sg'/><gd:when endTime='2010-04-08T12:00:00.000+09:00' startTime='2010-04-08T10:00:00.000+09:00'><gd:reminder method='email' minutes='10'/><gd:reminder method='alert' minutes='10'/></gd:when><gd:transparency value='http://schemas.google.com/g/2005#event.opaque'/><gCal:anyoneCanAddSelf value='false'/><gCal:guestsCanInviteOthers value='true'/><gCal:guestsCanModify value='false'/><gCal:guestsCanSeeGuests value='true'/><gCal:sequence value='0'/><gCal:uid value='0dcr5k843ht5djn9lv4tr93h6k@google.com'/></entry></feed>
EOF
    end
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


private
  def is_user2current_info
    if request_of_infoscoop?
      #is_user = params["is-user"]
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
    10
  end

  def recent_day
    10
  end

end
