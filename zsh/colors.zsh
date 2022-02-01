function color_pallete {
    for code in $(seq -f "%01g" 0 255);
    do
        echo -n -e "\x1B[38;05;${code}m [  $code: Test  ] ";
    done
    echo
}
