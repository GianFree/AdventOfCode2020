### A Pluto.jl notebook ###
# v0.12.12

using Markdown
using InteractiveUtils

# ╔═╡ b7f27a5e-387a-11eb-3531-7d2fc384b0d9
md"""
# Day 1
"""

# ╔═╡ 28d0ca84-3879-11eb-3e71-678d06a6810a
md"""
## Part 1
**We need to find TWO numbers whose sum is 2020 and provide their product**.

We want to read the input file to solve the first advent of code.
"""

# ╔═╡ 74a02316-387a-11eb-0f44-59adc2349951
function read_data(filename)
	"""
	We want to read the file provided. 
	It returns an array of string that we have to convert.
	"""
	open(filename) do io
		readlines(io)
	end	
end

# ╔═╡ e78a5ea0-387d-11eb-18b3-6372f503db67
function get_day1_data(filename, kind=Int64)
	"""
	Return an array with the proper type. 
	Default `Int64`.
	"""
	return [parse(kind, num) for num in read_data(filename)]
end

# ╔═╡ df54fe9e-387c-11eb-1388-533d38d1fee5
a = get_day1_data("day1_input.csv")

# ╔═╡ ef11d8e4-387b-11eb-18f8-15f500f76ff7
# Number of elements
N = length(a)

# ╔═╡ 37bad250-387f-11eb-0b3d-b31f046a1030
let 
	x = nothing
	for i in 1:N-1
		for j in i+1:N
			if a[i] + a[j] == 2020
			 x = (a[i], a[j],a[i]*a[j])
			end
		end
	end
	x
end

# ╔═╡ 723d943e-3880-11eb-3166-53ad444afd76
md"""
The answer of the puzzle is `646779`.
"""

# ╔═╡ d08ffbba-3880-11eb-05d6-a7637750b58e
md"""
## Part 2
**We need to find THREE numbers whose sum is 2020 and provide their product**.

I don't know an algorithm to do this in a smart way.
Let's try the brute force first.

"""

# ╔═╡ c8e2cce0-3881-11eb-18fc-1bf74ab9301c
let 
	x = nothing
	for i in 1:N-2
		for j in i+1:N-1
			for k in i+2:N
				if a[i] + a[j] + a[k] == 2020
			 		x = (a[i], a[j], a[k], a[i]*a[j]*a[k])
				end
			end
		end
	end
	x
end

# ╔═╡ 27db654a-3882-11eb-333b-8373ef6f9f02
md"""
The answer to this second puzzle is `246191688`.
"""

# ╔═╡ Cell order:
# ╟─b7f27a5e-387a-11eb-3531-7d2fc384b0d9
# ╠═28d0ca84-3879-11eb-3e71-678d06a6810a
# ╠═74a02316-387a-11eb-0f44-59adc2349951
# ╠═e78a5ea0-387d-11eb-18b3-6372f503db67
# ╠═df54fe9e-387c-11eb-1388-533d38d1fee5
# ╟─ef11d8e4-387b-11eb-18f8-15f500f76ff7
# ╠═37bad250-387f-11eb-0b3d-b31f046a1030
# ╟─723d943e-3880-11eb-3166-53ad444afd76
# ╟─d08ffbba-3880-11eb-05d6-a7637750b58e
# ╟─c8e2cce0-3881-11eb-18fc-1bf74ab9301c
# ╟─27db654a-3882-11eb-333b-8373ef6f9f02
