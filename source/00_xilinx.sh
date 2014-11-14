local vivado_settings="/opt/Xilinx/Vivado/2014.3/settings64.sh"
if [[ -e "$vivado_settings" ]]; then
    source "$vivado_settings"
fi
local sdk_settings="/opt/Xilinx/SDK/2014.3/settings64.sh"
if [[ -e "$sdk_settings" ]]; then
    source "$sdk_settings"
fi
