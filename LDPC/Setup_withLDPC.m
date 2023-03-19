clear;clc
%% Setup input
input_msg   = [1 0 0 1 1 0 1 0 1 1 0 1 1 0 0 0 1 0 1 1];
data_len    = length(input_msg);
ctrl_start  = zeros(1,data_len);
ctrl_end    = zeros(1,data_len);
ctrl_valid  = ones(1,data_len);
ctrl_start(1) = 1;
ctrl_end(data_len) = 0;
bgn = logical(0); % 0 = base graph number 1, 1 = base graph number 2
liftingSize = uint16(ones(1,data_len)); % setting the dimension for lifting size
liftingSize = uint16(liftingSize.*4); % giving it a valid value according to warning message

%% Get result
fprintf("running simulation\n");
open_system("CRC_withLDPC.slx");
out = sim("CRC_withLDPC.slx");
