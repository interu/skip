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

module GadgetsHelper

  def time_of_calender(start_time,end_time)
    shm = start_time.strftime("%H:%M")
    ehm = end_time.strftime("%H:%M")
    if (shm == "00:00" && ehm == "00:00")
      "終日"
    else
      "#{shm}-#{ehm}"
    end
  end

  def date2wday(date)
    case date.wday
    when 0
      "sunday"
    when 6
      "saturday"
    end
  end

  def open_iframe url
    "javascript:IS_Portal.openIframe('#{url}');return false;"
  end

  def site_url
    GlobalInitialSetting['protocol'] + GlobalInitialSetting['host_and_port']
  end
end
