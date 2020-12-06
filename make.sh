#!/bin/bash
menu (){
    opc="escolha"
    while true $opc != "escolha"
    do
        # lista diretorios
        declare -a pastas=`ls -d */`

        echo "================================================"
        echo "----> BEM VINDO AO GERENCIADOR DE BANCO!!"

        contador=1

        for pasta in ${pastas[@]}
        do
            if [ "$pasta" != "_imgs/" ]
            then   
                echo -e "------------| ${pasta%*\/}"
                declare -a bancos=`ls -d  $pasta*/`

                for banco in ${bancos[@]}
                do
                val=${banco#*\/}
                val=${val%*\/}
                echo -e "---| $contador ] Para o banco:  ${val}"
                mDir[contador]=${banco}
                ((contador=$contador+1))
                done
            fi
        done
        echo -e "------------| outros"
        echo -e "---| 0 ] Para sair"
        echo "================================================"
        echo  "Digite a opção desejada:."
        read opc

        clear

        if [ "$opc" == "0" ]
        then 
             echo "================================================"
            echo "----------------| Saindo, Tchauuu!!!!!!!"
            echo "================================================"
            break;
        elif [ -z "${mDir[opc]}" ]
        then             
            echo "================================================"
            echo "----------------| A Opção ${opc} é inválida!!!!!!!"
            echo "================================================"   
        else
            menu_docker  ${mDir[opc]}
            break;
        fi
    done
}

menu_docker(){
    pasta_banco=$1

    cd $pasta_banco

    opc_docker="escolha"
    while true $opc_docker != "escolha"
    do
        clear
         val=${pasta_banco#*\/}
         val=${val%*\/}
        echo "================================================"
        echo "----> Status dos containers do [${val}]"
        docker-compose ps
        echo "================================================"
        echo "----> Escolaha um opção para o banco ${val}::"
        echo -e " 1 ] Para criar/iniciar banco no docker"
        echo -e " 2 ] Para Parar o banco no docker"
        echo -e " 3 ] Para destruir banco no docker"
        echo -e " 0 ] Para sair"
        echo "================================================"
        echo  "Digite a opção desejada:."
        read opc_docker

        clear

        if [ "$opc_docker" == "0" ]
        then 
            echo "================================================"
            echo "----------------| Saindo, Tchauuu!!!!!!!"
            echo "================================================"
            break;
        fi

        case "$opc_docker" in
            1)
                echo "Criando ou Iniciando banco de dados"
                docker-compose up -d --build
                echo "Banco criado ou iniciado"
                echo "================================================"
                echo "----> Para mais informações leia ${pasta_banco}README.md"
                echo "================================================"
                break
            ;;
            2)
                echo "Parando o banco de dados"
                docker-compose down
                echo "Banco de dados parado"
                break
            ;;
            3)
                echo "Destruindo banco de dados"
                docker-compose down -v  --rmi all
                echo "Banco de dados destruido"
                break
            ;;
        esac
    done
}

clear

menu
