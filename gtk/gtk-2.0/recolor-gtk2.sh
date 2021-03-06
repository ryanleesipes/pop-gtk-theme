#! /bin/bash
#
# This file is part of pop-gtk-theme
#
# Copyright (C) 2016-2017 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

SRC_FILE="colors.rc"
SRC_DARK_FILE="colors-dark.rc"

# Default colours
selection1="#00BCD4"
accent1="#4DB6AC"
background1="#222D32"
scroll1="#A5AAAD"
foreground1="#CFD8DC"
text1="#263238"
tebg1="#29353B"
panel1="#13191C"
secdark1="#243035"

# Check and re-color 'selection-color' and 'accent-color'
if [ -e "../sass/common/_key_colors.scss" ]; then
    selection2="`grep 'key_selection' ../sass/common/_key_colors.scss | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' ../sass/common/_key_colors.scss | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    background2="#45413f"
    foreground2="#F6F6F6"
    tebg2="#413e3c"
    panel2="#2c2825"

    cp -f $SRC_FILE.in $SRC_FILE && cp -f $SRC_DARK_FILE.in $SRC_DARK_FILE

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $SRC_FILE
        echo $selection1 is re-colored with $selection2 in $SRC_FILE.
        sed -i "s/$selection1/$selection2/gi" $SRC_DARK_FILE
        echo $selection1 is re-colored with $selection2 in $SRC_DARK_FILE.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $SRC_FILE
        echo $accent1 is re-colored with $accent2 in $SRC_FILE.
        sed -i "s/$accent1/$accent2/gi" $SRC_DARK_FILE
        echo $accent1 is re-colored with $accent2 in $SRC_DARK_FILE.
        sed -i "s/$scroll1/$accent2/gi" $SRC_FILE
        echo $scroll1 is re-colored with $accent2 in $SRC_FILE.
        sed -i "s/$scroll1/$accent2/gi" $SRC_DARK_FILE
        echo $scroll1 is re-colored with $accent2 in $SRC_DARK_FILE.
    fi
    if [ $background1 != $background2 ]; then
        sed -i "s/$background1/$background2/gi" $SRC_FILE
        echo $background1 is re-colored with $background2 in $SRC_FILE.
        sed -i "s/$background1/$background2/gi" $SRC_DARK_FILE
        echo $background1 is re-colored with $background2 in $SRC_DARK_FILE.
        sed -i "s/$text1/$background2/gi" $SRC_FILE
        echo $text1 is re-colored with $background2 in $SRC_FILE.
        sed -i "s/$text1/$background2/gi" $SRC_DARK_FILE
        echo $text1 is re-colored with $background2 in $SRC_DARK_FILE.
    fi
    if [ $foreground1 != $foreground2 ]; then
        sed -i "s/$foreground1/$foreground2/gi" $SRC_FILE
        echo $foreground1 is re-colored with $foreground2 in $SRC_FILE.
        sed -i "s/$foreground1/$foreground2/gi" $SRC_DARK_FILE
        echo $foreground1 is re-colored with $foreground2 in $SRC_DARK_FILE.
    fi
    if [ $tebg1 != $tebg2 ]; then
        sed -i "s/$tebg1/$tebg2/gi" $SRC_FILE
        echo $tebg1 is re-colored with $tebg2 in $SRC_FILE.
        sed -i "s/$tebg1/$tebg2/gi" $SRC_DARK_FILE
        echo $tebg1 is re-colored with $tebg2 in $SRC_DARK_FILE
    fi
    if [ $panel1 != $panel2 ]; then
        sed -i "s/$panel1/$panel2/gi" $SRC_FILE
        echo $panel1 is re-colored with $panel2 in $SRC_FILE.
        sed -i "s/$panel1/$panel2/gi" $SRC_DARK_FILE
        echo $panel1 is re-colored with $panel2 in $SRC_DARK_FILE.
        sed -i "s/$secdark1/$panel2/gi" $SRC_FILE
        echo $secdark1 is re-colored with $panel2 in $SRC_FILE.
        sed -i "s/$secdark1/$panel2/gi" $SRC_DARK_FILE
        echo $secdark1 is re-colored with $panel2 in $SRC_DARK_FILE.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
