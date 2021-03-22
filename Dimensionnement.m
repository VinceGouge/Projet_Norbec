%% Détermination des dimensions de l'échangeur de chaleur à partir d'un UA de 800
%Dimensions
Dp_i= 0.01; %m
Dp_e= 0.013; %m (épaisseur de 1.5mm)
N=20; %(nombres de tuyaux intérieurs)
Dg_i=0.30; %m
L=3; %m

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


% Viscosités dynamiques
visc_MDI = 0.19; % [Ns/m^2]
visc_H2O = 0.042; % Viscosité du Propylène Glycol [Ns/m^2]


%Résistance de convection interne des petits tuyaux
%(Eau-glycol qui circule dans les petits tuyaux)

%Résistance de conduction des petits tuyaux

%Résistance de convection externe des petits tuyaux
%(MDI qui a un effet convectif sur l'extérieur des petits tuyaux.)

%Résistance totale des petits tuyaux
%(20 tuyaux enb parallèle)


%La convection externe est négligée, ce qui sous-entend que l'échangeur est
%isolé. On ne calcule donc pas la convection du MDI sur la parois intérieur
%du gros tuyaux, ni la conduction dans le gros tuyau.


