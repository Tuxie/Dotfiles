# Some distros install the cli tool as zed, others as zeditor

if (( $+commands[zeditor] )) && (( ! $+commands[zed] )); then
    alias zed=zeditor
elif (( $+commands[zed] )) && (( ! $+commands[zeditor] )); then
    alias zeditor=zed
fi

if [[ -n $TLSESSIONDATA ]]; then
    # Emulated GPU is all we have in ThinLinc
    export ZED_ALLOW_EMULATED_GPU=1
fi
