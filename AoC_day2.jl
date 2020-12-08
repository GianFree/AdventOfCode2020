### A Pluto.jl notebook ###
# v0.12.12

using Markdown
using InteractiveUtils

# ╔═╡ b7f27a5e-387a-11eb-3531-7d2fc384b0d9
md"""
# Day 2
"""

# ╔═╡ 28d0ca84-3879-11eb-3e71-678d06a6810a
md"""
## Part 1
**We need to check a password database that has been compromised**.

The file format of the data is:
```
1-3 a: abcde
1-3 b: cdefg
```

where `1-3 a` means that in the password there must be `a` at least once up to 3 times. Therefore the second entry is not valid.


The **goal** is to know how many valid password there are left.
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

# ╔═╡ 8dd7cba4-3963-11eb-3895-e9d296d585cc
function parser_entry(entry)
	substrs = split(entry, ':')
	minmaxlett = split(substrs[1], ' ')
	min_times, max_times = [parse(Int64, num) for num in split(minmaxlett[1], '-')]
	# `only` is required to have a char and not a string type
	letter = only(minmaxlett[2])
	password = substrs[2]
	return min_times, max_times, letter, password
end

# ╔═╡ 9a951ca8-3962-11eb-0eaf-cd73c01b42ee
function is_password_ok(entry)
	min_times, max_times, letter, password = parser_entry(entry)
	letter_occurence = count(i->(i==letter), password)
	if letter_occurence >= min_times && letter_occurence <= max_times
		return 1
	else
		return 0
	end 	
end

# ╔═╡ 6d0e8c92-3962-11eb-2c08-c966c9c7cb87
# Readind the data as an array of `num letter: string`
data = read_data("input_files/day2_input.dat")

# ╔═╡ fc6bbd6a-3967-11eb-0159-2bab4ab05dc5
answer_1 = sum(is_password_ok.(data))

# ╔═╡ cfa0070e-3968-11eb-3b5a-1d2f2cf0c37c
md"""
The answer is $answer_1.
"""

# ╔═╡ d08ffbba-3880-11eb-05d6-a7637750b58e
md"""
## Part 2
**The rules for the password are different, though!**.

`1-3 a` means that the letter `a` has to be in position `1` xor `3` to be valid!

**How many are the correct passwords?**
"""

# ╔═╡ c8e2cce0-3881-11eb-18fc-1bf74ab9301c
function is_password_really_ok(entry)
	pos_1, pos_2, letter, password = parser_entry(entry)
	trim_password = strip(password)
	println(trim_password)
	if (trim_password[pos_1] == letter) && !(trim_password[pos_2] == letter)
		return 1
	elseif !(trim_password[pos_1] == letter) && (trim_password[pos_2] == letter)
		return 1
	else
		return 0
	end 	
end

# ╔═╡ 3a6848aa-396c-11eb-174d-075b08b87b7f
answer_2 = sum(is_password_really_ok.(data))

# ╔═╡ 27db654a-3882-11eb-333b-8373ef6f9f02
md"""
The answer to this second puzzle is $answer_2.
"""

# ╔═╡ Cell order:
# ╟─b7f27a5e-387a-11eb-3531-7d2fc384b0d9
# ╟─28d0ca84-3879-11eb-3e71-678d06a6810a
# ╠═74a02316-387a-11eb-0f44-59adc2349951
# ╠═8dd7cba4-3963-11eb-3895-e9d296d585cc
# ╠═9a951ca8-3962-11eb-0eaf-cd73c01b42ee
# ╠═6d0e8c92-3962-11eb-2c08-c966c9c7cb87
# ╠═fc6bbd6a-3967-11eb-0159-2bab4ab05dc5
# ╟─cfa0070e-3968-11eb-3b5a-1d2f2cf0c37c
# ╟─d08ffbba-3880-11eb-05d6-a7637750b58e
# ╟─c8e2cce0-3881-11eb-18fc-1bf74ab9301c
# ╟─3a6848aa-396c-11eb-174d-075b08b87b7f
# ╟─27db654a-3882-11eb-333b-8373ef6f9f02
