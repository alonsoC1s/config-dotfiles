" Copyright (C) 2020 Ling CHU <meetchuling@gmail.com>
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <https://www.gnu.org/licenses/>.

let s:colors = ci_dark#get_colors()

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

let s:p.normal.left = [[s:colors.background, s:colors.cyan], [s:colors.foreground, s:colors.win_bg]]
let s:p.normal.right = [[s:colors.background, s:colors.cyan], [s:colors.foreground, s:colors.win_bg]]
let s:p.normal.middle = [[s:colors.foreground, s:colors.background_lighter]]
let s:p.normal.error = [[s:colors.background, s:colors.red]]
let s:p.normal.warning = [[s:colors.background, s:colors.yellow]]

let s:p.insert.left = [[s:colors.background, s:colors.green], [s:colors.foreground, s:colors.win_bg]]
let s:p.insert.right = [[s:colors.background, s:colors.green], [s:colors.foreground, s:colors.win_bg]]

let s:p.replace.left = [[s:colors.background, s:colors.red], [s:colors.foreground, s:colors.win_bg]]
let s:p.replace.right = [[s:colors.background, s:colors.red], [s:colors.foreground, s:colors.win_bg]]

let s:p.visual.left = [[s:colors.background, s:colors.yellow], [s:colors.foreground, s:colors.win_bg]]
let s:p.visual.right = [[s:colors.background, s:colors.yellow], [s:colors.foreground, s:colors.win_bg]]

let s:p.inactive.left =  [[s:colors.foreground, s:colors.win_bg], [s:colors.foreground, s:colors.win_bg]]
let s:p.inactive.right = [[s:colors.foreground, s:colors.win_bg], [s:colors.foreground, s:colors.win_bg]]
let s:p.inactive.middle = [[s:colors.foreground, s:colors.background_lighter]]

let s:p.tabline.left = [[s:colors.foreground, s:colors.background_lighter]]
let s:p.tabline.right = [[s:colors.background, s:colors.cyan]]
let s:p.tabline.middle = [[s:colors.foreground, s:colors.background_lighter]]
let s:p.tabline.tabsel = [[s:colors.background, s:colors.cyan]]

let g:lightline#colorscheme#ci_dark#palette = lightline#colorscheme#fill(s:p)
