function yaw = yawFromQuat(q)
    e = quat2eul(q');   % [yaw pitch roll] (MATLAB ZYX)
    yaw = e(1);
end
