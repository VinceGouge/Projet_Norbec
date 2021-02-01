% Document des variables et calcul pour la modélisation de l'échangeur de
% chaleur


% Information utile
% Action du PID : 2 à 20 mA



% Pression de sortie de pompe
p_MDI = 160 * 100000; % [Pa]
p_Poly = 160 * 100000; % [Pa]

% Débit maximal de sortie
debit_MDI = 35 * 1E-5 / 6; % [m^3/s]
debit_Poly = 17 * 1E-5 / 6; % [m^3/s]

% Température de sortie de l'échangeur de chaleur
T_out_MDI = 25; % [°C]
T_out_Poly = 30; % [°C]

% Aire de section dans l'échangeur
d_tube_big = 0.08; % [m]
d_tube_moy = 0.01; % [m]
d_tube_small = 0.006; % [m]
d_entree = 0.03; % [m]

A_tube_moy = 12 * pi * d_tube_moy^2 / 4; %
A_tube_small = 4 * pi * d_tube_small^2 / 4; %
A_tube_big = (pi * d_tube_big^2 / 4) - A_tube_moy - A_tube_small;

% Vitesse dans l'échangeur
v_ech_MDI = debit_MDI / (A_tube_small + A_tube_moy);
v_ech_Poly = debit_Poly / (A_tube_small + A_tube_moy);

% Vitesse à la sortie de la pompe