% Document des variables et calcul pour la modélisation de l'échangeur de
% chaleur

clear; clc;

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
cp_MDI = 1800; % [J/kg K]
cp_Poly = 2270; % [J/kg K]
cp_H2O = 3915; % [J/kg K]

% Coefficient de convection
h_int_MDI = 4.452; % [W/m^2 K]
h_int_poly = 8.015; % [W/m^2 K]


% Viscosités dynamiques

visc_MDI = 0.19; % [Ns/m^2]


% Débit volumique

%% Transfert thermique

% Prandlt

Pr_lam_plaque_MDI = 10;
Pr_lam_plaque_Poly = 10;

Pr_H2O = 70; % 30% à température de 0 degrés

% Nucet

Nucet_lam_MDI = 3.66;


%--------------------------------------------------------------------------

% Pression de sortie de pompe
p_MDI = 160 * 100000; % [Pa]
p_Poly = 160 * 100000; % [Pa]

% Débit des fluides
debit_MDI = 35 * 1E-5 / 6; % [m^3/s] valeur maximale de sortie
debit_Poly = 17 * 1E-5 / 6; % [m^3/s] valeur maximale de sortie
debit_H2O = 0; % Variable en fonction de la valve

% Température de sortie de l'échangeur de chaleur
T_in = 50; % [°C]
T_out_MDI = 25; % [°C]
T_out_Poly = 30; % [°C]
T_in_H2O = -10; % [°C]

% Aire de section dans l'échangeur
d_tube_big_ext = 0.106; % [m]
d_tube_big_int = 0.08; % [m]
d_tube_moy_ext = 0.01; % [m]
d_tube_moy_int = 0.007; % [m]
d_tube_small_ext = 0.006; % [m]
d_tube_small_int = 0.004; % [m]
d_entree = 0.03; % [m]


A_tube_moy_ext = 12 * pi * d_tube_moy_ext^2 / 4; % [m^2]
A_tube_small_ext = 4 * pi * d_tube_small_ext^2 / 4; % [m^2]
A_tube_big_int = (pi * d_tube_big_int^2 / 4) - A_tube_moy_ext - A_tube_small_ext; % [m^2]

% Longeur de l'échangeur
L = 2.720; % [m]

% Vitesse dans l'échangeur
v_ech_MDI = debit_MDI / A_tube_big_int; % [m/s]
v_ech_Poly = debit_Poly / A_tube_big_int; % [m/s]
v_ech_H2O = debit_H2O / (A_tube_small_ext + A_tube_moy_ext); % [m/s]

%--------------------------------------------------------------------------

% Approximation du transfert de chaleur nécessaire pour les produits

q_MDI = debit_MDI * cp_MDI * (T_in - T_out_MDI); % [W]
q_Poly = debit_Poly * cp_Poly * (T_in - T_out_Poly); % [W]

deltaT = [];
Q_H20_MDI = [];
Q_H20_Poly = [];

for i=1:10
    deltaT(i) = 0.5*i;
    Q_H20_MDI(i) = q_MDI / (rho_H2O * cp_H2O * deltaT(i));
    Q_H20_Poly(i) = q_Poly / (rho_H2O * cp_H2O * deltaT(i));
    
end



% Calcul de débit de refroidissant

D_tuyau_H2O = 1.25 * 25.4 / 1000; % [m]
visc_H2O = 0.042; % Viscosité du Propylène Glycol [Ns/m^2]
eps = 0.05/1000; % [m]

