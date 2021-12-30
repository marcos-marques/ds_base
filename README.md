# Projeto DS BASE

Este repositório tem como objetivo fornecer um ambiente docker onde possamos compartilhar conhecimento relacionados a ciência de dados, como estudos sobre bibliotecas, algoritmos, técnicas, estatística, redes neurais ou análises exploratórios.

## Ambiente

> Pré requisitos

- Sistema operacional Ubuntu 18.4 >
- Possuir Docker instalado
- Possuir docker-compose instalado

**OBS:** *Para evitar erros durante a execução dos scripts aconselha-se executar o seguinte comando de forma recursiva no diretório do projeto* 
```
chmod -R +x ds_base/
```

1. Para gerar a imagem docker execute o seguinte comando a partir do diretório raiz desse projeto:

 ```
 ./build.sh
 ```
2. Em seguida execute o comando para subir o container:

```
docker-compose up -d
```
3. Uma vez subido o container você pode acessar o *Jupyter Notebook* no endereço [http://localhost:8088/lab?](http://localhost:8088/lab?)

4. Para remover o container execute o comando:

```
docker-compose down
```


