using Random

function makebingo()
    bingo = map(i -> string.(shuffle(i:i+14)[1:5]), 1:15:75)

    bingo[3][3] = " "

    hcat(bingo...)
end


function output(bingo)
    bingo_with_header = ["B" "I" "N" "G" "O"; bingo]
    join(map(i -> join(lpad.(bingo_with_header[i, :], 2), " | "), 1:6), "\n")
end

println(output(makebingo()))
