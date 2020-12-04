#!/bin/bash
opc="escolha"

menu (){
    while true $opc != "escolha"
    do
        clear

        # lista diretorios
        declare -a pastas=`ls -d */`

        # declarando map 
        declare -A mDir

        echo "================================================"
        echo "----> BEM VINDO AO GERENCIADOR DE BANCO!!"

        contador=1

        for pasta in ${pastas[@]}
        do
            if [ "$pasta" != "_imgs/" ]
            then   
                echo -e "------------| $pasta"
                declare -a bancos=`ls -d  $pasta*/`

                for banco in ${bancos[@]}
                do
                echo -e "---| $contador ] Para o banco:  $banco"
                ((contador=$contador+1))
                done
            fi
        done

        echo "================================================"

        echo  "Digite a opção desejada:."
        read opc

        case "$opc" in
        1)
            break
        ;;
        esac
    done
}
menu