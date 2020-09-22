#!/bin/sh

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


JOB=$1

wait_for_abaqus() {
  file="$1.sta"
  tail -f "$file" | grep  --quiet --line-regexp --fixed-strings --max-count=1 --regexp=' THE ANALYSIS HAS NOT BEEN COMPLETED' --regexp=' THE ANALYSIS HAS COMPLETED SUCCESSFULLY'
}

wait_for_abaqus "$JOB"



