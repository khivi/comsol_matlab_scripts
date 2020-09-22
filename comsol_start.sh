#!/bin/bash

  # Copyright (C) 2020 Amit (khivi) Khivesara
  # This program is free software: you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
  # the Free Software Foundation, either version 3 of the License, or
  # (at your option) any later version.

  # This program is distributed in the hope that it will be useful,
  # but WITHOUT ANY WARRANTY; without even the implied warranty of
  # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  # GNU General Public License for more details.

  # You should have received a copy of the GNU General Public License
  # along with this program.  If not, see <https://www.gnu.org/licenses/>.

output=`mktemp`

MPHSERVER_PARAMS='<changeME>'
MATLAB_SCRIPT='<changeME>'

comsol mphserver $MPHSERVER_PARAMS > $output &

RE='(?<=port )\d+'
grep -q -P "$RE"  <(tail -f $output)
PORT=$(grep -m 1 -P -o "$RE" <(cat $output))

matlab -nodisplay -singleCompThread -r "addpath('/usr/local/comsol55/multiphysics/mli'); mphstart('localhost', $PORT); $MATLAB_SCRIPT; exit"
