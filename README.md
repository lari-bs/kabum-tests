# Kabum Tests

Este projeto contém testes automatizados usando o Robot Framework para interagir com o website da Kabum (https://www.kabum.com.br/) e realizar testes.

## Pré-requisitos

Antes de executar os testes, você precisa ter as seguintes ferramentas instaladas:

- **Python**: Certifique-se de ter o Python instalado no seu sistema. Você pode baixar a versão mais recente em https://www.python.org/.
- **Robot Framework**: Para instalar o Robot Framework, execute o seguinte comando:

    ```
    pip install robotframework
    ```

- **SeleniumLibrary**: Para a automação do navegador, usamos a biblioteca SeleniumLibrary. Para instalá-la, execute:

    ```
    pip install robotframework-seleniumlibrary
    ```

- **WebDriver**: Você também precisará de um driver compatível com o navegador Chrome. Certifique-se de ter o Chrome instalado e baixe o driver apropriado em https://sites.google.com/a/chromium.org/chromedriver/downloads. Certifique-se de adicionar o diretório do driver ao seu PATH.

## Estrutura do Projeto

```
kabum-tests
├── kabum_test.robot
├── report.html
├── resources
│   ├── configurations.robot
│   └── keywords.robot
└── screenshots
    └── 2023-08-08-16:59:17
        ├── Login Test
        │   └── selenium-screenshot-1.png
        ├── Purchase Product
        │   └── selenium-screenshot-1.png
        └── Search Product
            └── selenium-screenshot-1.png
```

## Executando os Testes

1. Clone este repositório para o seu ambiente local.

2. Navegue até a pasta `kabum-tests` no terminal.

3. Execute os testes com o seguinte comando:

    ```
    robot kabum_test.robot
    ```

4. Após a execução, um arquivo de relatório `report.html` será gerado no diretório raiz. Abra-o em um navegador para visualizar os resultados dos testes.

## Observações

- A pasta `screenshots` contém capturas de tela tiradas durante a execução dos testes. Cada pasta com data e hora contém capturas de tela para os testes individuais.