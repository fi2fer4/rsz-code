function [Z, H] = gpsMeasurement(data, k, lat0, lon0, alt0)

lat = data.GPS.Pos(k,1);
lon = data.GPS.Pos(k,2);
alt = data.GPS.Pos(k,3);

x = (lat - lat0) * 111132;
y = (lon - lon0) * 111132 * cosd(lat0);
z = alt - alt0;

course = data.GPS.GCRs(k);
vx = data.GPS.Spd(k) * cosd(course); 
vy = data.GPS.Spd(k) * sind(course); 

Z = [x; y; z; vx; vy; data.GPS.VZ(k)];

H = zeros(6,16);
H(1:3,1:3) = eye(3);
H(4:6,4:6) = eye(3);
end
