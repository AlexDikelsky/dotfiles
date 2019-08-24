#! /bin/bash
#
# rust_square_root.sh
# Copyright (C) 2019 dikeal01 <dikeal01@ubuntu>
#
# Distributed under terms of the MIT license.
#

x=$(pwd)
cd /home/dikeal01/rust/other/games/pazaak || exit
cargo run
cd $x || exit

