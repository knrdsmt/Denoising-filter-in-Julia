begin
using Images

function konwolucja_obrazu(obraz)
    # maski
    maska = [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2]/159 #5x5
    maska2 = [1 2 1; 2 4 2; 1 2 1]/16 #3x3

    #wymiary obrazu
    wysokosc, szerokosc = size(obraz)

    # sprawdzenie skali szarości
    if typeof(obraz[1, 1]) <: ColorTypes.AbstractGray
        # nowy obraz w Array{Float64, 2}
        obraz_float = [Float64(obraz[i, j]) for i in 1:wysokosc, j in 1:szerokosc]

        # kopia obrazu
        obraz_wynikowy = copy(obraz_float)

        # konwolucja
        for i in 3:wysokosc-2, j in 3:szerokosc-2, m in -2:2, n in -2:2
            obraz_wynikowy[i, j] += sum(obraz_float[i+m, j+n] * maska[m+3, n+3])
        end

        #konwolucja krawędzi
		for i in 2:wysokosc-1, j in 2:szerokosc-1, m in -1:1, n in -1:1
    		if 1 <= i+m <= size(obraz_float, 1) && 1 <= j+n <= size(obraz_float, 2)
        	obraz_wynikowy[i, j] += obraz_float[i+m, j+n] * maska2[m+2, n+2]
    		end
		end
		
        # normalizacja obrazu
        obraz_wynikowy .-= minimum(obraz_wynikowy)
        obraz_wynikowy ./= maximum(obraz_wynikowy)

        return obraz_wynikowy
    else
        #nowy obraz w Array{Float64, 3}
        obraz_float = zeros(Float64, wysokosc, szerokosc, 3)

		# kopia obrazu
        obraz_wynikowy = copy(obraz_float)
		
        # konwersja na Float64
        for i in 1:wysokosc, j in 1:szerokosc
            
            piksel = obraz[i, j]
            obraz_float[i, j, 1] = Float64(piksel.r)
            obraz_float[i, j, 2] = Float64(piksel.g)
            obraz_float[i, j, 3] = Float64(piksel.b)
        end
		
		# konwolucja
		for k in 1:3
    		for i in 3:wysokosc-2, j in 3:szerokosc-2, m in -2:2, n in -2:2
        	obraz_wynikowy[i, j, k] += sum(obraz_float[i+m, j+n, k] * maska[m+3, n+3])
    		end
		end
		
		# konwolucja krawędzi
		for k in 1:3
    		for i in 2:wysokosc-1, j in 2:szerokosc-1, m in -1:1, n in -1:1
        	   if 1 <= i+m <= size(obraz_float, 1) && 1 <= j+n <= size(obraz_float, 2)
            	obraz_wynikowy[i, j, k] += obraz_float[i+m, j+n, k] * maska2[m+2, n+2]
        		end
    		end
		end
        

        # normalizacja obrazu
        obraz_wynikowy .-= minimum(obraz_wynikowy)
        obraz_wynikowy ./= maximum(obraz_wynikowy)

        return obraz_wynikowy
    end
end


# Wczytanie obrazu
load_path = "noised_image_path"
obraz = load(load_path)
	
# Wywołanie funkcji konwolucji
wynik = konwolucja_obrazu(obraz)
	
# Zapisanie nowego obrazu
save_path = "filtered_image_path"
save(save_path, wynik)
	
println("  Image filtered")
end
