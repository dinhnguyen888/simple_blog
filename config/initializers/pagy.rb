require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'

# Instance variables
# See https://ddnexus.github.io/pagy/api/pagy#instance-variables
Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:size]  = [1, 2, 2, 1]

# Other Variables
Pagy::DEFAULT[:overflow] = :last_page

# Better looking defaults
Pagy::DEFAULT[:nav_link] = "<span class=\"px-3 py-2 mx-1 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 rounded-lg cursor-pointer\">%{link}</span>"
Pagy::DEFAULT[:nav_prev] = "<span class=\"px-3 py-2 mx-1 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 rounded-lg cursor-pointer\">&lsaquo;</span>"
Pagy::DEFAULT[:nav_next] = "<span class=\"px-3 py-2 mx-1 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 rounded-lg cursor-pointer\">&rsaquo;</span>"