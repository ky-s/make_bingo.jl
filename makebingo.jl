using Random: shuffle

# returns bingo card as 2-dim[5x5] Array.
#
# e.g.
# ["3" "27" "35" "49" "70";
#  "8" "28" "38" "46" "72";
#  "1" "21" " "  "47" "63";
#  "9" "30" "43" "60" "66";
#  "5" "16" "32" "51" "62"]
function makebingo()
    numbers_arr = [
         1:14, # B
        15:29, # I
        30:44, # N
        45:59, # G
        60:74, # O
    ]

    bingo = map(numbers_arr) do numbers
                shuffle(numbers)[1:5] .|> string
            end

    # center blank
    bingo[3][3] = " "

    # 5-element Array{Array{String,1},1}
    # => 5x5 Array{String,2}
    hcat(bingo...)
end

# currying join() that pre-set 2nd argment.
joinby(delim) = strings -> join(strings, delim)

# formatted for pretty print
function output(bingo)
    bingo_with_header = [
         "B" "I" "N" "G" "O";
         bingo
    ]

    map(1:6) do n
        row = bingo_with_header[n, :]

        lpad.(row, 2) |> joinby(" | ")

    end |> joinby("\n")
end

(output ∘ makebingo)() |> println
