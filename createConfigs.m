function cfgs = createConfigs()
%Vytvori konfiguracni strukturu podle tabulky z bodu 5
%
% Vystup:
%   cfgs(k):
%     .name
%     .prediction.imu
%     .update.gps
%     .update.baro
%     .update.baro_id
%     .update.mag
%     .update.mag_id

    % DEFINICE
    % jmeno            imu    baro_id   mag_id
    ekfDefs = {
        "EKF_IMU1",   "IMU1",  1,        1
        "EKF_IMU2",   "IMU2",  1,        1
        "EKF_IMU3",   "IMU3",  1,        1
        "EKF_BARO1",  "IMU1",  1,        1
        "EKF_BARO2",  "IMU1",  2,        1
        "EKF_MAG1",   "IMU1",  1,        1
        "EKF_MAG2",   "IMU1",  1,        2
    };

    % PREALOKACE
    n = size(ekfDefs, 1);
    cfgs(n) = struct();

    % VYPLNENI STRUKTURY
    for k = 1:n
        cfgs(k).name = ekfDefs{k,1};

        % Prediction
        cfgs(k).prediction.imu = ekfDefs{k,2};

        % Updates
        cfgs(k).update.gps  = true;

        cfgs(k).update.baro = true;
        cfgs(k).update.baro_id = ekfDefs{k,3};

        cfgs(k).update.mag  = true;
        cfgs(k).update.mag_id  = ekfDefs{k,4};
    end
end
