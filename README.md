# Logistic_warehouse
Program containing logistic warehouse, providing information about best path between magazines of destinations of the packages, using algorithm searching for all Hamiltonian cycles an choosing the best one in terms of distance of the trip. Program contains parent class of vehicles and children classes such as lorry, truck and train.

The approach to the problem of finding the cheapest way to transport all packages has been simplified by assuming that the means of thansport used to transit the packages cannot be modified during the trip (it is impossible to detach the wagon from the train or semitrailer from the lorry). After analyzing possibilities of loading 10000 packages to different vehicles, it was established, that no matter what is the weight of the packages, the chapest is transport by train. 

The only way to reduce the cost of the transit is to detach wagons after unloading specified amount of packages. Moreover, when having 7 wagons, the cost reduction occurs only after detaching 2 at once and reducing their number to 5.

The output of the program is a list of all magazines on the way with the amount of packages delivered to them, their total weight, value and cost of the whole transit.