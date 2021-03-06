#!/bin/bash

# Copyright (C) 2017   Pablo Iranzo Gómez (Pablo.Iranzo@redhat.com)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# this can run against live or snapshot mode

if [ ! "x$CITELLUS_LIVE" = "x" ]; then 
  if [ -f $CITELLUS_ROOT/var/log/mysqld.log ] ;
  then
    grep "WSREP: Found saved state"  ${CITELLUS_ROOT}/var/log/mysqld.log |tail -1|awk '{print $8}' >&2
    exit $RC_OKAY
  else
    exit $RC_SKIPPED
  fi
fi
