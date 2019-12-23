clc;
clear all;

Rt=4.1;
Rb=8.5;
h=4;
w=1;


QD.QDMaterial          = 'GaN';                                   % GaAs Si......
QD.CellMaterial        = 'AlN';
QD.CrystalStructure    = 'WZ';                                   % ZB(Zinc-blende)
QD.QDSize              = [Rt Rb h w];                            % Or [Din Dout h w];
QD.CellSize            = [25 25.0001 12]
QD.Shape               = 'Hexagon';                                % Or Pyramid or Ring;


Rt=QD.Size(1);
Rb=QD.Size(2);
h=QD.Size(3);




dirname = fullfile('QDs','QDdata',[ num2str(10*Rt) 't'  num2str(10*Rb) 'b'  num2str(10*h) 'h']);
cd('F:');
mkdir(dirname);
mfilename;