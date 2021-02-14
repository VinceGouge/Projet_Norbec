% Document des variables et calcul pour la modélisation de l'échangeur de
% chaleur


% Information utile
% Action du PID : 2 à 20 mA

%--------------------------------------------------------------------------
% Propriété des fluides

% Densité
rho_MDI = 1250; %[kg/m^3]
rho_Poly = 1210; %[kg/m^3]
rho_H2O = 1034; %[kg/m^3]

% Conductivité thermique
k_MDI = 0.08648; % [W/m K]
k_Poly = 0.1557; % [W/m K]
k_H2O = 0.147; % [W/m K]
k_acier = 36; % [W/m K]

% Chaleur spécifique
cp_MDI = 0;
cp_Poly = 0;
cp_H2O = 3915; % [J/kg K]

%--------------------------------------------------------------------------

% Pression de sortie de pompe
p_MDI = 160 * 100000; % [Pa]
p_Poly = 160 * 100000; % [Pa]

% Débit des fluides
debit_MDI = 35 * 1E-5 / 6; % [m^3/s] valeur maximale de sortie
debit_Poly = 17 * 1E-5 / 6; % [m^3/s] valeur maximale de sortie
debit_H2O = 0; % Variable en fonction de la valve

% Température de sortie de l'échangeur de chaleur
T_out_MDI = 25; % [°C]
T_out_Poly = 30; % [°C]

% Aire de section dans l'échangeur
d_tube_big = 0.08; % [m]
d_tube_moy = 0.01; % [m]
d_tube_small = 0.006; % [m]
d_entree = 0.03; % [m]

A_tube_moy = 12 * pi * d_tube_moy^2 / 4; % [m^2]
A_tube_small = 4 * pi * d_tube_small^2 / 4; % [m^2]
A_tube_big = (pi * d_tube_big^2 / 4) - A_tube_moy - A_tube_small; % [m^2]

% Vitesse dans l'échangeur
v_ech_MDI = debit_MDI / A_tube_big; % [m/s]
v_ech_Poly = debit_Poly / A_tube_big; % [m/s]
v_ech_H2O = debit_H2O / (A_tube_small + A_tube_moy); % [m/s]

% Vitesse à la sortie de la pompe